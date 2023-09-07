<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/productDetail.css">
        <%@page import="java.util.Arrays"%>
        <%@ page import="java.util.List" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="layout/header.jsp" %> 
        <%@include file="layout/navigationBar.jsp" %> 
        <div class="container">
            <div class="product">
                <div class="product-img">
                    <img src="img/img1.jpg" alt="">
                </div>
                <c:set var="product" value="${sessionScope.PRODUCT_DETAIL}"/>
                <div class="product-content">
                    <c:forEach var="dto" items="${product}">
                        <h2>${dto.name}</h2>
                        <div class="product-rating">
                            <i class="fa fa-star-o" aria-hidden="true"></i>
                            <i class="fa fa-star-o" aria-hidden="true"></i>
                            <i class="fa fa-star-o" aria-hidden="true"></i>
                            <i class="fa fa-star-o" aria-hidden="true"></i>
                            <i class="fa fa-star-o" aria-hidden="true"></i>
                            <a style="margin-left: 6px; font-size: 15px; color: #0071f5; text-decoration: none;" href="#">
                                Write your review
                            </a>
                        </div>
                        <div class="product-price">
                            <span class="special-price" style="font-size: 19px;"><strong>$ ${dto.price}</strong></span>
                            <span class="old-price"></span>
                            <div class="save-price">
                                (Save <span></span>)
                            </div>
                        </div>
                    </c:forEach>
                    <c:set var="n" value="<br>"/>
                    <c:set var="formattedWhey" value="${fn:replace(product, '.', n)}" />
                    <ul>
                        <c:forEach items="${fn:split(formattedWhey, n)}" var="item">
                            <li>${item}</li>
                            </c:forEach>
                    </ul>
                    <div class="qty">
                        <p style="font-weight: bold;">Quantity</p>
                        <div class="qty-input-number" style="display: flex; align-items: center;">
                            <span class="qty-minus">-</span>
                            <strong>
                                <input type="text" name="your_field_name" value="1" style="width: 25px; text-align: center;"
                                       oninput="this.value = this.value.replace(/[^0-9]/g, ''); if(parseInt(this.value) < 1) this.value = '1';"
                                       pattern="[0-9]*" min="1">
                            </strong>
                            <span class="qty-add">+</span>
                        </div>
                    </div>
                    <div class="btn-submit">
                        <input type="submit" value="Buy Now" class="btn-buynow">
                        <input type="submit" value="Add To Cart" class="btn-addtocart">
                    </div>
                    <div class="immediate-contact" style="text-align: center;">
                        <a href="tel:+1234567890">Call now: <strong>1800 .221</strong> (8:00-20:00)</a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Get the elements by their class names
            const specialPriceElement = document.querySelector('.special-price');
            const oldPriceElement = document.querySelector('.old-price');
            const savePriceElement = document.querySelector('.save-price span');

            // Parse the values inside the elements to integers
            const specialPriceValue = parseFloat(specialPriceElement.textContent.replace('$', ''));
//            const oldPriceValue = parseInt(specialPriceElement.textContent.replace('$', ''));

            // Calculate the new old-price
            const newOldPrice = (specialPriceValue * 10 / 100) + specialPriceValue;
            //Calculate save price
            const newSavePrice = newOldPrice - specialPriceValue;
            // Update the old-price element with the new value
            oldPriceElement.textContent = '$' + newOldPrice;
            savePriceElement.textContent = '$' + newSavePrice;
        </script>

        <script>
            const minus = document.querySelector('.qty-minus');
            const add = document.querySelector('.qty-add');
            const inputNumberElement = document.querySelector('.qty-input-number input');

            // Event listener for the minus button
            minus.addEventListener('click', function () {
                let inputValue = parseInt(inputNumberElement.value);
                if (inputValue > 1) {
                    inputValue--;
                    inputNumberElement.value = inputValue;
                }
            });

            // Event listener for the add button
            add.addEventListener('click', function () {
                let inputValue = parseInt(inputNumberElement.value);
                inputValue++;
                inputNumberElement.value = inputValue;
            });
        </script>

        <script>
            const btnBuynow = document.querySelector('.btn-buynow');
            const btnAddtocart = document.querySelector('.btn-addtocart');

            btnBuynow.addEventListener('click', function () {
                const inputNumberValue = parseInt(document.querySelector('.qty-input-number input').value);
                if (inputNumberValue > 59) {
                    alert('You can only buy 59 products at once');
                }
            });

            btnAddtocart.addEventListener('click', function () {
                const inputNumberValue = parseInt(document.querySelector('.qty-input-number input').value);
                if (inputNumberValue > 59) {
                    alert('You can only buy 59 products at once');
                }
            });

        </script>
    </body>

</html>