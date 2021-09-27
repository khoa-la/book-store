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
public class BookDTO {
    private int productID;
    private String productName;
    private String author;
    private int categoryID;
    private double price;
    private int quantity;
    private int statusID;
    private Date createDate;
    private String image;

    public BookDTO() {
    }

    public BookDTO(int productID, String productName, String author, int categoryID, double price, int quantity, int statusID, Date createDate, String image) {
        this.productID = productID;
        this.productName = productName;
        this.author = author;
        this.categoryID = categoryID;
        this.price = price;
        this.quantity = quantity;
        this.statusID = statusID;
        this.createDate = createDate;
        this.image = image;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "BookDTO{" + "productID=" + productID + ", productName=" + productName + ", author=" + author + ", categoryID=" + categoryID + ", price=" + price + ", quantity=" + quantity + ", statusID=" + statusID + ", createDate=" + createDate + ", image=" + image + '}';
    }
    
}
