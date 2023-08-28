<%@page import="java.util.List"%>
<%@page import="model.DTO.CategoryDTO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/navigationBar.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script type="text/javascript" src="js/jQuery.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <div class="menu-bar">
            <ul>
                <li><a href="homepage.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                <li><a id="allProductsLink" href="#"><i class="fa fa-th-list" aria-hidden="true"></i>All products</a></li>
                <div class="sub-menu-1" style="display: none;">
                    <ul>
                        <c:set var="result" value="${sessionScope.CATE_LIST}"/>
                        <c:forEach var="dto" items="${result}">
                            <li><a href="#"><c:out value="${dto.name}" /></a></li>
                            </c:forEach>
                    </ul>
                </div>

                <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Service</a></li>
                <li><a href="#"><i class="fa fa-shopping-bag" aria-hidden="true"></i>Your Order</a></li>
            </ul>           
        </div>
    </body>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#allProductsLink").hover(function () {
                $.ajax({
                    url: "NavDropDownServlet", // ???ng d?n ??n servlet
                    type: "GET",
                    success: function (data) {
                        var subMenu = $(".sub-menu-1");

                        // Hi?n submenu khi hover
                        subMenu.css("display", "block");
                        subMenu.css("position", "absolute");
                        subMenu.css("background", "#B9B4C7");
                        subMenu.css("margin-top", "70px");
                        subMenu.css("margin-left", "170px");

                        var subMenuUl = subMenu.find("ul");
                        subMenuUl.css("display", "block");
                        subMenuUl.css("margin", "10px");

                        var subMenuLi = subMenuUl.find("li");
                        subMenuLi.css("width", "150px");
                        subMenuLi.css("padding", "10px");
                        subMenuLi.css("border-bottom", "1px dotted #fff");
                        subMenuLi.css("background", "transparent");
                        subMenuLi.css("border-radius", "0");
                        subMenuLi.css("text-align", "left");
                        subMenuLi.css("z-index", "1000");
                        var subMenuLink = subMenuLi.find("a");
                        subMenuLink.hover(function () {
                            $(this).css("color", "#fff");
                        });
                    },
                    error: function (xhr, status, error) {
                        console.log("Error: " + error);
                    }
                });
            }, function () {
                setTimeout(function () {
                subMenu.css("display", "none");
            }, 2000);
            });
            // B?t s? ki?n hover vào sub-menu
            $(".sub-menu-1").hover(function () {
                $(this).css("display", "block");
            }, function () {
                $(this).css("display", "none");
            });
        });
    </script>

</html>