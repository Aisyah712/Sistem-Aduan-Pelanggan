/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author USER
 */
public class Form implements java.io.Serializable{
    
    //declaration of variable
    private String customerEmail;
    private String customerName;
    private String customerID;
    private String customerPhoneNumber;
    private String buildingNo;
    private String city;
    private String state;
    private int zipcode;
    private String detailsComplaint;
    private String sourceComplaint;
    private Date dateComplaint;

    //constructor
    public Form(String customerEmail, String customerName, String customerID, String customerPhoneNumber, String buildingNo, String city, String state, int zipcode, String detailsComplaint, String sourceComplaint, Date dateComplaint) {
        this.customerEmail = customerEmail;
        this.customerName = customerName;
        this.customerID = customerID;
        this.customerPhoneNumber = customerPhoneNumber;
        this.buildingNo = buildingNo;
        this.city = city;
        this.state = state;
        this.zipcode = zipcode;
        this.detailsComplaint = detailsComplaint;
        this.sourceComplaint = sourceComplaint;
        this.dateComplaint = dateComplaint;
    }

    public Form(String customerEmail, String customerID, String customerPhoneNumber, String detailsComplaint, String sourceComplaint, Date dateComplaint) {
        this.customerEmail = customerEmail;
        this.customerID = customerID;
        this.customerPhoneNumber = customerPhoneNumber;
        this.detailsComplaint = detailsComplaint;
        this.sourceComplaint = sourceComplaint;
        this.dateComplaint = dateComplaint;
    }
    
    public Form () {
        
    }
    
    
    //define setter and getter
    public String getCustomerEmail() {
        return customerEmail;
    }
    
    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }
    
 
    public String getCustomerName() {
        return customerName;
    }
     
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    
    public String getCustomerID() {
        return customerID;
    }
    
    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }
    
    
    public void setCustomerPhoneNumber(String customerPhoneNumber) {
        this.customerPhoneNumber = customerPhoneNumber;
    }
    public String getCustomerPhoneNumber() {
        return customerPhoneNumber;
    }
    
    
    public void setBuildingNo(String buildingNo) {
        this.buildingNo = buildingNo;
    }
    public String getBuildingNo() {
        return buildingNo;
    }
    
    
    public String getCity() {
        return city;
    }
    
    public void setCity(String city) {
        this.city = city;
    }
    
    
    public String getState() {
        return state;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    
    
    public int getZipcode() {
        return zipcode;
    }
    
    public void setZipcode(int zipcode) {
        this.zipcode = zipcode;
    }
    
    public String getDetailsComplaint() {
        return detailsComplaint;
    }
    
    public void setDetailsComplaint(String detailsComplaint) {
        this.detailsComplaint = detailsComplaint;
    }
    
    public String getSourceComplaint() {
        return sourceComplaint;
    }
    
    public void setSourceComplaint(String sourceComplaint) {
        this.sourceComplaint = sourceComplaint;
    }
    
    public Date getDateComplaint() {
        return dateComplaint;
    }
    
    public void setDateComplaint(Date dateComplaint) {
        this.dateComplaint = dateComplaint;
    }
    
}
