/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.shopping;

import java.util.HashMap;
import java.util.Map;
import store.models.BookDTO;

/**
 *
 * @author lakho
 */
public class Cart {

    private Map<String, Book> cart;

    public Cart() {
    }

    public Cart(Map<String, Book> cart) {
        this.cart = cart;
    }

    public Map<String, Book> getCart() {
        return cart;
    }

    public void setCart(Map<String, Book> cart) {
        this.cart = cart;
    }

    public void add(Book book) {
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(book.getProductID())) {
            int currentQuantity = this.cart.get(book.getProductID()).getQuanityID();
            book.setQuanityID(currentQuantity + book.getQuanityID());
        }
        cart.put(book.getProductID(), book);
    }

    public void delete(String id) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public void update(String id, Book newbook) {
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.replace(id, newbook);
        }
    }
}
