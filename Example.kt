import java.sql.Connection
import java.sql.DriverManager

// Hardcoded password
const val PASSWORD = "admin123"
const val API_KEY = "sk-1234567890abcdef"

// SQL injection vulnerability
fun sqlInjection(conn: Connection, username: String) {
    val query = "SELECT * FROM users WHERE username = '$username'"
    val stmt = conn.createStatement()
    stmt.executeQuery(query)
}

// Potential null pointer exception
fun nullPointerRisk(str: String?): Int {
    return str!!.length // Forcing non-null with !!
}

// Unused variable
fun unusedVariable(): Int {
    val x = 10
    val y = 20 // never used
    return x
}

// Resource leak
fun resourceLeak() {
    val conn = DriverManager.getConnection("jdbc:mysql://localhost/test")
    val stmt = conn.createStatement()
    // Resources never closed
}

// Empty catch block
fun emptyCatch() {
    try {
        val result = 10 / 0
    } catch (e: Exception) {
        // Empty catch block
    }
}

// Using == with nullable types
fun compareNullable(s1: String?, s2: String?): Boolean {
    return s1 == s2 // Might have null issues
}

// Unreachable code
fun unreachableCode(): Int {
    return 42
    println("Never executed") // Unreachable
}

// Non-thread-safe mutable state
var counter = 0

fun incrementCounter() {
    counter++ // Not thread-safe
}

// Potential division by zero
fun divideByZero(a: Int, b: Int): Int {
    return a / b // b might be zero
}

// Using deprecated function
@Deprecated("Use newFunction instead")
fun oldFunction() {
    println("Old function")
}

fun useDeprecated() {
    oldFunction() // Using deprecated function
}

// Mutable collections exposed
class UnsafeClass {
    val items = mutableListOf<String>()
    
    fun getItems(): MutableList<String> {
        return items // Exposes mutable internal state
    }
}

fun main() {
    println("Example with issues")
}
