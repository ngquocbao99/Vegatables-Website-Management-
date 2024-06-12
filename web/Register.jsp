<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <link rel="stylesheet" href="css/register.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

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
                width: 750px;
                background: #333;
                color: #fff;
                border-radius: 10px;
                padding: 40px 35px 55px;
                margin: 0 10px;
            }

            .wrapper h1{
                font-size: 36px;
                text-align: center;
                margin-bottom: 20px;
            }

            .wrapper .input-box{
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;

            }

            .input-box .input{
                position: relative;
                width: 48%;
                height: 50px;
                margin: 13px 0;
            }

            .input-box .input input{
                width: 100%;
                height: 100%;
                background: transparent;
                border: 2px solid rgba(255, 255, 255, .2);
                outline: none;
                font-size: 16px;
                color: #fff;
                border-radius: 6px;
                padding: 15px 15px 15px 40px;

            }

            .input-box .input input::placeholder{
                color: #fff;
            }

            .input-box .input i{
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 20px;
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

            .wrapper label{
                display: inline-block;
                font-size: 14.5px;
                margin: 10px 0 23px;
            }

            .wrapper label input{
                accent-color: #fff;
                margin-right: 5px;
            }

            .wrapper .btn{
                width: 100%;
                height: 45px;
                background: #7fad39;
                border: none;
                outline: none;
                border-radius: 6px;
                box-shadow: 0 0 10px rgba(0, 0, 0, .1);
                cursor: pointer;
                font-size: 16px;
                color: #333;
                font-weight: 600;
            }

            .input-box .input.a {
                width: 100%;
            }
            .text-danger{
                margin-top: 20px;
                color: red;
            }

        </style>
    </head>

    <body>
        <div class="wrapper">
            <form action="register" method="post">
                <h1>Đăng ký</h1>
                <p class="text-danger">${mess}</p>
                <div class="input-box">
                    <div class="input">
                        <input name="name" type="text" placeholder="Tên" required>
                        <i class='bx bxs-user'></i>
                    </div>  
                    <div class="input">
                        <input name="username" type="text" placeholder="Tài khoản" required>
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input">
                        <input name="pass" type="password" placeholder="Mật khẩu" required>
                        <i class='bx bxs-lock-alt'></i>
                    </div>
                    <div class="input">
                        <input name="repass" type="password" placeholder="Nhập lại mật khẩu" required>
                        <i class='bx bxs-lock-alt'></i>
                    </div>   

                    <div class="input">
                        <input name="phone" type="text" placeholder="Số điện thoại" required>
                        <i class='bx bxs-phone'></i>
                    </div>  

                    <div class="input">
                        <input name="address" type="text" placeholder="Địa chỉ" required>
                        <i class='bx bxs-address'></i>
                    </div> 

                    <div class="input"><label  for="lang-select">Giới tính
                            <select name="gender" id="lang-select">
                                <option value="Male">Nam</option>
                                <option value="female">Nữ</option>
                            </select></label>
                    </div>
                </div>

                <!--<label> <input type="checkbox">I read</label>-->

                <button type="submit" class="btn">Đăng ký</button>
            </form>
        </div>
    </body>

</html>