/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author USER
 */
public class Admin {
    private String fullName;
    private String username;
    private String email;
    private String phoneNo;
    private String password;
    private String Repassword;
    private String adminID;

    public Admin(String fullName, String username, String email, String phoneNo, String password, String Repassword, String adminID) {
        this.fullName = fullName;
        this.username = username;
        this.email = email;
        this.phoneNo = phoneNo;
        this.password = password;
        this.Repassword = Repassword;
        this.adminID = adminID;
    }

    public Admin(String fullName, String username, String email, String phoneNo, String password, String adminID) {
        this.fullName = fullName;
        this.username = username;
        this.email = email;
        this.phoneNo = phoneNo;
        this.password = password;
        this.adminID = adminID;
    }

    public Admin() {
    }
    
    
    
    public String getFullName() {
        return fullName;
    }
    
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    
    public String getPhoneNo() {
        return phoneNo;
    }
    
    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
    
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getRepassword() {
        return Repassword;
    }
    
    public void setRepassword(String Repassword) {
        this.Repassword = Repassword;
    }
    
    public String getAdminID() {
        return adminID;
    }
    
    public void setAdminID(String adminID) {
        this.adminID = adminID;
    }
}
