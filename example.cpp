#include <iostream>
#include <string>
#include <vector>
#include <memory>

using namespace std;

// Using namespace std in header (bad practice)
// Memory leak
void memoryLeak() {
    int* ptr = new int[100];
    // Memory never deleted
}

// Use after delete
void useAfterDelete() {
    int* ptr = new int(42);
    delete ptr;
    cout << *ptr << endl; // Use after delete
}

// Null pointer dereference
int nullPointerDeref(int* ptr) {
    return *ptr; // ptr might be nullptr
}

// Buffer overflow with C-style arrays
void bufferOverflow(const char* input) {
    char buffer[10];
    strcpy(buffer, input); // No bounds checking
}

// Unused variable
int unusedVariable() {
    int x = 10;
    int y = 20; // y is never used
    return x;
}

// Missing virtual destructor
class Base {
public:
    Base() {}
    ~Base() {} // Should be virtual
};

class Derived : public Base {
public:
    int* data;
    Derived() { data = new int[100]; }
    ~Derived() { delete[] data; }
};

// Potential division by zero
int divideByZero(int a, int b) {
    return a / b; // b might be zero
}

// Catch by value instead of reference
void catchByValue() {
    try {
        throw runtime_error("Error");
    } catch (exception e) { // Should catch by reference
        cout << e.what() << endl;
    }
}

// Unreachable code
int unreachableCode() {
    return 42;
    cout << "Never executed" << endl; // Unreachable
}

// Hardcoded credentials
const string PASSWORD = "admin123";
const string API_KEY = "sk-1234567890abcdef";

// Comparison of pointer with zero
int pointerComparison(int* ptr) {
    if (ptr == 0) { // Should use nullptr
        return -1;
    }
    return *ptr;
}

int main() {
    cout << "Example with issues" << endl;
    return 0;
}
