<?php
session_start();
require "db_con.php";

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_SESSION['user_id']) && isset($_GET['id'])) {
    $user_id = $_SESSION['user_id'];
    $product_id = $_GET['id'];

    //checking if the user have already liked the product
    $query_check = "SELECT id FROM wishlist WHERE user_id = ? AND product_id = ?";
    $stmt = $conn->prepare($query_check);
    $stmt->bind_param("ii", $user_id, $product_id);
    $stmt->execute();
    $result = $stmt->get_result();  
    if($result->num_rows > 0){
        $error = "Added in wishlist";
        header("Location: /DARKLOOK/category_page.html?msg=$error");
    }else{
        // Prepare and execute the SQL query to insert into wishlist table
        $stmt = $conn->prepare("INSERT INTO wishlist (user_id, product_id) VALUES (?, ?)");
        $stmt->bind_param("ii", $user_id, $product_id);

        if ($stmt->execute()) {
            $error = "Added in wishlist";
            header("Location: /DARKLOOK/category_page.html?msg=$error");
        } else {
            $error = "Sorry, some error occurred";
            header("Location: /DARKLOOK/category_page.html?msg=$error");
        }
        $stmt->close();
        $conn->close();
    }
}

else {
    $error = "User not logged in";
    header("Location: /DARKLOOK/category_page.html?msg=" . urlencode($error));
}
?>