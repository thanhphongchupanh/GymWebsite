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
                    <img src="img/img1.jpg" alt="">
                </div>

                <div id="product-grid" class="products">
                    <c:set var="result" value="${sessionScope.WHEY_LIST}"/>                           
                    <c:forEach items="${result}" var="product">
                        <div class="product-item">
                            <div class="product-inner">
                            <div class="product-top">
                                <a href="" class="product-thumb">
                                    <img src="img/img1.jpg" alt="">
                                </a>
                                <a href="" class="buy-now">Buy Now</a>
                            </div>
                            <div class="product-info">
                                <a href="" class="product-cat">Bag</a>
                                <a href="" class="product-name">${product.name}</a>
                                <div class="product-price">$ ${product.price}</div>
                            </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty result}">
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
                fetch('./WheyProductListServlet') // Use the relative URL here
                        .then(response => {
                            return response.json();
                        })
            }
        </script>
    </body>
</html>
