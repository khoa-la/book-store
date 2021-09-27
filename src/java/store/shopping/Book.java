/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.shopping;

/**
 *
 * @author lakho
 */
public class Book {
    private String productID;
    private String name;
    private double price;
    private int quanityID;
    private String image;

    public Book() {
        this.productID = "";
        this.name = "";
        this.price = 0;
        this.quanityID = 0;
        this.image = "";
    }

    public Book(String productID, String name, double price, int quanityID, String image) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.quanityID = quanityID;
        this.image = image;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuanityID() {
        return quanityID;
    }

    public void setQuanityID(int quanityID) {
        this.quanityID = quanityID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
