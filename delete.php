<?php
session_start();
require "db_con.php";

//getting user_id
$delete_id = $_SESSION['user_id'];
// Check database connection

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$deletequery="DELETE FROM user WHERE id = ?";
$stmt = $conn->prepare($deletequery);
$stmt->bind_param("i", $delete_id);
if($stmt->execute()){ 
    $state ="delete";
    require "logout.php";
    $error="Your Acccont is DELEDED Successfully". $stmt->error; 
    header("Location: /DARKLOOK/index.html?msg=$error");     
    exit();
}else{
    $error="Problem Occurred during deletion";
    header("Location: /DARKLOOK/index.html?msg=$error");
}

// Close connections
$stmt->close();
$conn->close();
?>