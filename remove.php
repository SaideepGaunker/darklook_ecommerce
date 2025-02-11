<?php
    session_start();
    require "db_con.php";

    $user_id=$_SESSION['user_id'];
    // Handle product removal from wishlist
    if (isset($_GET['id']) && $_GET['btn2'] == "wishlist") {
        $product_id = $_GET['id'];

        // Prepare and execute delete query
        $delete_query = "DELETE FROM wishlist WHERE user_id = ? AND product_id = ?";
        $stmt = $conn->prepare($delete_query);
        $stmt->bind_param("ii", $user_id, $product_id);
        if ($stmt->execute()) {
            // Product removed successfully\
            $error= "removed";
            header("Location: /DARKLOOK/index.html?msg=$error");
            exit();
        } else {
            // Error removing product
            $error="failed to remove";
            header("Location: /DARKLOOK/index.html?msg=$error");
            exit();
        }
        $stmt->close();
    }
    $conn->close();
?>