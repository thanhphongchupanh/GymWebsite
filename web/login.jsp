<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/loginForm.css">
        <%@include file="layout/header.jsp" %>
    </head>
    <body>

        <div class="wrapper active-popup">
            <span class="icon-close">
                <ion-icon name="close-outline"></ion-icon>
            </span>
            <div class="form-box login">
                <h2>Login</h2>
                <form action="MainController" accept-charset="UTF-8" method="POST">
                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="mail-outline"></ion-icon>
                        </span>
                        <input type="text" name="username" required>
                        <label>Username</label>
                    </div>

                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                        </span>
                        <input type="password" name="password" required>
                        <label>Password</label>
                    </div>

                    <div class="remember-forget">
                        <label>
                            <input type="checkbox" checked> Remember me
                        </label>
                        <a href="forgotpassword.jsp" class="forgot-password-link">Forgot Password?</a>
                    </div>

                    <button type="submit" class="btn" name="action" value="Login">Login</button>
                    <div class="error-message">
                        <c:if test="${not empty requestScope.ERROR}">
                            <p>${requestScope.ERROR}</p>
                        </c:if>
                    </div>

                    <div class="login-register">
                        <p>Don't have account? <a href="#" class="register-link">Register</a> </p>
                    </div>
                </form>

            </div>

            <div class="form-box register">
                <h2>Registration</h2>
                <form action="RegisterServlet" accept-charset="UTF-8" method="POST">
                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="person-outline"></ion-icon>
                        </span>
                        <input type="text" name="firstName" value="" required="" id="firstName">
                        <label>First Name</label>
                    </div>

                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="person-outline"></ion-icon>
                        </span>
                        <input type="text" name="lastName" value="" required="" id="lastName">
                        <label>Last Name</label>
                    </div>

                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="person-outline"></ion-icon>
                        </span>
                        <input type="text" name="username" value="" required="" id="username">
                        <label>Username</label>
                    </div>

                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="mail-outline"></ion-icon>
                        </span>
                        <input type="text" name="email" value="" required="" id="email">
                        <label>Email</label>
                    </div>

                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="person-outline"></ion-icon>
                        </span>
                        <input required type="tel" class="form-control" id="phoneNumber" name="phoneNumber"
                               size="10" pattern="[0-9]{10}" title="Please enter 10 digits only">
                        <label>Phone Number</label>
                    </div>

                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="person-outline"></ion-icon>
                        </span>
                        <input type="text" name="shippingAddress" value="" required="" id="shippingAddress">
                        <label>Shipping Address</label>
                    </div>

                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                        </span>
                        <input type="password" name="password" value="" required="" id="password">
                        <label>Password</label>
                    </div>

                    <div class="remember-forget">
                        <label>
                            <input type="checkbox" checked> I argee to the terms & conditions
                        </label>

                    </div>

                    <button type="submit" name="action" value="Register" class="btn" onclick="showMessage()">Register</button>

                    <div class="login-register">
                        <p>Already have account? <a href="#" class="login-link">Login</a></p>
                    </div>
                </form>
            </div>
        </div>
        <div class="notification">
            Register Successfully
        </div>


        <c:set var="error" value="${requestScope.USER_ERROR}"/>
        <c:if test="${not empty error}">
            <div id="emailExistsMessage" class="notification">
                Email is existed!
            </div>
        </c:if>



        <style>
            .notification {
                position: fixed;
                top: 80px;
                right: 20px;
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                display: none;
                padding: 20px;
                z-index: 1000;
            }

            .notification.active {
                display: block;
            }
        </style>



        <script>
            function showMessage() {
                const firstNameInput = document.getElementById('firstName');
                const lastNameInput = document.getElementById('lastName');
                const usernameInput = document.getElementById('username');
                const emailInput = document.getElementById('email');
                const phoneNumberInput = document.getElementById('phoneNumber');
                const passwordInput = document.getElementById('password');
                const notification = document.querySelector('.notification');
                if (emailIsExisted(emailInput.value)) {
                    emailExistsMessage.classList.add('active');
                    return; // D?ng vi?c g?i form n?u email ?ã t?n t?i
                } else {
                    emailExistsMessage.classList.remove('active');
                }

                if (firstNameInput.validity.valid && lastNameInput.validity.valid &&
                        usernameInput.validity.valid && emailInput.validity.valid &&
                        phoneNumberInput.validity.valid && passwordInput.validity.valid) {

                    notification.classList.add('active');
                    setTimeout(() => {
                        notification.classList.remove('active');
                    }, 2000); // T?t thông báo sau 3 giây
                }
            }
        </script>
        <script>
            const wrapper = document.querySelector('.wrapper');
            const loginLink = document.querySelector('.login-link');
            const registerLink = document.querySelector('.register-link');
            const btnPopup = document.querySelector('.btnLogin-popup');

            const iconClose = document.querySelector('.icon-close');


            // == Changing from Login form to Register form and reverse ==
            registerLink.addEventListener('click', () => {
                wrapper.classList.add('active');
            });

            loginLink.addEventListener('click', () => {
                wrapper.classList.remove('active');
            });

            // Changing from Login form to Register form and reverse 


            // == Pop up form-box ==
            // btnPopup.addEventListener('click', () => {
            //     wrapper.classList.add('active-popup');
            // });

            iconClose.addEventListener('click', () => {
                wrapper.classList.remove('active-popup');
            });
        </script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>

</html>