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
        <%@include file="layout/header.jsp" %> 
        <link rel="stylesheet" href="css/homepage.css">
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
    </style>
    <body>
        <!--Navigation Bar-->
        <%@include file="layout/navigationBar.jsp" %> 
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>


        <!--Whey Product-->
        <div id="wrapper">
            <div class="headline">
                <h2>Whey</h2>
            </div>
            <div class="whey-products">
                <div class="bestSeller-photo">
                    <img src="img/whey (2).jpg" alt="">
                </div>

                <div id="product-grid" class="products">
                    <c:set var="whey" value="${sessionScope.WHEY_LIST}"/>                           
                    <c:forEach items="${whey}" var="wheyProduct">
                        <div class="product-item">
                            <div class="product-inner">
                            <div class="product-top">
                                <a href="" class="product-thumb">
                                    <img src="${wheyProduct.image}" alt="">
                                </a>
                                 <a href="DispatchServlet?btnAction=BuyNow&productID=${wheyProduct.ID}" class="buy-now">Buy Now</a>
                            </div>
                            <div class="product-info">
                                <a href="" class="product-cat">Bag</a>
                                <a href="" class="product-name">${wheyProduct.name}</a>
                                <div class="product-price">$ ${wheyProduct.price}</div>
                            </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty whey}">
                        Empty
                    </c:if>
                </div>
                           
                            
            </div>
        </div>
        <!--Mass Product-->
        <div id="wrapper">
            <div class="headline">
                <h2>Mass</h2>
            </div>
            <div class="whey-products">
                <div class="bestSeller-photo">
                    <img src="img/mass.jpg" alt="">
                </div>

                <div id="product-grid" class="products">
                    <c:set var="mass" value="${sessionScope.MASS_LIST}"/>                           
                    <c:forEach items="${mass}" var="massPrduct">
                        <div class="product-item">
                            <div class="product-inner">
                            <div class="product-top">
                                <a href="" class="product-thumb">
                                    <img src="${massPrduct.image}" alt="">
                                </a>
                                <a href="DispatchServlet?btnAction=BuyNow&productID=${massPrduct.ID}" class="buy-now">Buy Now</a>
                            </div>
                            <div class="product-info">
                                <a href="" class="product-cat">Bag</a>
                                <a href="" class="product-name">${massPrduct.name}</a>
                                <div class="product-price">$ ${massPrduct.price}</div>
                            </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty mass}">
                        Empty
                    </c:if>
                </div>
                           
                            
            </div>
        </div>
        <!--Pre-workout Product-->
        <div id="wrapper">
            <div class="headline">
                <h2>Pre Workout</h2>
            </div>
            <div class="whey-products">
                <div class="bestSeller-photo">
                    <img src="img/preworkout.jpg" alt="">
                </div>

                <div id="product-grid" class="products">
                    <c:set var="preworkout" value="${sessionScope.PREWORKOUT_LIST}"/>                           
                    <c:forEach items="${preworkout}" var="preworkoutPrduct">
                        <div class="product-item">
                            <div class="product-inner">
                            <div class="product-top">
                                <a href="" class="product-thumb">
                                    <img src="${preworkoutPrduct.image}" alt="">
                                </a>
                                <a href="DispatchServlet?btnAction=BuyNow&productID=${preworkoutPrduct.ID}" class="buy-now">Buy Now</a>
                            </div>
                            <div class="product-info">
                                <a href="" class="product-cat">Bag</a>
                                <a href="" class="product-name">${preworkoutPrduct.name}</a>
                                <div class="product-price">$ ${preworkoutPrduct.price}</div>
                            </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty preworkout}">
                        Empty
                    </c:if>
                </div>
                           
                            
            </div>
        </div>
        <!--Footer-->
        <footer>
            <%@include file="layout/footer.jsp" %>   
        </footer> 

        <script>
            window.addEventListener('DOMContentLoaded', function () {
                fetchWhey(); // Fetch job titles when the page loads
            });

            function fetchWhey() {
                fetch('./ProductListServlet') // Use the relative URL here
                        .then(response => {
                            return response.json();
                        })
            }
        </script>
    </body>
</html>
