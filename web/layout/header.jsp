<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/sideCart.css">
    </head>
    <body>
        <div class="header">
            <div class="logo">
                <a href="homepage.jsp" style="text-decoration: none; color: white;">Next Evo</a>
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
                            <a href="infomation.jsp">${sessionScope.firstName}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="login.jsp">Account</a>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="user-icon">
                    <ion-icon style="font-size: 20px; margin-right: 5px;" name="call-outline"></ion-icon>
                    <a href="#footer">Contact</a>
                </div>
                <div class="cart-iconCart" id="open_cart_btn">
                    <ion-icon style="font-size: 20px; margin-right: 5px;" name="cart-outline"></ion-icon>
                    <a class="cart" href="#">Your Cart</a>
                </div>
            </div>
        </div>
         <!--side cart-->
<!--        <button id="open_cart_btn">
        <ion-icon style="font-size: 20px; margin-right: 5px;" name="cart-outline"></ion-icon>
    </button>-->
<div id="sidecart" class="sidecart" style="z-index: 1;">
        <div class="cart_content">
            <div class="cart_header">
                <ion-icon style="font-size: 20px; margin-right: 5px;" name="cart-outline"></ion-icon>
                <div class="header_title">
                    <h2 style="user-select:none; cursor: pointer;">
                        <a style="text-decoration: none; color: black;" href="login.jsp">Your Cart</a>
                    </h2>
                    <span id="items_num">4</span>
                </div>
                <span id="close_btn" class="close_btn">&times;</span>
            </div>
            <div class="cart_items">
                <div class="cart_item">
                    <div class="remove_item">
                        <span>&times;</span>
                    </div>
                    <div class="item_img">
                        <img src="img/img1.jpg" alt="">
                    </div>
                    <div class="item_details">
                        <p>Mass 2lbs No more Protein</p>
                        <strong>$2000</strong>
                        <div class="qty">
                            <span>-</span>
                            <strong>1</strong>
                            <span>+</span>
                        </div>
                    </div>
                </div>

                <div class="cart_item">
                    <div class="remove_item">
                        <span>&times;</span>
                    </div>
                    <div class="item_img">
                        <img src="img/img1.jpg" alt="">
                    </div>
                    <div class="item_details">
                        <p>Mass 2lbs No more Protein</p>
                        <strong>$2000</strong>
                        <div class="qty">
                            <span>-</span>
                            <strong>1</strong>
                            <span>+</span>
                        </div>
                    </div>
                </div>

                <div class="cart_item">
                    <div class="remove_item">
                        <span>&times;</span>
                    </div>
                    <div class="item_img">
                        <img src="img/img1.jpg" alt="">
                    </div>
                    <div class="item_details">
                        <p>Mass 2lbs No more Protein</p>
                        <strong>$2000</strong>
                        <div class="qty">
                            <span>-</span>
                            <strong>1</strong>
                            <span>+</span>
                        </div>
                    </div>
                </div>
              
                <div class="cart_item">
                    <div class="remove_item">
                        <span>&times;</span>
                    </div>
                    <div class="item_img">
                        <img src="img/img1.jpg" alt="">
                    </div>
                    <div class="item_details">
                        <p>Mass 2lbs No more Protein</p>
                        <strong>$2000</strong>
                        <div class="qty">
                            <span>-</span>
                            <strong>1</strong>
                            <span>+</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="cart_actions">
                <div class="subtotal">
                    <p>SUBTOTAL</p>
                    <p>$ <span id="subtotal_price">3898</span></p>
                </div>
                <button>View Cart</button>
                <button>Checkout</button>
            </div>
        </div>
    </div> 
    </body>
<script>
    const openBtn = document.getElementById('open_cart_btn')
    const cart = document.getElementById('sidecart')
    const closeBtn = document.getElementById('close_btn')
    openBtn.addEventListener('mouseenter', openCart)
    closeBtn.addEventListener('click', closeCart)
    function openCart(){
        cart.classList.add('open')
    }
    function closeCart(){
        cart.classList.remove('open')
    }
</script>
</html>