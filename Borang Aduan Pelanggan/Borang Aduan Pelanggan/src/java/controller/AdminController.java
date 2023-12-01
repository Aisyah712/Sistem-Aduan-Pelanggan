/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.AdminDao;
import database.MySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin;

/**
 *
 * @author USER
 */
public class AdminController extends HttpServlet{
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        switch (action) {
            case "login":
                login(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "register":
                registerAdmin(request, response);
                break;    
        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
    //login part
    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Connection connection = MySQL.getConnection();
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Admin admin = null;
        
        String selectAdmin = "SELECT * FROM admin where username='" + username + "' and "
            + "password='" + password + "'";
        PreparedStatement statement = connection.prepareStatement(selectAdmin);
        ResultSet rs = statement.executeQuery();

        if (username.isEmpty() || password.isEmpty()) {
            out.println("<script>");
            out.println("alert('Please fill in all details')");
            out.print("location=history.back()");
            out.print("</script>");
        } else if (rs.next()) {

        admin = new Admin(
            rs.getString(1),
            rs.getString(2),
            rs.getString(3),
            rs.getString(4),
            rs.getString(5),
            rs.getString(6)
        );
        request.getSession().setAttribute("admin", admin);
        response.sendRedirect("../Admin/MaklumatAduan.jsp");
        } else {
            out.println("<script>");
            out.println("alert('Invalid Username or password')");
            out.print("location=history.back()");
            out.print("</script>");
        }
    }
    
    //register part
    private void registerAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        Connection connection = MySQL.getConnection();
        PrintWriter out = response.getWriter();
        //Generate logID String
        String logID = "";
        int startRange = 10000;
        int endRange = 99999;
        String str = "";
        int status = 0;

        for (int i = 0; i < startRange; i++) {
            int rand = startRange + (int) (Math.random() * ((endRange - startRange) + 1));
            str = "S" + rand;
            status = AdminDao.findIDByString(str);
            if (status == 0) {
                logID = str;
                break;
            }
        }

        String logAdminName = request.getParameter("logAdminName");
        String logUsername = request.getParameter("logUsername");
        
        String logEmail = request.getParameter("logEmail");
        // Check if the staff with the same email already exists in the database
        if (AdminDao.isAdminExists(logEmail)) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Admin with the same email already exists.\");");
//            out.println("window.location.href = './signup-patient.jsp';");
            out.println("</script>");
            return;
        }
        
        String logPhoneNo = request.getParameter("logPhoneNo");
        String logPassword = request.getParameter("logPassword");
        String logRepassword = request.getParameter("logRepassword");

        if (logPassword.equals(logRepassword)) {
            System.out.println("Correct");

            String selectPatient = "INSERT INTO admin(adminID, fullName, username, email, phoneNo, password, repassword) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(selectPatient);

            statement.setString(1, logID);
            statement.setString(2, logAdminName);
            statement.setString(3, logUsername);
            statement.setString(4, logEmail);
            statement.setString(5, logPhoneNo);
            statement.setString(6, logPassword);
            statement.setString(7, logRepassword);

            int statusRegister = statement.executeUpdate();

            if (statusRegister > 0) {
                Admin admin = new Admin(
                        logID,
                        logAdminName,
                        logUsername,
                        logEmail,
                        logPhoneNo,
                        logPassword,
                        logRepassword
                );
                request.getSession().setAttribute("admin", admin);
                out.println("<script>");
                out.print("var x = ");
                out.println("'" + logID + "';");
                out.println("alert('Successful Registration !!!')");
                out.println("alert('Your auto generated ID is ' + x + ' ')");
//                out.print("window.location.href='./login.jsp'");
                out.print("</script>");
            } else {
                System.out.println("test");
                out.println("<script>");
                out.println("alert('Unuccessful Registration')");
//                out.print("window.location.href='./signup-patient.jsp'");
                out.print("</script>");
            }
        } else {
            System.out.println("Incorrect");
            out.println("<script>");
            out.println("alert('Password doesnt match!')");
//            out.print("window.location.href='./signup-patient.jsp'");
            out.print("</script>");
        }
    }
    
    //update part
    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
    PrintWriter out = response.getWriter();

    String adminID = request.getParameter("adminID");
    String fullName = request.getParameter("fullName");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String phoneNo = request.getParameter("phoneNo");
    String password = request.getParameter("password");

    Admin admin = new Admin(adminID, fullName, username, email, phoneNo, password);

    int result = AdminDao.update(admin);

    if (result > 0) {
        // Invalidate the user's session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        out.println("<script type=\"text/javascript\">");
        out.println("alert (\"Berjaya mengemaskini maklumat!\")");
        out.println("window.location.href = './Admin/Profile.jsp';");
        out.println("</script>");
    } else {
        out.println("<script type=\"text/javascript\">");
        out.println("alert (\"Gagal mengemaskini maklumat\")");
        out.println("window.location.href = './Admin/Profile.jsp';");
        out.println("</script>");
    }
}

    
    
    //part delete
    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        PrintWriter out = response.getWriter();

        String AdminID = request.getParameter("AdminID");

        out.println("<script type=\"text/javascript\">");

        int result = AdminDao.delete(AdminID);

        if (result > 0) {
            out.println("alert(\"Success in deleting admin account\")");
            out.println("window.location.href = './Admin/Profile.jsp';");
        } else {
            out.println("alert(\"Failure in deleting the record\")");
            out.println("window.location.href = './Admin/Profile.jsp';"); 
        }

        out.println("</script>");
    }
}
