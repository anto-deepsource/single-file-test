// Using any type - defeats type safety
function processData(data: any): any {
    return data.someProperty;
}

// Unused variable
const unusedVariable: number = 42;

// Type assertion without proper checking
function unsafeTypeAssertion(obj: unknown): string {
    return (obj as string).toLowerCase();
}

// Missing return type annotation
function missingReturnType(x, y) {
    return x + y;
}

// Non-null assertion operator misuse
function unsafeNonNull(value: string | null) {
    return value!.length; // Potential runtime error
}

// Empty interface
interface EmptyInterface {
}

// Duplicate code
class Calculator1 {
    add(a: number, b: number): number {
        return a + b;
    }
}

class Calculator2 {
    add(a: number, b: number): number {
        return a + b;
    }
}

// Using == instead of ===
function looseComparison(a: any, b: any): boolean {
    return a == b;
}

// Hardcoded credentials
const API_SECRET = "sk-1234567890abcdef";
const DB_PASSWORD = "admin123";

// Unreachable code
function unreachable(): string {
    return "hello";
    console.log("Never executed");
}

// Missing error handling
function riskyOperation(url: string) {
    fetch(url); // No error handling
}
