/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.models;

import java.sql.Date;

/**
 *
 * @author lakho
 */
public class OrderDTO {
    private int orderID;
    private String email;
    private String userID;
    private String address;
    private String phone;
    private double totalMoney;
    private Date orderDate;
    private int statusID;

    public OrderDTO() {
    }

    public OrderDTO(int orderID, String email, String userID, String address, String phone, double totalMoney, Date orderDate, int statusID) {
        this.orderID = orderID;
        this.email = email;
        this.userID = userID;
        this.address = address;
        this.phone = phone;
        this.totalMoney = totalMoney;
        this.orderDate = orderDate;
        this.statusID = statusID;
    }
    
    public OrderDTO(String email, String userID, String address, String phone, double totalMoney, Date orderDate, int statusID) {
        this.email = email;
        this.userID = userID;
        this.address = address;
        this.phone = phone;
        this.totalMoney = totalMoney;
        this.orderDate = orderDate;
        this.statusID = statusID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderID=" + orderID + ", email=" + email + ", userID=" + userID + ", address=" + address + ", phone=" + phone + ", totalMoney=" + totalMoney + ", orderDate=" + orderDate + ", statusID=" + statusID + '}';
    }
    
}
