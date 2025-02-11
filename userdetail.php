<?php
session_start();  // Start the session
require "db_con.php";  // Include the database connection

// Get the logged-in user's ID from the session
$user_id = $_SESSION['user_id'];

// Get input from the form
$phonenumber = $_POST['phonenumber'];
$country = $_POST['country'];
$state = $_POST['state'];
$pincode = $_POST['pincode'];
$landmark = $_POST['landmark'];
$address = $_POST['address'];

// Database connection check
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}
$check_query="SELECT id FROM user_detail WHERE user_id= ?";
$check = $conn->prepare($check_query);
$check->bind_param("i",$user_id);
$check->execute(); 
$result = $check->get_result();
if($result->num_rows > 0){
    $query="UPDATE user_detail SET phone_number=?,country=?,state=?,pincode=?,address=?,landmark=? WHERE user_id =?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("ssssssi", $phonenumber, $country, $state, $pincode, $address, $landmark,$user_id);
    if ($stmt->execute()) {
        // Redirect to a success page
        $error = "Change successfully!";
        header("Location: /DARKLOOK/login.html?msg=$error");
    } else {
        // Handle errors during insertion
        $error = "Error saving details: " . $stmt->error;
        header("Location: /DARKLOOK/login.html?msg=$error");
    }
}else{
    $_SESSION['user_detail']=$result;
    // Prepare an SQL query to insert the user details into the database
    $query = "INSERT INTO user_detail (user_id, phone_number, country, state, pincode, address, landmark) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("issssss", $user_id, $phonenumber, $country, $state, $pincode, $address, $landmark);
    if ($stmt->execute()) {
        // Redirect to a success page
        $error = "Details saved successfully!";
        header("Location: /DARKLOOK/login.html?msg=$error");
    } else {
        // Handle errors during insertion
        $error = "Error saving details: " . $stmt->error;
        header("Location: /DARKLOOK/login.html?msg=$error");
    }
}
// Close the statement and connection
$stmt->close();
$conn->close();
?>
