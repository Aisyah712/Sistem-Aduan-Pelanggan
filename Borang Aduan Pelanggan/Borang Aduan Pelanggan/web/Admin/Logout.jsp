<%-- 
    Document   : Logout
    Created on : Nov 23, 2023, 12:05:26 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Laporan Borang Aduan Pelanggan</title>
    </head>
    <body>
        <%
            session = request.getSession();
            session.invalidate();
            
            response.sendRedirect("../login.jsp");
        %>
    </body>
</html>
