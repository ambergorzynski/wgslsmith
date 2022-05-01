use std::io::Read;

fn main() -> eyre::Result<()> {
    let input = read_stdin()?;
    let ast = parser::parse(&input);
    let result = reconditioner::recondition(ast);

    println!("{}", include_str!("prelude.wgsl"));

    if result.loop_count > 0 {
        println!(
            "var<private> LOOP_COUNTERS: array<u32, {}>;",
            result.loop_count
        );
        println!();
    }

    struct Output(std::io::Stdout);

    impl std::fmt::Write for Output {
        fn write_str(&mut self, s: &str) -> std::fmt::Result {
            use std::io::Write;
            self.0.write_all(s.as_bytes()).unwrap();
            Ok(())
        }
    }

    ast::writer::Writer::default()
        .write_module(&mut Output(std::io::stdout()), &result.ast)
        .unwrap();

    Ok(())
}

fn read_stdin() -> eyre::Result<String> {
    let mut input = String::new();
    std::io::stdin().read_to_string(&mut input)?;
    Ok(input)
}
