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
                <form action="MainController">
                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="mail-outline"></ion-icon>
                        </span>
                        <input type="text" name="email" required>
                        <label>Email</label>
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
                        <a href="#">Forgot Password?</a>
                    </div>

                    <button type="submit" class="btn">Login</button>

                    <div class="login-register">
                        <p>Don't have account? <a href="#" class="register-link">Register</a></p>
                    </div>
                </form>
            </div>

            <div class="form-box register">
                <h2>Registration</h2>
                <form action="MainController">
                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="person-outline"></ion-icon>
                        </span>
                        <input type="text" name="username" required>
                        <label>Username</label>
                    </div>

                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="mail-outline"></ion-icon>
                        </span>
                        <input type="text" name="email" required>
                        <label>Email</label>
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
                            <input type="checkbox" checked> I argee to the terms & conditions
                        </label>

                    </div>

                    <button type="submit" name="action" value="Register" class="btn">Register</button>

                    <div class="login-register">
                        <p>Already have account? <a href="#" class="login-link">Login</a></p>
                    </div>
                </form>
            </div>
        </div>

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
            // Pop up form-box


            // const menu = document.querySelector(".navigation");
            // const menuButton = document.querySelector(".navbar_icons");
            // const overlay = document.querySelector("#overlay");


            // làm cho nút button nghe ???c ??ng tác Click c?a User
            // t?o class m?i ?? qua Css l?i ?? hi?n th? lên màn hình
            //toggle: chuy?n ??i, classList: t?o class
            // menuButton.addEventListener('click', ()=>{
            //     menu.classList.toggle("navigation_open");
            //     menuButton.classList.toggle("open");
            //     overlay.classList.toggle("show");
            // })

            // overlay.addEventListener('click', ()=>{
            //     menu.classList.toggle("navigation_open");
            //     menuButton.classList.toggle("open");
            //     overlay.classList.toggle("show");
            // })


        </script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>

</html>