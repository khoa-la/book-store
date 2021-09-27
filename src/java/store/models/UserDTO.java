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
public class UserDTO {
    private String userID;
    private String name;
    private String password;
    private String phone;
    private String email;
    private Date createDate;
    private String roleID;
    private int status;

    public UserDTO() {
    }

    public UserDTO(String userID, String name, String password, String phone, String email, Date createDate, String roleID, int status) {
        this.userID = userID;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.createDate = createDate;
        this.roleID = roleID;
        this.status = status;
    }
    
    public UserDTO(String userID, String name, String email, Date createDate, String roleID, int status) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.createDate = createDate;
        this.roleID = roleID;
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userID=" + userID + ", name=" + name + ", password=" + password + ", phone=" + phone + ", email=" + email + ", createDate=" + createDate + ", roleID=" + roleID + ", status=" + status + '}';
    }
    

}