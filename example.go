package main

import (
	"database/sql"
	"fmt"
	"os"
)

// Unused import
import "time"

// Hardcoded credentials
const Password = "admin123"
const ApiKey = "sk-1234567890abcdef"

// SQL injection vulnerability
func sqlInjection(db *sql.DB, username string) (*sql.Rows, error) {
	query := "SELECT * FROM users WHERE username = '" + username + "'"
	return db.Query(query)
}

// Unchecked error
func uncheckedError() {
	file, _ := os.Open("file.txt") // Error ignored
	defer file.Close()
}

// Potential nil pointer dereference
func nilPointerRisk(ptr *int) int {
	return *ptr // ptr might be nil
}

// Unused variable
func unusedVariable() int {
	x := 10
	y := 20 // y is never used
	return x
}

// Goroutine leak - no way to stop
func goroutineLeak() {
	go func() {
		for {
			fmt.Println("Running forever")
		}
	}()
}

// Race condition
var counter int

func incrementCounter() {
	counter++ // Not thread-safe
}

// Infinite loop
func infiniteLoop() {
	for {
		break
		fmt.Println("Unreachable") // Unreachable code
	}
}

// Missing error check
func missingErrorCheck() {
	fmt.Fprintf(os.Stdout, "Hello") // Error return value not checked
}

// Shadowing variable
func shadowingVariable() {
	x := 10
	if true {
		x := 20 // Shadows outer x
		fmt.Println(x)
	}
	fmt.Println(x)
}

func main() {
	fmt.Println("Example with issues")
}
