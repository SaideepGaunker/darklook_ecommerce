<?php
if($state!="delete"){session_start();}
session_unset();  // Unset all session variables
session_destroy();  // Destroy the session

// Redirect to the login or registration page
if($state!="delete"){
    $error="Logout Successful";
header("Location: /DARKLOOK/login.html?msg=$error");
exit();
}
?>
