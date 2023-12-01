<%-- 
    Document   : Login
    Created on : Nov 22, 2023, 4:28:24 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="navigation.jsp"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Laporan Borang Aduan Pelanggan</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: "Poppins", sans-serif;
            box-sizing: border-box;
        }
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #E5EAEA;
        }

        .wrapper{
            width: 420px;
            background: #88BFB7;
            color: #fff;
            border-radius: 10px;
            padding: 30px 40px;
        }

        .wrapper h1{
            font-size: 36px;
            text-align: center;
        }

        .wrapper .input-box{
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

        .input-box input::placeholder {
            color: #fff;
        }

        .input-box i {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
        }

        .wrapper .remember-password{
            display: flex;
            justify-content: space-between;
            font-size: 14.5px;
            margin: -15px 0 15px;
            
        }

        .remember-password label input{
            accent-color: #fff;
            margin-right: 3px;
        }

        .remember-password a {
            color: #fff;
            text-decoration: none;
        }

        .remember-password a:hover {
            text-decoration: underline;
        }

        .wrapper .btn{
            width: 100%;
            height: 45px;
            background: #fff;
            border: none;
            outline: none;
            border-radius: 40px;
            box-shadow: 0  0 10px rgba(0, 0, 0, .1);
            cursor: pointer;
            font-size: 16px;
            color: #333;
            font-weight: 600;
        }

    </style>
    <body>
        <div class="wrapper">
            <form method="POST" action="<%=request.getContextPath()%>/AdminController" class="login-form"
                id="login-form" >
                <h1>Login</h1>
                <div class="input-box">
                    <input type="text" placeholder="Email" required>  
                    <i class="bx bxs-envelope"></i>                
                </div>
                <div class="input-box">
                    <input type="password" placeholder="Password" required>  
                    <i class='bx bxs-lock-alt' ></i>                  
                </div>
                <div class="remember-password">
                    <a href="#">Forgot password?</a>
                </div>

                <button type="submit" class="btn">Login</button>

                
            </form>
        </div>
    </body>
</html>
