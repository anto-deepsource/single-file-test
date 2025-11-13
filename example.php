<?php

// Hardcoded password
$password = "admin123";
$api_key = "sk-1234567890abcdef";

// SQL injection vulnerability
function sqlInjection($username) {
    $conn = mysqli_connect("localhost", "user", "pass", "db");
    $query = "SELECT * FROM users WHERE username = '$username'";
    $result = mysqli_query($conn, $query);
    return $result;
}

// XSS vulnerability
function xssVulnerability($userInput) {
    echo $userInput; // Should use htmlspecialchars()
}

// Command injection
function commandInjection($filename) {
    $output = shell_exec("cat " . $filename);
    return $output;
}

// Using eval - security risk
function unsafeEval($code) {
    eval($code);
}

// File inclusion vulnerability
function fileInclusion($page) {
    include($_GET['page']); // Direct inclusion of user input
}

// Weak random number generation
function weakRandom() {
    return rand(); // Should use random_int() or random_bytes()
}

// Unused variable
function unusedVariable() {
    $x = 10;
    $y = 20; // never used
    return $x;
}

// Missing input validation
function noValidation($email) {
    return $email; // Should validate email format
}

// Potential division by zero
function divideByZero($a, $b) {
    return $a / $b; // b might be zero
}

// Using deprecated mysql_ functions would be here if PHP version supported it

// Not using prepared statements
function noPreparedStatement($id) {
    $conn = mysqli_connect("localhost", "user", "pass", "db");
    $query = "SELECT * FROM products WHERE id = " . $id;
    return mysqli_query($conn, $query);
}

// Hardcoded database credentials
$db_host = "localhost";
$db_user = "root";
$db_pass = "root123";

// Missing error handling
function noErrorHandling() {
    $file = fopen("file.txt", "r"); // No check if file exists
    $content = fread($file, 1024);
    fclose($file);
}

?>
