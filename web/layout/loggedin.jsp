<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link rel="stylesheet" href="css/header.css">
    </head>
    <body>
        <div class="header">
            <div class="logo">
                <a href="account.jsp">Next Evo</a>
            </div>
            <div class="search-bar">
                <input class="search-input" type="text" placeholder="Search...">
                <span class="search-icon">
                    <ion-icon name="search-outline"></ion-icon>
                </span>
            </div>
            <div class="user-menu">
                <div class="user-icon">
                    <ion-icon style="font-size: 20px; margin-right: 5px;" name="person-circle-outline"></ion-icon>
                        <c:choose>
                            <c:when test="${not empty sessionScope.firstName}">
                            <ion-icon style="font-size: 20px; margin-right: 5px;" name="person-circle-outline"></ion-icon>
                            <a href="#">${sessionScope.firstName}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="information.jsp">Account</a>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="cart-icon">
                    <a href="homepage.jsp">Log out</a>
                </div>
                <div class="cart-icon">
                    <ion-icon style="font-size: 20px; margin-right: 5px;" name="cart-outline"></ion-icon>
                    <a href="login.jsp">Your Cart</a>
                </div>
                <div class="user-icon">
                    <ion-icon style="font-size: 20px; margin-right: 5px;" name="call-outline"></ion-icon>
                    <a href="#footer">Contact</a>
                </div>
            </div>
        </div>
    </body>
</html>
