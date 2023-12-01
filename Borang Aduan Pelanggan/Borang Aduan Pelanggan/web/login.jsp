<%-- 
    Document   : login.jsp
    Created on : Nov 28, 2023, 3:14:27 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Laporan Borang Aduan Pelanggan</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@2.1.0/css/boxicons.min.css">
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        font-family: "futura md bt";
        text-decoration: none;
        list-style: none;
        box-sizing: border-box;
    }

    body {
        background: #E5EAEA;
    }

    .container {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .header-and-login {
        width: 100%;
        max-width: 100%; /* Adjust the maximum width as needed */
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    @media only screen and (max-width: 700px) {
        .header-and-login {
            flex-direction: column;
            align-items: stretch;
        }
    }

    header {
        background: #88BFB7;
        width: 100%;
        height: 90px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 50px;
    }

    .logo img {
        height: 80px;
        background-image: none;
    }

    nav ul {
        display: flex;
    }

    nav ul li a {
        display: inline-block;
        color: #000;
        padding: 5px 0;
        margin: 0 10px;
        border: 3px solid transparent;
        text-transform: uppercase;
        transition: 0.2s;
    }

    nav ul li a:hover,
    nav ul li a.active {
        border-bottom-color: #ACE8E0;
    }

    .navigation {
        cursor: pointer;
        display: none;
    }

    .navigation div {
        width: 30px;
        height: 3px;
        margin: 5px 0;
        background: #000;
    }

    @media only screen and (max-width: 900px) {
        header {
            padding: 0 30px;
        }
    }

    @media only screen and (max-width: 700px) {
        .navigation {
            display: block;
        }
        nav {
            position: absolute;
            width: 100%;
            left: -100%;
            top: 70px;
            width: 100%;
            background: #fff;
            padding: 30px;
            transition: 0.3s;
        }
        #nav_check:checked ~ nav {
            left: 0;
        }
        nav ul {
            display: block;
        }
        nav ul li a {
            margin: 5px 0;
        }
    }
    
    /*untuk login part*/
    .wrapper {
        width: 420px;
        background: #fff;
        color: black;
        border-radius: 10px;
        padding: 30px 40px;
        margin-top: 60px; /* Adjust margin as needed */
    }

    .wrapper h1 {
        font-size: 36px;
        text-align: center;
    }

    .input-box {     
        position: relative;
        width: 100%;
        height: 50px;
        margin: 30px 0;        
    }

    .input-box input {
        width: 100%;
        height: 100%;
        background: transparent;
        border: none;
        outline: none;
        border: 4px solid rgba(0, 0, 0, .1);
        border-radius: 40px;
        font-size: 16px;
        color: black;
        padding: 20px 45px 20px 20px;
    }

    .input-box input::placeholder {
        color: black;
    }

    .input-box i {
        position: absolute;
        right: 20px;
        top: 50%;
        transform: translateY(-50%);
        font-size: 20px;
    }
    
    

    .remember-password {
        display: flex;
        justify-content: space-between;
        font-size: 14.5px;
        margin: -15px 0 15px;
    }

    .remember-password label input {
        accent-color: black;
        margin-right: 3px;
    }

    .remember-password a {
        color: black;
        text-decoration: none;
    }

    .remember-password a:hover {
        text-decoration: underline;
    }

    .btn {
        width: 100%;
        height: 45px;
        background: #88BFB7;
        border: 2px solid #333;
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
    <div class="container">
        <div class="header-and-login">
            <header>
                <div class="logo">
                    <img src="../images/logo AJ.png" alt="ADTEC Jerantut Logo">
                </div>
                <input type="checkbox" id="nav_check" hidden>
                <label for="nav_check" class="navigation">
                    <div></div>
                    <div></div>
                    <div></div>
                </label>
            </header>
            
            
            <div class="wrapper">
                <form method="POST" action="<%=request.getContextPath()%>/AdminController" class="login-form"
                          id="login-form" onsubmit="return validateForm()">
                    <h1>Login</h1>
                    <div class="input-box">
                        <input type="text" placeholder="Nama pengguna" name="username" required>  
                        <i class='bx bx-user'></i>             
                    </div>
                    <div class="input-box">
                        <input type="password" placeholder="Kata laluan" name="password" required>  
                        <i class='bx bxs-lock-alt' ></i>                  
                    </div>
<!--                    <div class="remember-password">
                        <a href="#">Lupa kata laluan?</a>
                    </div>-->
                    <button type="submit" class="btn" name="action" value='login'>Log masuk</button>
                </form>
            </div>
        </div>
    </div>
    
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;

            console.log("Username:", username);
            console.log("Password:", password);

            if (isEmpty(username) || isEmpty(password)) {
                alert("Username and password are required.");
                return false; // prevent form submission
            }

            return true; // allow form submission
        }
    </script>
                                                         
</body>
</html>

