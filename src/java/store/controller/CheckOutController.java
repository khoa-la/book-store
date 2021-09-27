/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import store.models.BookDTO;
import store.models.DAO;
import store.models.OrderDTO;
import store.models.OrderDetailDTO;
import store.models.UserError;
import store.shopping.Book;
import store.shopping.Cart;

/**
 *
 * @author lakho
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "cart.jsp";
    private static final String SUCCESS = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            boolean matched = true;
            long millis = System.currentTimeMillis();
            Date createDate = new Date(millis);
            int statusID = 1;
            DAO dao = new DAO();
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            String userID = request.getParameter("userID");
            String email = request.getParameter("email");
            double totalMoney = Double.parseDouble(request.getParameter("totalMoney"));
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            UserError userError = new UserError();
            boolean checkForm = true;
            matched = phone.matches("^[0-9]{10}$");
            if (cart.getCart().values().isEmpty()) {
                String message = "No books in cart";
                request.setAttribute("SHOPPING_MESSAGE", message);
                session.removeAttribute("CART");
                request.getRequestDispatcher("home.jsp").forward(request, response);
                return;
            }
            if (address.isEmpty()) {
                userError.setMessageError("Please enter your shipping address");
                checkForm = false;
            }
            if (phone.isEmpty()) {
                userError.setPhoneError("Please enter the phone number");
                checkForm = false;
            } else if (!matched) {
                userError.setPhoneError("Phone number must have 10 digits");
                checkForm = false;
            }
            for (Book dto : cart.getCart().values()) {
                int productID = Integer.parseInt(dto.getProductID());
                BookDTO bookID = dao.getBookById(productID);
                if (dto.getQuanityID() > bookID.getQuantity()) {
                    String message = "The book " + "\"" + dto.getName()+ "\"" + " is not in stock, please choose the quantity again!";
                    request.setAttribute("SHOPPING_MESSAGE", message);
                    cart.delete(dto.getProductID());
                    request.getRequestDispatcher("home.jsp").forward(request, response);
                    return;
                }
            }
            if (checkForm) {
                OrderDTO order = new OrderDTO(email, userID, address, phone, totalMoney, createDate, statusID);
                boolean checkInsertOrder = dao.insertOrder(order);
                if (checkInsertOrder) {
                    for (Book book : cart.getCart().values()) {
                        OrderDTO listOrder = dao.getNewestOrder();
                        int orderID = listOrder.getOrderID();
                        int quantity = book.getQuanityID();
                        int productID = Integer.parseInt(book.getProductID());
                        BookDTO bookList = dao.getBookById(productID);
                        double price = bookList.getPrice();
                        OrderDetailDTO orderDetail = new OrderDetailDTO(orderID, productID, quantity, price);
                        boolean checkInsertOrderDetail = dao.insertOrderDetail(orderDetail);
                        if (checkInsertOrderDetail) {
                            int newQuantity = bookList.getQuantity() - book.getQuanityID();
                            String newName = bookList.getProductName();
                            String newAuthor = bookList.getAuthor();
                            int newCategoryID = bookList.getCategoryID();
                            String newImage = bookList.getImage();
                            BookDTO newQuantityBook = new BookDTO(productID, newName, newAuthor, newCategoryID, price, newQuantity, statusID, createDate, newImage);
                            dao.updateBook(newQuantityBook);
                        }
                    }
                }
                String message = "Thank you for purchasing the book";
                request.setAttribute("SHOPPING_MESSAGE", message);
                session.removeAttribute("CART");
                url = SUCCESS;
            } else {
                request.setAttribute("USER_ERROR", userError);
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CheckOutController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
