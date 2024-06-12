<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="css/login.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <style>


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('https://sanodyna.com.vn/wp-content/uploads/2020/12/0QDG8alS9V.jpg') no-repeat;
            background-size: cover;
            background-position: center;
        }

        .wrapper{
            width: 420px;
            background: #333;
            border: 2px solid rgba(255, 255, 255, .2);
            color: #fff;
            border-radius: 10px;
            padding: 30px 40px;
        }

        .wrapper h1{
            font-size: 36px;
            text-align: center;
        }

        .wrapper .input-box{
            position: relative;
            width: 100%;
            height: 50px;
            margin: 30px 0;
        }

        .input-box input{
            width: 100%;
            height: 100%;
            background: transparent;
            border: none;
            outline: none;
            border: 2px solid rgba(255, 255, 255, .2);
            border-radius: 40px;
            font-size: 16px;
            color: #fff;
            padding: 20px 45px 20px 20px;
        }

        .input-box input::placeholder{
            color: #fff;
        }

        .input-box i {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
        }

        .wrapper .remember-forgot{
            display: flex;
            justify-content: space-between;
            font-size: 14.5px;
            margin: -15px 0 15px;
        }

        .remember-forgot label input{
            accent-color: #fff;
            margin-right: 3px;
        }

        .remember-forgot a{
            color: #fff;
            text-decoration: none;
        }
        .remember-forgot a:hover{
            text-decoration: underline;
        }

        .wrapper .btn{
            width: 100%;
            height: 45px;
            background: #7fad39;
            border: none;
            outline: none;
            border-radius: 40px;
            box-shadow: 0 0 10px rgba(0, 0, 0, .1);
            cursor: pointer;
            font-size: 16px;
            color: #333;
            font-weight: 600;
        }

        .wrapper .register-link{
            font-size: 14.5px;
            text-align: center;
            margin-top: 15px ;
        }

        .register-link p a{
            color: #fff;
            text-decoration: none;
            font-weight: 600;
        }
        .register-link p a:hover{
            text-decoration: underline;
        }
        .text-danger{
            margin-top: 20px;
            color: red;
        }


        /*//popup*/
        .modal {
            display: none; /* Ẩn modal mặc định */
            position: fixed; /* Thực thi vị trí cố định */
            z-index: 1; /* Hiển thị modal trên tất cả các phần tử khác */
            left: 0;
            top: 0;
            width: 100%; /* Chiều rộng cửa sổ trình duyệt */
            height: 100%; /* Chiều cao cửa sổ trình duyệt */
            overflow: auto; /* Tạo thanh cuộn nếu cần */
            background-color: rgba(0,0,0,0.4); /* Màu nền đen với độ mờ */
            padding-top: 60px; /* Khoảng cách từ trên xuống modal */
        }

        /* CSS cho nội dung modal */
        .modal-content {
            background-color: #fefefe;
            color: #333;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* CSS cho nút đóng modal */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

    </style>
    <body>
        <div class="wrapper">

            <form action="login" method="post">
                <h1>Đăng nhập</h1>
                <!--<p class="text-danger">${mess}</p>-->
                <div class="input-box">
                    <input name="username" type="text" placeholder="Tài khoản" required>
                    <i class='bx bxs-user'></i>
                </div>
                <div class="input-box">
                    <input name="password" type="password" placeholder="Mật khẩu" required>
                    <i class='bx bxs-lock-alt' ></i>
                </div>
                <div class="remember-forgot">
                    <!--<label><input name="remember" type="checkbox"> Remember me</label>-->
                    <a href="ForgotPassword.jsp">Bạn quên mật khẩu?</a>
                </div>
                <button type="submit" class="btn">Login</button>

                <div class="register-link">
                    <p>Đăng ký <a href="Register.jsp">tại đây</a></p>   
                </div>

                <div id="myModal" class="modal">
                    <!-- Nội dung modal -->
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <p id="popupMessage"></p>
                    </div>
                </div>

            </form>
        </div>


    </body>

    <script>
// Lấy modal và nội dung popup
        var modal = document.getElementById("myModal");
        var popupMessage = document.getElementById("popupMessage");

// Lấy button đóng modal
        var span = document.getElementsByClassName("close")[0];

// Khi người dùng click vào nút đóng, đóng modal
        span.onclick = function () {
            modal.style.display = "none";
        }

// Khi người dùng click bất kỳ đâu ngoài modal, đóng modal
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

// Hàm hiển thị popup nếu biến mess tồn tại
        function checkAndShowPopup() {
            var mess = "${mess}"; // Lấy giá trị của biến mess từ mã HTML
            if (mess) {
                popupMessage.innerText = mess; // Đặt nội dung của popup
                modal.style.display = "block"; // Hiển thị modal
            } else {
                modal.style.display = "none"; // Ẩn modal nếu mess không tồn tại
            }
        }

// Gọi hàm kiểm tra và hiển thị popup khi tài liệu được tải xong
//        document.addEventListener("DOMContentLoaded", checkAndShowPopup);

        document.addEventListener("DOMContentLoaded", function () {
            checkAndShowPopup();

            // Tự động tắt modal sau 3 giây
            setTimeout(function () {
                modal.style.display = "none";
            }, 3000);
        });

    </script>

</html>