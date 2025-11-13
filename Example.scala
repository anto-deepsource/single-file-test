import java.sql.{Connection, DriverManager}
import scala.collection.mutable

object Example {
  
  // Hardcoded password
  val PASSWORD = "admin123"
  val API_KEY = "sk-1234567890abcdef"
  
  // SQL injection vulnerability
  def sqlInjection(conn: Connection, username: String) = {
    val query = s"SELECT * FROM users WHERE username = '$username'"
    val stmt = conn.createStatement()
    stmt.executeQuery(query)
  }
  
  // Potential null pointer exception
  def nullPointerRisk(str: String): Int = {
    str.length // str might be null
  }
  
  // Unused variable
  def unusedVariable(): Int = {
    val x = 10
    val y = 20 // never used
    x
  }
  
  // Using null instead of Option
  def usingNull(): String = {
    null // Should use Option[String]
  }
  
  // Mutable collection exposed
  class UnsafeClass {
    private val items = mutable.ListBuffer[String]()
    
    def getItems: mutable.ListBuffer[String] = items // Exposes mutable state
  }
  
  // Using return statement (not idiomatic)
  def usingReturn(x: Int): Int = {
    if (x > 0) {
      return x
    }
    return 0
  }
  
  // Potential division by zero
  def divideByZero(a: Int, b: Int): Int = {
    a / b // b might be zero
  }
  
  // Empty catch block
  def emptyCatch(): Unit = {
    try {
      val result = 10 / 0
    } catch {
      case e: Exception => // Empty catch
    }
  }
  
  // Using var instead of val
  def usingVar(): Int = {
    var x = 10 // Should prefer val when possible
    x = 20
    x
  }
  
  // Non-exhaustive pattern match
  def nonExhaustiveMatch(x: Int): String = {
    x match {
      case 1 => "one"
      case 2 => "two"
      // Missing default case
    }
  }
  
  // Unreachable code
  def unreachableCode(): Int = {
    return 42
    println("Never executed") // Unreachable
  }
  
  // Using == on objects
  def objectComparison(s1: String, s2: String): Boolean = {
    s1 == s2 // Works for String but shows pattern
  }
  
  // Resource leak
  def resourceLeak(): Unit = {
    val conn = DriverManager.getConnection("jdbc:mysql://localhost/test")
    val stmt = conn.createStatement()
    // Resources never closed
  }
  
  def main(args: Array[String]): Unit = {
    println("Example with issues")
  }
}
