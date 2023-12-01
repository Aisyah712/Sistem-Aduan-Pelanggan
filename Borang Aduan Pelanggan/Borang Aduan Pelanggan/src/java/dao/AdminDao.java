/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import database.MySQL;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Admin;

/**
 *
 * @author USER
 */
public class AdminDao {
    
    private final Connection con;

    public AdminDao() throws SQLException, ClassNotFoundException {
        con = MySQL.getConnection();
    }
    
    //add new admin
    public void addAdmin(Admin admin) throws SQLException, IOException {
        try {
            String mySQLQuery = "insert into admin(fullname, username, email, phoneNo, password, Repassword, adminID)";

            PreparedStatement myPS = con.prepareStatement(mySQLQuery);

            myPS.setString(1, admin.getFullName());
            myPS.setString(2, admin.getUsername());
            myPS.setString(3, admin.getEmail());
            myPS.setString(4, admin.getPhoneNo());
            myPS.setString(5, admin.getPassword());
            myPS.setString(6, admin.getRepassword());
            myPS.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            con.close();
        }
    }
    
    //delete acc admin
    public static int delete(String fullname) throws SQLException {
        int result = 0;
        Connection connection = null;
        PreparedStatement stmt = null;
        String name = fullname.trim();
        System.out.println("Kucing");
        try {
            connection = MySQL.getConnection();
            String mySqlQuery = "DELETE FROM admin WHERE fullname=?";
            stmt = connection.prepareStatement(mySqlQuery);
            stmt.setString(1, fullname);

            result = stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception is ;" + e);
        } finally {
            if (connection != null && stmt != null) {
                connection.close();
                stmt.close();
            }
        }
        return result;
    }
    
    public void save(Admin admin) throws SQLException{
        try {
            String mySQLQuery = "insert into admin(fullname, username, email, "
                    + "phoneNo, password, Repassword, adminID) values(?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement myPS = con.prepareStatement(mySQLQuery);
            
            myPS.setString(1, admin.getFullName());
            myPS.setString(2, admin.getUsername());
            myPS.setString(3, admin.getEmail());
            myPS.setString(4, admin.getPhoneNo());
            myPS.setString(5, admin.getPassword());
            myPS.setString(6, admin.getRepassword());
            myPS.setString(7, admin.getAdminID());
            myPS.executeUpdate();
            
        } catch (SQLException e){
            System.out.println(e.getMessage());
            
        } finally {
            con.close();
        }
    }
    
    //update acc admin
    public static int update(Admin admin) throws SQLException {
        int result = 0;
        Connection connection = null;
        PreparedStatement stmt = null;
        try {
            connection = MySQL.getConnection();
            String mySqlQuery = "UPDATE admin "
                    + "SET fullName=?, username=?, email=?, phoneNo=?, password=?, repassword=? "
                    + "WHERE adminID=?";

            stmt = connection.prepareStatement(mySqlQuery);
            stmt.setString(1, admin.getFullName());
            stmt.setString(2, admin.getUsername());
            stmt.setString(3, admin.getEmail());
            stmt.setString(4, admin.getPhoneNo());
            stmt.setString(5, admin.getPassword());
            stmt.setString(6, admin.getAdminID());
            result = stmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Exception is ; " + e);
        } finally {
            if (connection != null && stmt != null) {
                connection.close();
                stmt.close();
            }
        }
        return result;
    }
    
    
    //retrieve all admin
    public static List<Admin> findAllAdmins() throws SQLException {
        List<Admin> l = new ArrayList<>();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connection = MySQL.getConnection();
            String sqlSelect = "SELECT * FROM admin";
            stmt = connection.prepareStatement(sqlSelect);
            rs = stmt.executeQuery(sqlSelect);

            while (rs.next()) {
                Admin admin = new Admin(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6));
                l.add(admin);
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (connection != null && stmt != null && rs != null) {
                MySQL.closeConnection(connection, stmt, rs);
            }
        }
        return l;
    }
    
    //retrieve admin by name
    public static Admin findAdminByID(String adminID) throws SQLException {
        Admin admin = null;
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connection = MySQL.getConnection();
            String sqlSelect = "SELECT * FROM admin where adminID='" + adminID + "'";
            stmt = connection.prepareStatement(sqlSelect);
            rs = stmt.executeQuery(sqlSelect);

            if (rs.next()) {
                admin = new Admin(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6));
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (connection != null && stmt != null && rs != null) {
                MySQL.closeConnection(connection, stmt, rs);
            }
        }
        return admin;
    }
    
    public static int findIDByString(String rand) {
        int status = 0;
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "SELECT patientID FROM admin where adminID='" + rand + "'";
            ResultSet rs = stmt.executeQuery(sqlSelect);

            if (rs.next()) {
                status++;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
    //to check email has been register or not
    public static boolean isAdminExists(String email) throws SQLException {
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            connection = MySQL.getConnection();
            String sqlQuery = "SELECT COUNT(*) FROM admin WHERE email=?";
            stmt = connection.prepareStatement(sqlQuery);
            stmt.setString(1, email);

            rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
        } finally {
            MySQL.closeConnection(connection, stmt, rs);
        }

        return false;
    }

}
