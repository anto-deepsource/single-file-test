// Unused variable
var unusedVar = 10;

// Using eval - security risk
function unsafeEval(userInput) {
    return eval(userInput);
}

// SQL injection vulnerability
function sqlInjection(username) {
    var query = "SELECT * FROM users WHERE username = '" + username + "'";
    return query;
}

// Hardcoded password
const PASSWORD = "admin123";
const API_KEY = "sk-1234567890abcdef";

// == instead of ===
function looseEquality(a, b) {
    if (a == b) {
        return true;
    }
    return false;
}

// Unreachable code
function unreachableCode() {
    return true;
    console.log("This will never execute");
}

// Missing semicolon and inconsistent style
function badStyle() {
    var x = 10
    var y = 20;
    return x + y
}

// Using var instead of let/const
function oldStyleVar() {
    for (var i = 0; i < 10; i++) {
        // var has function scope, not block scope
    }
    console.log(i); // i is still accessible
}

// Callback hell
function callbackHell() {
    setTimeout(function() {
        setTimeout(function() {
            setTimeout(function() {
                console.log("Done");
            }, 100);
        }, 100);
    }, 100);
}

// Missing default case in switch
function missingDefault(x) {
    switch(x) {
        case 1:
            return "one";
        case 2:
            return "two";
    }
}
