use ast::types::{DataType, ScalarType};
use ast::{AssignmentLhs, ExprNode, Statement};
use rand::prelude::{SliceRandom, StdRng};
use rand::Rng;

use super::expr::ExprGenerator;
use super::scope::{FnRegistry, Scope};

pub struct ScopedStmtGenerator<'a> {
    rng: &'a mut StdRng,
    fns: &'a mut FnRegistry,
    scope: Scope,
    return_type: Option<DataType>,
    depth: u32,
}

#[derive(Clone, Copy)]
enum StatementType {
    LetDecl,
    VarDecl,
    Assignment,
    Compound,
    If,
    Return,
}

impl<'a> ScopedStmtGenerator<'a> {
    pub fn new<'b>(
        rng: &'a mut StdRng,
        parent: &'b Scope,
        return_type: Option<DataType>,
        fns: &'a mut FnRegistry,
    ) -> ScopedStmtGenerator<'a> {
        ScopedStmtGenerator {
            rng,
            fns,
            scope: parent.clone(),
            return_type,
            depth: 0,
        }
    }

    fn new_scope(&mut self) -> ScopedStmtGenerator {
        ScopedStmtGenerator {
            rng: self.rng,
            scope: self.scope.clone(),
            return_type: self.return_type.clone(),
            fns: self.fns,
            depth: self.depth + 1,
        }
    }

    pub fn gen_stmt(&mut self) -> Statement {
        log::info!("generating statement");

        let mut allowed = vec![
            StatementType::LetDecl,
            StatementType::VarDecl,
            StatementType::Return,
        ];

        if self.scope.has_vars() {
            allowed.push(StatementType::Assignment);
        }

        if self.depth < 5 {
            allowed.extend_from_slice(&[StatementType::Compound, StatementType::If]);
        }

        let weights = |t: &StatementType| match t {
            StatementType::LetDecl => 10,
            StatementType::VarDecl => 10,
            StatementType::Assignment => 10,
            StatementType::Compound => 1,
            StatementType::If => 10,
            StatementType::Return => 1,
        };

        match allowed.choose_weighted(&mut self.rng, weights).unwrap() {
            StatementType::LetDecl => {
                let ty = self.gen_ty();
                Statement::LetDecl(self.scope.next_var(), self.gen_expr(&ty))
            }
            StatementType::VarDecl => {
                let ty = self.gen_ty();
                Statement::VarDecl(self.scope.next_var(), self.gen_expr(&ty))
            }
            StatementType::Assignment => {
                let (name, data_type) = self.scope.choose_var(&mut self.rng);
                let data_type = data_type.clone();
                Statement::Assignment(
                    AssignmentLhs::Simple(name.clone(), vec![]),
                    self.gen_expr(&data_type),
                )
            }
            StatementType::Compound => {
                let max_count = self.rng.gen_range(0..10);
                Statement::Compound(self.new_scope().gen_block(max_count))
            }
            StatementType::If => {
                let max_count = self.rng.gen_range(0..10);
                Statement::If(
                    self.gen_expr(&DataType::Scalar(ScalarType::Bool)),
                    self.new_scope().gen_block(max_count),
                )
            }
            StatementType::Return => Statement::Return(
                self.return_type
                    .clone()
                    .as_ref()
                    .map(|ty| self.gen_expr(ty)),
            ),
        }
    }

    pub fn gen_block(&mut self, max_count: u32) -> Vec<Statement> {
        log::info!("generating block of max={} statements", max_count);

        let mut stmts = vec![];

        for _ in 0..max_count {
            let stmt = self.gen_stmt();

            // If we generated a variable declaration, track it in the environment
            if let Statement::LetDecl(name, expr) = &stmt {
                self.scope.insert_let(name.clone(), expr.data_type.clone());
            } else if let Statement::VarDecl(name, expr) = &stmt {
                self.scope.insert_var(name.clone(), expr.data_type.clone());
            } else if let Statement::Return(_) = &stmt {
                // Return statement must be the last statement
                return stmts;
            }

            stmts.push(stmt);
        }

        stmts
    }

    fn gen_ty(&mut self) -> DataType {
        let scalar_ty = [ScalarType::I32, ScalarType::U32, ScalarType::Bool]
            .choose(&mut self.rng)
            .copied()
            .unwrap();

        match self.rng.gen_range(0..2) {
            0 => DataType::Scalar(scalar_ty),
            1 => DataType::Vector(self.rng.gen_range(2..=4), scalar_ty),
            _ => unreachable!(),
        }
    }

    fn gen_expr(&mut self, ty: &DataType) -> ExprNode {
        ExprGenerator::new(self.rng, &self.scope, self.fns).gen_expr(ty)
    }

    pub fn into_scope(self) -> Scope {
        self.scope
    }
}
