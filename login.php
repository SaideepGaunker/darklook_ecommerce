<?php
session_start();  // Start session
require "db_con.php";  // Include database connection

// Get user input from the login form
$username = $_POST['username'];
$password = $_POST['password'];

// Check database connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Prepare SQL to check if the user exists by username or email
$query = "SELECT id, username, password FROM user WHERE username = ? OR email = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("ss", $username, $username);
$stmt->execute();
$result = $stmt->get_result();
if ($user = $result->fetch_assoc()) {
    // Verify the password using password_verify()
    if ($password === $user['password']) {
        // Set session variables on successful login
        $_SESSION['username'] = $user['username'];
        $_SESSION['user_id'] = $user['id'];
        
        $error = "Login successful!";
        header("Location: /DARKLOOK/index.html?msg=$error");
        exit();
    } else {
        // Password incorrect, redirect with error message
        $error = "Invalid password!";
        header("Location: /DARKLOOK/login.html?msg=$error");
        exit();
    }
} else {
    // User not found, redirect with error message
    $error = "User not found!";
    header("Location: /DARKLOOK/login.html?msg=$error");
    exit();
}

// Close connections
$stmt->close();
$conn->close();
?>
