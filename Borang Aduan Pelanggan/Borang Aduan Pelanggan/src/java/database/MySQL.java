/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySQL {
    public static Connection getConnection() throws SQLException {
        Connection myConnection = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/bk-s05-01";
            String user = "root";
            String password = "admin";

            // create a connection to the database
            myConnection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        return myConnection;
    }
    
    public static void closeConnection(Connection connection, PreparedStatement statement, ResultSet resultSet) throws SQLException {
       connection.close();
       statement.close();
       resultSet.close();
    }
}
