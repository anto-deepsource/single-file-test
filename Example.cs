using System;
using System.Data;
using System.Data.SqlClient;

namespace Example
{
    public class ExampleClass
    {
        // Hardcoded password
        private const string Password = "admin123";
        private const string ApiKey = "sk-1234567890abcdef";
        
        // SQL injection vulnerability
        public DataTable SqlInjection(string username)
        {
            SqlConnection conn = new SqlConnection("connection_string");
            string query = "SELECT * FROM Users WHERE Username = '" + username + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }
        
        // Potential null reference exception
        public int NullReferenceRisk(string str)
        {
            return str.Length; // str might be null
        }
        
        // Resource leak - no dispose
        public void ResourceLeak()
        {
            SqlConnection conn = new SqlConnection("connection_string");
            conn.Open();
            // Connection never closed/disposed
        }
        
        // Empty catch block
        public void EmptyCatch()
        {
            try
            {
                int result = 10 / 0;
            }
            catch (Exception ex)
            {
                // Empty catch block
            }
        }
        
        // Unused variable
        public int UnusedVariable()
        {
            int x = 10;
            int y = 20; // never used
            return x;
        }
        
        // Non-thread-safe field access
        private int counter = 0;
        
        public void IncrementCounter()
        {
            counter++; // Not thread-safe
        }
        
        // Using == to compare strings
        public bool CompareStrings(string s1, string s2)
        {
            return s1 == s2; // Should use .Equals() for value comparison
        }
        
        // Unreachable code
        public int UnreachableCode()
        {
            return 42;
            Console.WriteLine("Never executed"); // Unreachable
        }
        
        // Potential division by zero
        public int DivideByZero(int a, int b)
        {
            return a / b; // b might be zero
        }
    }
}
