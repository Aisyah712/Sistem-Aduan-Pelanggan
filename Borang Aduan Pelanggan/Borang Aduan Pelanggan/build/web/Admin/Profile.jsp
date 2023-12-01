<%-- 
    Document   : Profile
    Created on : Nov 23, 2023, 11:59:06 AM
    Author     : USER
--%>

<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="navigation.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laporan Borang Aduan Pelanggan</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>
    <style>
        *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
/*        font-family: 'Poppins', sans-serif;    */
    }

    body{
        background: #E5EAEA;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .container {
        max-width: 420px;
        width: 100%;
        height: 50vh;
        background: #fff;
        box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);
        margin-top: -100px;
        padding: 30px 0px;
    }

/*    .container {
            max-width: 400px;
            width: 100%;
            height: 100vh;
            background: #fff;
            box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);
            margin-top: 70px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }*/

        .tbl-container {
            width: 100%;
        }
    .container h2{
        padding: 0rem 1rem;
        font-size: 2.5rem;
        text-align: center;
    }
    
    /*profile part*/
    .wrapper {
        width: 420px;
        background: #fff;
        color: black;
        border-radius: 10px;
        padding: 30px 40px;
        margin-top: -50px; 
    }
    
    .input-box {     
        position: relative;
        width: 100%;
        height: 40px;
        margin: 50px 0;        
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
        top: 100%;
        transform: translateY(-50%);
        font-size: 20px;
    }
    
    .input-box i bx bx-show {
        right: 30px;
    }
    
     .password-input {
        position: relative;
    }

    .password-input input {
        width: calc(100% - 40px);
        padding-right: 40px;
    }

    .password-input i {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        right: 10px;
        cursor: pointer;
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
        margin-top: 25px;
    }
    
    .header-and-login {
        width: 100%;
        max-width: 100%;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    </style>
    <%
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        
        String username = (String) session.getAttribute("username");
        
    %>
    
    <body>
        <div class="container">
            <div class="tbl-container">
                <h2>Profil Diri</h2>
                <div class="wrapper">
                    <form class='secActive' action="../AdminController?action=update" method="POST" name="update" >
                        <div class="input-box">
                            <label>Nama Penuh</label>
                            <input type="text" id="fullname" value="<%=admin.getFullName()%>" disabled>  
                            <i class='bx bx-user'></i>             
                        </div>
                        <div class="input-box">
                            <label>Nama Pengguna</label>
                            <input type="text" id="username" value="<%=admin.getUsername()%>" disabled>  
                            <i class='bx bx-user'></i>                  
                        </div>
                        <div class="input-box">
                            <label>No Telefon</label>
                            <input type="text" id="phoneNo" value="<%=admin.getPhoneNo()%>">  
                            <i class='bx bxs-phone'></i>             
                        </div>
                        <div class="input-box">
                            <label>Alamat E-mel</label>
                            <input type="text" id="email" value="<%=admin.getEmail()%>">  
                            <i class='bx bx-envelope'></i>             
                        </div>
                        <div class="input-box">
                            <label>Admin ID</label>
                            <input type="text" id="adminID" value="<%=admin.getAdminID()%>" disabled>  
                            <i class='bx bx-envelope'></i>             
                        </div>
                        <div class="input-box">
                            <label>Kata laluan</label>
                            <input type="password" id="password" value="<%=admin.getPassword()%>">
                            <i class='bx bx-show' id="togglePassword"></i>
                        </div>
    <!--                    <div class="remember-password">
                            <a href="#">Lupa kata laluan?</a>
                        </div>-->
                        <button type="submit" class="btn" name="action" value="update" href="../Admin/Profile.jsp" onclick="return confirm('Simpan perubahan ini?')">Simpan</button>            
                    </form>
                </div>
            </div>
        </div>
                            
        <script>
            var passwordInput = document.getElementById('password');
                var togglePasswordIcon = document.getElementById('togglePassword');

                togglePasswordIcon.addEventListener('click', function () {
                    passwordInput.type = passwordInput.type === 'password' ? 'text' : 'password';
                    togglePasswordIcon.className = passwordInput.type === 'password' ? 'bx bx-show' : 'bx bx-hide';
            });
        </script>                    
    </body>
</html>
