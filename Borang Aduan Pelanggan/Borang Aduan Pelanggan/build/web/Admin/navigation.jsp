<%-- 
    Document   : navigation
    Created on : Nov 22, 2023, 4:27:22 PM
    Author     : USER
--%>

<%@page import="dao.AdminDao"%>
<%@page import="model.Admin"%>
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
        header {
            background: #88BFB7;
            width: 100%;
            height: 90px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 50px;
            z-index: 1000;
            position: fixed;
            top: 0;
        }
        header .logo img {
            height: 70px;
            background-image: none;
        }   
        
        header nav ul {
            display: flex;
        }
        header nav ul li a {
            display: inline-block;
            color: #000;
            padding: 5px 0;
            margin: 0 10px;
            border: 3px solid transparent;
            text-transform: uppercase;
            transition: 0.2s;
        }
        header nav ul li a:hover,
        header nav ul li a.active {
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
            header nav {
                position: absolute;
                width: 100%;
                left: -100%;
                top: 70px;
                width: 100%;
                background: #fff;
                padding: 30px;
                transition: 0.3s;
            }
            header #nav_check:checked ~ nav {
                left: 0;
            }
            header nav ul {
                display: block;
                text-align: center; 
            }
            header nav ul li a {
                margin: 10px 0;
            }            
        }
        
        /*untuk profil*/
        .sub-menu-wrap {
            position: absolute;
            top: 100%;
            right: 5%;
            width: 180px;
            height: 0;
            overflow: hidden;
            transition: height 0.5s;
        }

        .sub-menu-wrap.open-menu {
            height: auto;
        }

        .sub-menu {
            background: #88BFB7; 
            padding: 20px;
            margin: 10px;
        }
        .sub-menu hr {
            border: 0;
            height: 1px;
            width: 100%;
        }

        .sub-menu-link {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #525252;
            margin: 12px 0;
        }

        .sub-menu-link i {
            margin-right: 10px; 

        .sub-menu-link p {
            width: 100%;
        }

        .sub-menu-link span {
            font-size: 22px;
            transition: transform 0.5s;
        }

        .sub-menu-link:hover span {
            transform: translateX(5px);
        }

        .sub-menu-link:hover p {
            font-weight: 600;
        }
        
    </style>
    <%
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        
        String username = (String) session.getAttribute("username");
        
    %>
    <body>
        <header>
            <div class="logo">
                <img src="../images/logo AJ.png" alt="ADTEC Jerantut Logo">
            </div>
            <input type="checkbox" id="nav_check" hidden>
            <nav>
                <ul>
                    <li>
                        <a href="../Admin/MaklumatAduan.jsp">Senarai Aduan</a>
                        
                    </li> 
                    
                    <li>
                        <a href="#" onclick="toggleMenu()"><i class='bx bx-user'></i>Hi, <%= admin != null ? admin.getUsername() : "Guest" %></a>
                        <div class="sub-menu-wrap" id="subMenu">
                            <a href="../Admin/Profile.jsp" class="sub-menu-link">
                                <i class='bx bx-user-circle'></i>
                                <p>Profil</p>
                                <span></span>
                            </a>
                            <a href="../Admin/ListAdmin.jsp" class="sub-menu-link">
                                <i class='bx bx-user-plus'></i>
                                <p>Senarai admin</p>
                                <span></span>
                            </a>
                            <a href="../Admin/Logout.jsp" class="sub-menu-link">
                                <i class='bx bx-log-out'></i>
                                <p>Log keluar</p>                           
                                <span></span>
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
            <label for="nav_check" class="navigation">
                <div></div>
                <div></div>
                <div></div>
            </label>
        </header>
        
        <script>
            // Add an event listener to the logout link
            document.getElementById("logoutLink").addEventListener("click", function () {
                window.location.href = "index.html"; 
            });
            
            //function toggle user icon
            function toggleMenu() {
                var subMenu = document.getElementById("subMenu");
                subMenu.classList.toggle("open-menu");
            }
        </script>
    </body>
</html>
