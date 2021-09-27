/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import store.models.UserDTO;
import store.shopping.Book;
import store.shopping.Cart;

/**
 *
 * @author lakho
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS ="home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (user != null) {
                String productID = request.getParameter("productID");
                String name = request.getParameter("name");
                String author = request.getParameter("author");
                double price = Double.parseDouble(request.getParameter("price"));
                int available = Integer.parseInt(request.getParameter("available"));
                String image = request.getParameter("image");
                int categoryID = Integer.parseInt(request.getParameter("categoryID"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                Book book = new Book(productID, name, price, quantity, image);
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    cart = new Cart();
                }
                cart.add(book);
                session.setAttribute("CART", cart);
                for (Book books : cart.getCart().values()) {
                    if (books.getQuanityID() > available) {
                        String message = "The book " + "\"" + name + "\"" + " is not in stock, please choose the quantity again!";
                        request.setAttribute("SHOPPING_MESSAGE", message);
                        cart.delete(productID);
                        url = SUCCESS;

                    } else {
                        String message = "You have successfully added " + quantity + " \"" + name + "\"" + " books to your cart!";
                        request.setAttribute("SHOPPING_MESSAGE", message);
                        url = SUCCESS;
                    }
                }
            }else{
                session.setAttribute("ERROR_MESSAGE", "Please login to continue shopping");              
            }           
        } catch (Exception e) {
            log("Error at AddToCartController:" + e.toString());
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
