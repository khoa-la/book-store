/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import store.models.BookDTO;
import store.models.DAO;
import store.shopping.Book;
import store.shopping.Cart;

/**
 *
 * @author lakho
 */
@WebServlet(name = "UpdateCartController", urlPatterns = {"/UpdateCartController"})
public class UpdateCartController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "cart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("name");
            int product = Integer.parseInt(request.getParameter("productID"));
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));
            String image = request.getParameter("image");
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            DAO dao = new DAO();
            BookDTO bookID = dao.getBookById(product);
            Book book = null;
            if (cart != null) {
                for (Book dto : cart.getCart().values()) {
                    if (dto.getProductID().equals(productID)) {
                        if (newQuantity > bookID.getQuantity()) {
                            String message = "The book " + "\"" + productName + "\"" + " is not in stock, please choose the quantity again!";
                            request.setAttribute("SHOPPING_MESSAGE", message);
                            cart.delete(productID);
                            url = SUCCESS;
                        } else {
                            String name = dto.getName();
                            double price = dto.getPrice();
                            book = new Book(productID, name, price, newQuantity, image);
                            break;
                        }
                    }
                }
                cart.update(productID, book);
                session.setAttribute("CART", cart);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
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
        processRequest(request, response);
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
        processRequest(request, response);
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
