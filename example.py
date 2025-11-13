import os
import sys
import json

# Unused import
import random

def unsafe_eval(user_input):
    # Security issue: using eval with user input
    result = eval(user_input)
    return result

def sql_injection(username):
    # SQL injection vulnerability
    query = "SELECT * FROM users WHERE username = '" + username + "'"
    return query

def hardcoded_password():
    # Hardcoded credentials
    password = "admin123"
    api_key = "sk-1234567890abcdef"
    return password

def unused_variable():
    x = 10
    y = 20
    # y is never used
    return x

def divide_by_zero(a, b):
    # Potential division by zero
    return a / b

def infinite_loop():
    # Unreachable code
    while True:
        pass
    print("This will never execute")

# Function with no return statement but expects one
def missing_return(x):
    if x > 0:
        return x
    # Missing return for x <= 0

# Duplicate code
def calculate_area1(length, width):
    return length * width

def calculate_area2(length, width):
    return length * width
