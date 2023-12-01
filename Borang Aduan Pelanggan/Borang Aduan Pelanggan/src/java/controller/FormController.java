/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.FormDao;
import database.MySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Form;

/**
 *
 * @author USER
 */
public class FormController extends HttpServlet{
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {

        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "addForm":
                    addForm(request, response);
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "index.jsp");
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
            Logger.getLogger(FormController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FormController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(FormController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FormController.class.getName()).log(Level.SEVERE, null, ex);
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
    
    //part add form
    private void addForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException, ServletException {

        Connection connection = MySQL.getConnection();
        PrintWriter out = response.getWriter();
                
        // Generate the current date
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String date = currentDate.format(formatter);
                
        //get all data from form
        String customerID = request.getParameter("customerID");
        String customerName = request.getParameter("customerName");
        //masukkan daam generate form nanti
        String address = request.getParameter("buildingNo") + ", " + request.getParameter("zipCode") + " "+ request.getParameter("city") + ", " + request.getParameter("state");
        String buildingNo = request.getParameter("buildingNo");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        int zipcode = Integer.parseInt(request.getParameter("zipcode"));
        String customerEmail = request.getParameter("clientEmail");
        String customerPhoneNumber = request.getParameter("clientPhoneNumber");
        

        //keep data into javabeans
        Form newForm = new Form();

        newForm.setCustomerName(customerName);    
        newForm.setCustomerEmail(customerEmail);
        newForm.setCustomerPhoneNumber(customerPhoneNumber);
        newForm.setBuildingNo(buildingNo);
        newForm.setCity(city);
        newForm.setState(state);
        newForm.setZipcode(zipcode);
        
        //pass the bean to DAO
        FormDao formDao = new FormDao();
        formDao.addForm(newForm);

        //save the bean as attribute and pass to view
        request.getSession().setAttribute("newForm", newForm);
//        response.sendRedirect("./Client/Client-Dashboard.jsp");

    }

}
