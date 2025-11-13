#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Buffer overflow vulnerability
void bufferOverflow(char *input) {
    char buffer[10];
    strcpy(buffer, input); // No bounds checking
}

// Memory leak
void memoryLeak() {
    char *ptr = malloc(100);
    // Memory never freed
}

// Use after free
void useAfterFree() {
    char *ptr = malloc(100);
    free(ptr);
    strcpy(ptr, "data"); // Use after free
}

// Null pointer dereference
int nullPointerDeref(int *ptr) {
    return *ptr; // ptr might be NULL
}

// Format string vulnerability
void formatStringVuln(char *userInput) {
    printf(userInput); // Should be printf("%s", userInput)
}

// Integer overflow
int integerOverflow(int a, int b) {
    return a + b; // No overflow check
}

// Unused variable
int unusedVariable() {
    int x = 10;
    int y = 20; // y is never used
    return x;
}

// Comparison of pointer with zero
int pointerComparison(int *ptr) {
    if (ptr == 0) { // Should use NULL
        return -1;
    }
    return *ptr;
}

// Potential division by zero
int divideByZero(int a, int b) {
    return a / b; // b might be zero
}

// Unreachable code
int unreachableCode() {
    return 42;
    printf("Never executed\n"); // Unreachable
}

// Hardcoded password
const char *PASSWORD = "admin123";
const char *API_KEY = "sk-1234567890abcdef";

int main() {
    printf("Example with issues\n");
    return 0;
}
