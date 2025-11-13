use std::fs::File;
use std::io::Read;

// Hardcoded credentials
const PASSWORD: &str = "admin123";
const API_KEY: &str = "sk-1234567890abcdef";

// Unused variable
fn unused_variable() -> i32 {
    let x = 10;
    let y = 20; // never used
    x
}

// Potential panic from unwrap
fn unsafe_unwrap(text: Option<String>) -> String {
    text.unwrap() // Could panic if None
}

// Potential index out of bounds
fn unsafe_index(vec: Vec<i32>, idx: usize) -> i32 {
    vec[idx] // Could panic if idx >= vec.len()
}

// Unchecked division
fn divide_by_zero(a: i32, b: i32) -> i32 {
    a / b // Could panic if b is zero
}

// Using expect without meaningful message
fn poor_expect(result: Result<i32, String>) -> i32 {
    result.expect("error") // Not descriptive
}

// Unused Result
fn unused_result() {
    File::open("file.txt"); // Result ignored
}

// Mutable static without synchronization
static mut COUNTER: i32 = 0;

fn increment_counter() {
    unsafe {
        COUNTER += 1; // Unsafe mutable static access
    }
}

// Unnecessary unsafe block
fn unnecessary_unsafe() -> i32 {
    unsafe {
        42 // No unsafe operation needed
    }
}

// Clone on Copy type
fn unnecessary_clone() {
    let x = 5;
    let y = x.clone(); // i32 is Copy, clone not needed
}

// Using to_string() on &str
fn inefficient_string() -> String {
    "hello".to_string() // Could use to_owned() or String::from()
}

// Unreachable code
fn unreachable_code() -> i32 {
    return 42;
    println!("Never executed"); // Unreachable
}

// Infinite loop without break
fn infinite_loop() {
    loop {
        break;
        println!("Unreachable"); // Unreachable code
    }
}

// Unused import (if this were at the top and not used)
// use std::collections::HashMap;

// Missing error propagation
fn missing_error_propagation() -> Result<String, std::io::Error> {
    let mut file = File::open("file.txt")?;
    let mut contents = String::new();
    file.read_to_string(&mut contents).unwrap(); // Should use ?
    Ok(contents)
}

fn main() {
    println!("Example with issues");
}
