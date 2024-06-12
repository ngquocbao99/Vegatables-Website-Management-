<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-4">
                    <div class="header__top__left">
                        <ul>
                            <li>Xin chào ${acc.getAcc_name()}!</li>
                            <li>Chào mừng đến với cửa hàng của chúng tôi.</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-8">
                    <div class="header__top__right">

                        <c:if test="${sessionScope.acc == null}">
                            <div class="header__top__right__auth">
                                <a href="Login.jsp"><i class="fa fa-user"></i>Đăng nhập</a>
                            </div>
                        </c:if>

                        <c:if test="${sessionScope.acc != null}">
                            <div class="header__top__right__auth">
                                <a href="logout"><i class="fa fa-user"></i>Đăng xuất</a>
                            </div>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="home"><img src="https://static.ybox.vn/2021/5/3/1621994139101-LOGOTN.PNG" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <c:if test="${acc.getIsAdmin() == 0}">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="home">Trang chủ</a></li>

                            <li><a href="#">Tài khoản</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="#">Thông tin của bạn</a></li>
                                    <li><a href="#">Thay đổi mật khẩu</a></li>
                                    <!--<li><a href="#">Tình trạng đơn hàng</a></li>-->
                                </ul>
                            </li>
                            <li><a href="#">Đơn hàng</a></li>
                            <li><a href="#">Đánh giá</a></li>
                        </ul>
                    </nav>
                </c:if>

                <c:if test="${acc.getIsAdmin() == 1}">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="../home">Trang chủ</a></li>

                            <li><a href="Admin/ManageProduct.jsp">Sản phẩm</a>
                            </li>
                            <li><a href="#">Tài khoản</a></li>
                            <li><a href="#">Đánh giá</a></li>
                        </ul>
                    </nav>
                </c:if>

            </div>
            <!--            <div class="col-lg-3">
                            <div class="header__cart">
                                <ul>
                                    <li><a href="#"><i class="fa fa-heart"></i> <span>#</span></a></li>
                                    <li><a href="Cart.jsp"><i class="fa fa-shopping-bag"></i> <span>#</span></a></li>
                                </ul>
                                <div class="header__cart__price">item: <span>$150.00</span></div>
                            </div>
                        </div>-->
        </div>
    </div>



</header>
<!-- Header Section End -->