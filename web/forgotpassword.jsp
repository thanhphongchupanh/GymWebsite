<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="css/forgotpasswordForm.css">
</head>
<body>
    <div class="container">
        <h2>Forgot Password</h2>
        <form action="MainController" method="post">
            <div class="input-box">
                <span class="icon">
                    <ion-icon name="mail-outline"></ion-icon>
                </span>
                <input type="email" id="email" name="email" placeholder="Enter your mail here" required>                
            </div>

            <button type="submit" class="btn" name="action" value="SendOTP">Send OTP</button>
        </form>
    </div>
</body>
</html>