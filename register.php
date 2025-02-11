<?php
require "db_con.php";

// Get input from the form
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];
$cpassword = $_POST['confirm-password'];

// Validate if passwords match
if ($password !== $_POST['confirm-password']) {
    $error = "Passwords do not match!";
    header("Location: /DARKLOOK/login.html?msg=$error");
    exit();
}

// Database connection check
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

// Check if username or email already exists
$query = "SELECT id FROM user WHERE username = ? OR email = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("ss", $username, $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->fetch_assoc()) {
    // User exists, show error message
    $error = "Username already exists!";
    header("Location: /DARKLOOK/login.html?msg=$error");
    exit();
} 

// Insert new user if no duplicate found
$insertQuery = "INSERT INTO user (username, email, password, c_password) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($insertQuery);
$stmt->bind_param("ssss", $username, $email, $password, $cpassword);

if ($stmt->execute()) {
    // Success message
    $error = "Registration successful!";
    header("Location: /DARKLOOK/login.html?msg=$error");
} else {
    // Error inserting data
    $error = "Error during registration. Please try again.";
    header("Location: /DARKLOOK/login.html?msg=$error");
}

// Close connections
$stmt->close();
$conn->close();
?>



 