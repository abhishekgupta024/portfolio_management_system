<?php
    // savepassword.php

    include("connection.php"); // Make sure to include your database connection file

    session_start();

    if (isset($_SESSION['email'])) {
        $email = $_SESSION['email'];
        
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $newPassword = isset($_POST['newPassword']) ? htmlspecialchars($_POST['newPassword']) : '';

            $sql = "UPDATE user_details SET password = '$newPassword' WHERE email = '$email'";
            
            if ($conn->query($sql) === TRUE) {
                echo "Password updated successfully";
            } else {
                echo "Error updating password: " . $conn->error;
            }
        } else {
            echo "Invalid request method";
        }
    } else {
        header("Location: about.php");
        exit();
    }
?>
