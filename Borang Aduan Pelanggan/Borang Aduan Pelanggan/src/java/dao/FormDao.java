/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import database.MySQL;
import static database.MySQL.getConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Form;

/**
 *
 * @author USER
 */
public class FormDao {
    
    private final Connection con;
    public FormDao() throws SQLException, ClassNotFoundException{
        con = MySQL.getConnection();
    }
    
    //to save customer details
    public void addForm(Form form) throws SQLException{
        try {
            String mySQLQuery = "insert into customer(customerEmail, customerName, customerID, "
                    + "customerPhoneNumber, buildingNo, state, city, zipcode, detailsComplaint, sourceComplaint, dateComplaint) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, form.getCustomerEmail());
            myPS.setString(2, form.getCustomerName());
            myPS.setString(3, form.getCustomerID());
            myPS.setString(4, form.getCustomerPhoneNumber());
            myPS.setString(5, form.getBuildingNo());
            myPS.setString(6, form.getCity());
            myPS.setString(7, form.getState());
            myPS.setInt(8, form.getZipcode());
            myPS.setString(9, form.getDetailsComplaint());
            myPS.setString(10, form.getSourceComplaint());
            myPS.setDate(11, form.getDateComplaint());
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            con.close();
        }
    }
    
    //retrieve all form
    public static List<Form> retrieveAllForm() throws SQLException {
            List<Form> l = new ArrayList<>();
            Connection connection = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                 connection = MySQL.getConnection();
                 String sqlSelect = "SELECT * FROM form";
                 stmt = connection.prepareStatement(sqlSelect);
                 rs = stmt.executeQuery(sqlSelect);

                 while(rs.next()) {
                     Form form = new Form(rs.getString(1), rs.getString(2), rs.getString(3),
                     rs.getString(4),rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getDate(11));
                     l.add(form);
                 } 
            } catch(Exception e) {
                System.out.println(e);
            } finally {
                if(connection != null && stmt != null && rs != null) {
                    MySQL.closeConnection(connection, stmt, rs);
                }
            }
            return l;
    } 
    
    //retrieve form  by name
    public static Form retrieveFormByCustomerName(String customerName) throws ClassNotFoundException, SQLException {

        Form form = new Form();

        String mySQLQuery = "select * from form";
        Connection connection = getConnection();

        try {
            PreparedStatement myPS = MySQL.getConnection()
                .prepareStatement("select * from form where customerName=?" + customerName + "'");

            myPS.setString(1, customerName);
            ResultSet rs = myPS.executeQuery();

            while (rs.next()) {
                String customerEmail = rs.getString("customerEmail");
                String customerID = rs.getString("customerID");
                String customerPhoneNumber = rs.getString("customerPhoneNumber");
                String detailsComplaint = rs.getString("detailsComplaint");
                String sourceComplaint = rs.getString("sourceComplaint");
                Date dateComplaint = rs.getDate("dateComplaint");
                
                
                form = new Form(customerEmail, customerID, customerPhoneNumber, detailsComplaint, sourceComplaint, dateComplaint);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            connection.close();
        }
        return form;
    }
    
    //find form by customerID
    public static Form findFormByID(String customerID) throws SQLException {
        Form form = null;
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connection = MySQL.getConnection();
            String sqlSelect = "SELECT * FROM form where customerID='" + customerID+ "'";
            stmt = connection.prepareStatement(sqlSelect);
            rs = stmt.executeQuery(sqlSelect);

            if(rs.next()) {
                form = new Form(rs.getString(1), rs.getString(2), rs.getString(3),
                rs.getString(4),rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8),
                rs.getString(9), rs.getString(10), rs.getDate(11));
            }
        } catch(Exception e) {
            System.out.println(e);
        }  finally {
            if(connection != null && stmt != null && rs != null) {
                MySQL.closeConnection(connection, stmt, rs);
            }
        }
        return form;
    } 
}
