<%-- 
    Document   : homepage
    Created on : Aug 22, 2023, 10:20:52 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>     
        <%@include file="layout/loggedin.jsp" %> 
        <link rel="stylesheet" href="css/wheyList.css">
    </head>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            overflow: auto;
        }
        .title-info {
            color: #000; /* Đổi màu thành đen */
            font-size: 18px; /* Đổi kích thước font chữ thành 18px */
        }

    </style>
    <body>
        <!--Navigation Bar-->
        <%@include file="layout/navigationBarLoggedIn.jsp" %> 
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>

        <section class="signup page_customer_account section">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-lg-15 col-left-ac">
                        <div class="block-account">
                            <h5 class="title-account">Trang tài khoản</h5>
                            <p>
                                Xin chào, <span style="color:#d70018;">Lam Hoang</span>&nbsp;!
                            </p>
                            <ul>
                                <li>
                                    <a disabled="disabled" class="title-info" href="/account">Thông tin tài khoản</a>
                                </li>
                                <li>
                                    <a disabled="disabled" class="title-info active" href="javascript:void(0);">Đơn hàng của bạn</a>
                                </li>
                                <li>
                                    <a class="title-info" href="/account/changepassword">Đổi mật khẩu</a>
                                </li>
                                <li>
                                    <a class="title-info" href="/account/addresses">Sổ địa chỉ (0)</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--Footer-->
        <footer>
            <%@include file="layout/footer.jsp" %>   
        </footer> 
    </body>
</html>
