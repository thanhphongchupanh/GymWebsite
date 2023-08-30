<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Password</title>
        <link rel="stylesheet" href="css/createnewpassword.css">
    </head>
    <body>
        <div class="form-box createpassword">
            <h2>Create Password</h2>
            <form action="MainController">
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                    </span>
                    <input type="password" id="password" name="password" placeholder="Enter new password" required>
                    <label>Password</label>
                </div>

                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                    </span>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password" required>
                    <label>Confirm Password</label>
                </div>

                <button type="submit" class="btn" name="action" value="CreatePassword">Confirm</button>
            <p class="error-message">${errorMessage}</p>
            <p class="success-message">${successMessage}</p>
            </form>
        </div>
    </body>
</html>