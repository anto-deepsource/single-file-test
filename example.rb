require 'net/http'
require 'json'

# Hardcoded password
PASSWORD = "admin123"
API_KEY = "sk-1234567890abcdef"

# SQL injection vulnerability
def sql_injection(username)
  query = "SELECT * FROM users WHERE username = '#{username}'"
  return query
end

# Command injection vulnerability
def command_injection(filename)
  output = `cat #{filename}`
  return output
end

# Using eval - security risk
def unsafe_eval(code)
  eval(code)
end

# Unused variable
def unused_variable
  x = 10
  y = 20  # never used
  return x
end

# Potential nil reference
def nil_reference(str)
  return str.length  # str might be nil
end

# Not handling exceptions
def no_exception_handling
  file = File.open("file.txt")
  content = file.read
  # file never closed
end

# Using == with different types
def loose_comparison(a, b)
  return a == b
end

# Potential division by zero
def divide_by_zero(a, b)
  return a / b  # b might be zero
end

# Unreachable code
def unreachable_code
  return 42
  puts "Never executed"  # Unreachable
end

# Using send with user input
def unsafe_send(obj, method_name)
  obj.send(method_name)  # Security risk if method_name is user input
end

# Global variable modification
$counter = 0

def increment_counter
  $counter += 1  # Modifying global variable
end

# Using deprecated methods (example)
def use_deprecated
  Array.new(10, "default")  # This is fine, but using deprecated syntax
end

# Not using constant for magic number
def magic_numbers(value)
  if value > 100  # Magic number
    return true
  end
  return false
end

# Missing default case
def missing_default(x)
  case x
  when 1
    "one"
  when 2
    "two"
  # Missing else clause
  end
end

# Duplicate code
def calculate_area1(length, width)
  return length * width
end

def calculate_area2(length, width)
  return length * width
end
