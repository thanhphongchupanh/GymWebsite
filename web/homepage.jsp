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

        <ul class="products">
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="img/img1.jpg" alt="">
                        </a>
                        <a href="" class="buy-now">Buy Now</a>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Bag</a>
                        <a href="" class="product-name">Dasi Bag Sonia by Sonia</a>
                        <div class="product-price">$2.99,00</div>
                    </div>
                </div>
            </li>
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="img/img1.jpg" alt="">
                        </a>
                        <a href="" class="buy-now">Buy Now</a>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Bag</a>
                        <a href="" class="product-name">Dasi Bag Sonia by Sonia</a>
                        <div class="product-price">$2.99,00</div>
                    </div>
                </div>
            </li>
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="img/img1.jpg" alt="">
                        </a>
                        <a href="" class="buy-now">Buy Now</a>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Bag</a>
                        <a href="" class="product-name">Dasi Bag Sonia by Sonia</a>
                        <div class="product-price">$2.99,00</div>
                    </div>
                </div>
            </li>
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="img/img1.jpg" alt="">
                        </a>
                        <a href="" class="buy-now">Buy Now</a>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Bag</a>
                        <a href="" class="product-name">Dasi Bag Sonia by Sonia</a>
                        <div class="product-price">$2.99,00</div>
                    </div>
                </div>
            </li>
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="img/img1.jpg" alt="">
                        </a>
                        <a href="" class="buy-now">Buy Now</a>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Bag</a>
                        <a href="" class="product-name">Dasi Bag Sonia by Sonia</a>
                        <div class="product-price">$2.99,00</div>
                    </div>
                </div>
            </li>
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="img/img1.jpg" alt="">
                        </a>
                        <a href="" class="buy-now">Buy Now</a>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Bag</a>
                        <a href="" class="product-name">Dasi Bag Sonia by Sonia</a>
                        <div class="product-price">$2.99,00</div>
                    </div>
                </div>
            </li>
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="img/img1.jpg" alt="">
                        </a>
                        <a href="" class="buy-now">Buy Now</a>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Bag</a>
                        <a href="" class="product-name">Dasi Bag Sonia by Sonia</a>
                        <div class="product-price">$2.99,00</div>
                    </div>
                </div>
            </li>
            <li>
                <div class="product-item">
                    <div class="product-top">
                        <a href="" class="product-thumb">
                            <img src="img/img1.jpg" alt="">
                        </a>
                        <a href="" class="buy-now">Buy Now</a>
                    </div>
                    <div class="product-info">
                        <a href="" class="product-cat">Bag</a>
                        <a href="" class="product-name">Dasi Bag Sonia by Sonia</a>
                        <div class="product-price">$2.99,00</div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    </div>
        
        
        <!--Footer-->
        <footer>
            <%@include file="layout/footer.jsp" %>   
        </footer>            
    </body>
</html>
