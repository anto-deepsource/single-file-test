import Foundation

// Hardcoded password
let password = "admin123"
let apiKey = "sk-1234567890abcdef"

// Force unwrapping optionals
func forceUnwrap(text: String?) -> Int {
    return text!.count  // Could crash if text is nil
}

// SQL injection vulnerability
func sqlInjection(username: String) -> String {
    let query = "SELECT * FROM users WHERE username = '\(username)'"
    return query
}

// Unused variable
func unusedVariable() -> Int {
    let x = 10
    let y = 20  // never used
    return x
}

// Implicitly unwrapped optional misuse
var implicitlyUnwrapped: String!

func useImplicitlyUnwrapped() {
    print(implicitlyUnwrapped.count)  // Could crash if nil
}

// Force try without error handling
func forceTry() {
    let data = try! String(contentsOfFile: "file.txt")
}

// Missing error handling
func noErrorHandling(url: URL) {
    let data = try? Data(contentsOf: url)
    // Error silently ignored
}

// Potential division by zero
func divideByZero(a: Int, b: Int) -> Int {
    return a / b  // b might be zero
}

// Retain cycle - strong reference
class Parent {
    var child: Child?
}

class Child {
    var parent: Parent?  // Should be weak to avoid retain cycle
}

// Using as! (forced downcast)
func forcedDowncast(value: Any) -> String {
    return value as! String  // Could crash
}

// Unreachable code
func unreachableCode() -> Int {
    return 42
    print("Never executed")  // Unreachable
}

// Empty catch block
func emptyCatch() {
    do {
        let result = 10 / 0
    } catch {
        // Empty catch block
    }
}

// Using NSLog instead of print (less efficient)
func inefficientLogging() {
    NSLog("This is a log message")
}

// Not using guard for early exit
func noGuard(value: String?) -> Int {
    if value != nil {
        return value!.count  // Force unwrap
    } else {
        return 0
    }
}

// Duplicate code
func calculateArea1(length: Double, width: Double) -> Double {
    return length * width
}

func calculateArea2(length: Double, width: Double) -> Double {
    return length * width
}

// Using deprecated API (example)
func useDeprecated() {
    // Using deprecated methods
}

print("Example with issues")
