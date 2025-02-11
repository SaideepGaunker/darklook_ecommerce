<?php
session_start();
require "db_con.php";

// Check if the user is logged in and if product ID is passed
if (isset($_SESSION['user_id']) && isset($_GET['id']) && isset($_GET['price'])) {
    $user_id = $_SESSION['user_id'];
    $product_id = $_GET['id'];

    //checkiing if the user hsve already added the product
    $query_check = "SELECT id FROM cart WHERE user_id = ? AND product_id = ?";
    $stmt = $conn->prepare($query_check);
    $stmt->bind_param("ii", $user_id, $product_id);
    $stmt->execute();
    $result = $stmt->get_result();  
    if($result->num_rows > 0){
        $error = "View to cart1";
        header("Location: /DARKLOOK/category_page.html?msg=$error");
    }else{
        $quantity = 1;
        $price = $_GET['price'];
        $total_price = $quantity * $price;

        // Prepare and execute the SQL query to insert into cart table
        $stmt = $conn->prepare("INSERT INTO cart (user_id, product_id, quantity, total_amount) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("iiid", $user_id, $product_id, $quantity, $total_price);

        if ($stmt->execute()) {
            $error = "View the cart";
            header("Location: /DARKLOOK/category_page.html?msg=$error");
        } else {
            $error = "Sorry, some error occurred";
            header("Location: /DARKLOOK/category_page.html?msg=$error");
        }
        $stmt->close();
        $conn->close();
    }
} else {
    $error = "User not logged in or invalid product data";
    header("Location: /DARKLOOK/category_page.html?msg=" . urlencode($error));
}
?>
