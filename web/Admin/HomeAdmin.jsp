<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <!--        <meta name="description" content="Ogani Template">
                <meta name="keywords" content="Ogani, unica, creative, html">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">-->
        <title>Fresh Market</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">


        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <style>
            a{
                color: black;
            }
        </style>

    </head>



<!--    <body>

        <%--<jsp:include page="Header.jsp"></jsp:include>--%>
        <h5>Hello ${acc.getAcc_name()}</h5>
        <section class="hero ">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">

                        <div class="latest-product__text">
                            <%--<c:forEach items="${listP}" var="o">--%>
                                <h5>xxx</h5>  
                                <h5>Hello ${o.pro_name}</h5>
                            <%--</c:forEach>--%>
                        </div>
                    </div>
                </div>
            </div>
        </section>-->

        <!-- Featured Section End -->

        <%--<jsp:include page="Footer.jsp"></jsp:include>--%>
        <body>
        <jsp:include page="Header.jsp"></jsp:include>

            <!-- Shoping Cart Section Begin -->
            <section class="shoping-cart spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="shoping__cart__table">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="shoping__product">Sản Phẩm</th>
                                            <th>Ảnh</th>
                                            <th>Giá</th>
                                            <th>Số Lượng</th>
                                            <!--<th>Tổng Cộng</th>-->
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listP}" var="o">
                                    <tr>
                                        <td class="shoping__cart__item">
                                            <h5>${o.pro_name}</h5>
                                        </td>
                                        <td class="shoping__cart__price">
                                             <img src="${o.pro_image}">
                                        </td>
                                        <td class="shoping__cart__price">
                                             <h5>${o.pro_price}</h5>
                                        </td>
                                        <td class="shoping__cart__price">
                                             <h5>${o.pro_quantity}</h5>
                                        </td>
<!--                                        <td class="shoping__cart__quantity">
                                            <div class="quantity">
                                                <div class="pro-qty">
                                                    <input type="text" value="1">
                                                </div>
                                            </div>
                                        </td>-->
                                        <!--                                        <td class="shoping__cart__total">
                                                                                    $110.00
                                                                                </td>-->
                                        <td class="shoping__cart__item__close">
                                            <span class="icon_close"></span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shoping Cart Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>


    </body>
</html>