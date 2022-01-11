mod expr;
mod scope;
mod stmt;

use std::sync::Arc;

use ast::types::{DataType, ScalarType};
use ast::{
    AccessMode, AssignmentLhs, AttrList, Expr, ExprNode, FnAttr, FnDecl, GlobalVarAttr,
    GlobalVarDecl, Lit, Module, Postfix, ShaderStage, Statement, StorageClass, StructDecl,
    StructMember, VarQualifier,
};
use rand::prelude::StdRng;
use rand::Rng;

use crate::generator::expr::ExprGenerator;
use crate::generator::stmt::ScopedStmtGenerator;

pub struct Generator {
    rng: StdRng,
    next_fn: u32,
}

impl Generator {
    pub fn new(rng: StdRng) -> Self {
        Generator { rng, next_fn: 0 }
    }

    pub fn gen_module(&mut self) -> Module {
        log::info!("generating module");

        let fn_count = self.rng.gen_range(0..10);
        let functions = (0..fn_count).map(|_| self.gen_function()).collect();

        Module {
            structs: vec![StructDecl {
                name: "Buffer".to_owned(),
                members: vec![StructMember {
                    name: "data".to_owned(),
                    data_type: DataType::Array(Arc::new(DataType::Scalar(ScalarType::U32))),
                }],
            }],
            vars: vec![GlobalVarDecl {
                attrs: AttrList(vec![GlobalVarAttr::Group(0), GlobalVarAttr::Binding(0)]),
                qualifier: Some(VarQualifier {
                    storage_class: StorageClass::Storage,
                    access_mode: Some(AccessMode::ReadWrite),
                }),
                name: "output".to_owned(),
                data_type: DataType::User(Arc::new("Buffer".to_owned())),
                initializer: None,
            }],
            functions,
            entrypoint: self.gen_entrypoint_function(),
        }
    }

    fn gen_function(&mut self) -> FnDecl {
        let stmt_count = self.rng.gen_range(0..50);
        let stmts = ScopedStmtGenerator::new(&mut self.rng).gen_block(stmt_count);

        FnDecl {
            attrs: AttrList(vec![]),
            name: self.next_fn(),
            inputs: vec![],
            output: None,
            body: stmts,
        }
    }

    fn gen_entrypoint_function(&mut self) -> FnDecl {
        let stmt_count = self.rng.gen_range(0..50);
        let mut gen = ScopedStmtGenerator::new(&mut self.rng);
        let mut stmts = gen.gen_block(stmt_count);
        let scope = gen.into_scope();

        log::info!("generating output assignment");

        stmts.push(Statement::Assignment(
            AssignmentLhs::Simple(
                "output".to_owned(),
                vec![
                    Postfix::Member("data".to_owned()),
                    Postfix::ArrayIndex(Box::new(ExprNode {
                        data_type: DataType::Scalar(ScalarType::U32),
                        expr: Expr::Lit(Lit::UInt(0)),
                    })),
                ],
            ),
            ExprGenerator::new(&mut self.rng, &scope).gen_expr(&DataType::Scalar(ScalarType::U32)),
        ));

        FnDecl {
            attrs: AttrList(vec![
                FnAttr::Stage(ShaderStage::Compute),
                FnAttr::WorkgroupSize(1),
            ]),
            name: "main".to_owned(),
            inputs: vec![],
            output: None,
            body: stmts,
        }
    }

    fn next_fn(&mut self) -> String {
        self.next_fn += 1;
        format!("func_{}", self.next_fn)
    }
}
