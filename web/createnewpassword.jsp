<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Password</title>
        <%@include file="layout/header.jsp" %> 
        <link rel="stylesheet" href="css/wheyList.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            .center-text {
                text-align: center;
                font-size: 30px;
                padding-left: 10px;
                margin-top: 580px;
                margin-bottom: -60px;
            }
            .container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 30vh;
            }
            .input-box {
                width: 100%;
                height: 20px;
                border-bottom: 2px solid var(--gray);
                margin-top: 80px;
            }
            .input-box input {
                width: 120%;
                height: 50px;
                border: 1px solid black;
                padding: 0 10px;
                font-size: 14px;
            }
            .btn {
                width: 40%;
                height: 35px;
                border-radius: 3px;
                border: 0.5px solid black;
                font-weight: 500;
                color: var(--header);
                cursor: pointer;
                margin-top: 80px;
                margin-bottom: 50px;
                margin-left: 80px;
                font-size: 15px;
            }
            .message {
                color: red;
                text-align: center;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="layout/navigationBar.jsp" %> 

        <div class="container">
            <div class="center-text">
                <h2>Create Password</h2>
            </div>

            <form action="MainController" method="post">
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                    </span>
                    <input type="password" id="password" name="password" placeholder="Enter new password" required>
                </div>

                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed-outline"></ion-icon>
                    </span>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password" required>
                </div>

                <button type="submit" class="btn" name="action" value="CreatePassword">Confirm</button>

                <!-- Hiển thị thông báo lỗi và thành công -->
                <p class="message">${errorMessage}</p>
                <p class="message">${successMessage}</p>
            </form>

            <footer>
                <%@include file="layout/footer.jsp" %>   
            </footer>
        </div>
    </body>
</html>
