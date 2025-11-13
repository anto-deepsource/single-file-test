import java.sql.*;
import java.util.*;

public class Example {
    // Hardcoded password
    private static final String PASSWORD = "admin123";
    private static final String API_KEY = "sk-1234567890abcdef";
    
    // SQL injection vulnerability
    public ResultSet sqlInjection(Connection conn, String username) throws SQLException {
        Statement stmt = conn.createStatement();
        String query = "SELECT * FROM users WHERE username = '" + username + "'";
        return stmt.executeQuery(query);
    }
    
    // Potential null pointer exception
    public int nullPointerRisk(String str) {
        return str.length(); // str might be null
    }
    
    // Resource leak - no try-with-resources
    public void resourceLeak() throws Exception {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/test");
        Statement stmt = conn.createStatement();
        // conn and stmt never closed
    }
    
    // Empty catch block
    public void emptyCatch() {
        try {
            int result = 10 / 0;
        } catch (Exception e) {
            // Empty catch block
        }
    }
    
    // Unused variable
    public int unusedVariable() {
        int x = 10;
        int y = 20; // never used
        return x;
    }
    
    // Non-synchronized access to shared variable
    private int counter = 0;
    
    public void incrementCounter() {
        counter++; // Not thread-safe
    }
    
    // Using == to compare strings
    public boolean compareStrings(String s1, String s2) {
        return s1 == s2; // Should use .equals()
    }
    
    // Unreachable code
    public int unreachableCode() {
        return 42;
        System.out.println("Never executed"); // Unreachable
    }
    
    // Potential division by zero
    public int divideByZero(int a, int b) {
        return a / b; // b might be zero
    }
}
