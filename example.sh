#!/bin/bash

# Hardcoded password
PASSWORD="admin123"
API_KEY="sk-1234567890abcdef"

# Command injection vulnerability
execute_command() {
    eval "$1"  # Dangerous use of eval
}

# Missing quotes around variables
check_file() {
    if [ -f $1 ]; then  # Should be "$1"
        echo "File exists"
    fi
}

# Useless use of cat
useless_cat() {
    cat file.txt | grep "pattern"  # Should be: grep "pattern" file.txt
}

# Unused variable
unused_variable() {
    local x=10
    local y=20  # never used
    echo $x
}

# Missing error handling
no_error_handling() {
    cd /some/directory
    rm -rf *  # Dangerous if cd fails
}

# Not checking command exit status
no_exit_check() {
    some_command
    # Should check $? or use 'set -e'
}

# Unquoted variable expansion
unquoted_expansion() {
    FILES=$(ls *.txt)
    for f in $FILES; do  # Should be "$FILES"
        echo $f
    done
}

# Using ls in a loop
bad_loop() {
    for file in $(ls *.txt); do  # Should use glob: *.txt
        echo $file
    done
}

# Missing set -e or set -u
# set -e  # Exit on error
# set -u  # Exit on undefined variable

# SQL injection in shell script
sql_injection() {
    USER_INPUT=$1
    mysql -e "SELECT * FROM users WHERE name='$USER_INPUT'"
}

# Potential division by zero
divide_by_zero() {
    result=$(($1 / $2))  # $2 might be zero
    echo $result
}

# Using backticks instead of $()
old_syntax() {
    output=`ls -la`  # Should use $(ls -la)
    echo $output
}

# Unreachable code
unreachable_code() {
    return 0
    echo "Never executed"  # Unreachable
}

# Race condition with temp files
race_condition() {
    TMPFILE=/tmp/myfile.$$
    echo "data" > $TMPFILE
    # Another process could access this file
}

# Using rm without confirmation on user input
dangerous_rm() {
    rm -rf /$1  # Very dangerous if $1 is empty or wrong
}

echo "Example with issues"
