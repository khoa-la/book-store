/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import store.models.BookDTO;
import store.models.DAO;

/**
 *
 * @author ACER
 */
@WebServlet(name = "AdminAddProductController", urlPatterns = {"/AdminAddProductController"})
public class AdminAddProductController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "adminBook.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            Date createDate = Date.valueOf(request.getParameter("createDate"));
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
            int productID = Integer.parseInt(request.getParameter("productID"));
            String image = request.getParameter("image");
            String productName = request.getParameter("productName");
            String author = request.getParameter("author");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int statusID = Integer.parseInt(request.getParameter("statusID"));
            BookDTO book = new BookDTO(productID, productName, author, categoryID, price, quantity, statusID, createDate, image);
            DAO dao = new DAO();
            boolean check = dao.insertBook(book);
            if (check) {
                List<BookDTO> list = dao.getListAllBooks();
                if (list != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("ADMIN_LIST_BOOK", list);
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at AdminAddProductController " + e.toString());
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