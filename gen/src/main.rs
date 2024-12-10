use std::env;

use lang_c::driver::{parse, Config};
use lang_c::print::Printer;
use lang_c::visit::Visit;

fn main() {
    let args: Vec<String> = env::args().collect();

    let llvm_project_path = &args[1];

    env::set_current_dir(format!("{}/llvm/include/llvm-c", llvm_project_path))
        .expect("failed to set path");
    let mut config = Config::default();

    config
        .cpp_options
        .push(format!("-I{}/llvm/include", llvm_project_path));
    config
        .cpp_options
        .push("-I/Library/Developer/CommandLineTools/Library/PrivateFrameworks/LLDB.framework/Versions/A/Resources/Clang/include/".to_string());
    config
        .cpp_options
        .push("-I/Library/Developer/CommandLineTools/SDKs/MacOSX15.1.sdk/usr/include/".to_string());

    let p = parse(&config, "Core.h").expect("parse failed");

    let s = &mut String::new();
    Printer::new(s).visit_translation_unit(&p.unit);
    println!("{:?}", s);
}
