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
        <title>Whey</title>     
        <%@include file="layout/header.jsp" %> 
        <link rel="stylesheet" href="css/wheyList.css">
        <link rel="stylesheet" href="css/wheySlider.css">
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
        <!--Whey Product-->
        <div id="wrapper">
            <div class="headline">
                <h2>Whey Protein</h2>
                <div style="text-align: center; max-width: 1200px; margin: 0 auto;">
                    <p>
                        Whey Protein is a product that is separated in the cheese making process,
                        processed through filtration separation and drying to create Whey powder.
                    </p>
                    <p>
                        Whey protein products are evaluated as one of the supplement
                        fast-absorbing protein sources, supporting customers to develop and
                        recover well during exercise.
                    </p>
                </div>

                <!--Slider photo-->
                <div class="slider-photo">
                    <div class="gallery-display-area">
                        <div class="gallery-wrap">
                            <div class="image">
                                <img src="img/slider.jpg" alt="">
                            </div>
                            <div class="image">
                                <img src="img/slider.jpg" alt="">
                            </div>
                            <div class="image">
                                <img src="img/slider.jpg" alt="">
                            </div>
                            <div class="image">
                                <img src="img/slider.jpg" alt="">
                            </div>
                            <div class="image">
                                <img src="img/slider.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="whey-products">
                <div class="bestSeller-photo">
                    <img src="img/whey (2).jpg" alt="">
                </div>

                <div id="product-grid" class="products">
                    <c:set var="whey" value="${sessionScope.WHEY_DETAIL_LIST}"/>                           
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
