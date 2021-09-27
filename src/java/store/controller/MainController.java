/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lakho
 */
public class MainController extends HttpServlet {

    private static final String ERROR="error.jsp";
    private static final String LOGIN="LoginController";
    private static final String REGISTER="RegisterController";
    private static final String LOGOUT="LogoutController";
    private static final String SEARCH="SearchController";
    private static final String ADD_TO_CART="AddToCartController";
    private static final String UPDATE_CART="UpdateCartController";
    private static final String REMOVE_CART="RemoveCartController";
    private static final String CHECK_OUT="CheckOutController";
    private static final String ADMIN_CATEGORY="AdminCategoryController";
    private static final String ADMIN_EDIT_CATEGORY="AdminEditCategoryController";
    private static final String ADMIN_DELETE_CATEGORY="AdminDeleteCategoryController";
    private static final String ADMIN_ADD_CATEGORY="adminAddCategory.jsp";
    private static final String ADMIN_BOOK="AdminBookController";
    private static final String ADMIN_EDIT_BOOK="AdminEditBookController";
    private static final String ADMIN_HIDE_BOOK="AdminHideBookController";
    private static final String ADMIN_USER="AdminUserController";
    private static final String ADMIN_UPDATE_USER="AdminUpdateUserController";
    private static final String ADMIN_HIDE_USER="AdminHideUserController";
    private static final String ADMIN_ADD_PRODUCT="adminAddProduct.jsp";
    private static final String ADMIN_ADD_CONFIRM="AdminAddProductController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url= ERROR;
        try {
            String action= request.getParameter("action");
            if("Login".equals(action)){
                url=LOGIN;
            }else if("Register".equals(action)){
                url= REGISTER;
            }else if("Logout".equals(action)){
                url= LOGOUT;
            }
            else if("Search".equals(action)){
                url= SEARCH;
            }
            else if("Add to Cart".equals(action)){
                url= ADD_TO_CART;
            }
            else if("Modify".equals(action)){
                url= UPDATE_CART;
            }
            else if("Remove".equals(action)){
                url= REMOVE_CART;
            }
            else if("Checkout".equals(action)){
                url= CHECK_OUT;
            }
            else if("listCate".equals(action)){
                url= ADMIN_CATEGORY;
            }
            else if("Edit".equals(action)){
                url= ADMIN_EDIT_CATEGORY;
            }
            else if("Delete".equals(action)){
                url= ADMIN_DELETE_CATEGORY;
            }
            else if("addCate".equals(action)){
                url= ADMIN_ADD_CATEGORY;
            }
            else if("listBook".equals(action)){
                url= ADMIN_BOOK;
            }
            else if("Update".equals(action)){
                url= ADMIN_EDIT_BOOK;
            }
            else if("Hide".equals(action)){
                url= ADMIN_HIDE_BOOK;
            }
            else if("listUser".equals(action)){
                url= ADMIN_USER;
            }
            else if("Update User".equals(action)){
                url= ADMIN_UPDATE_USER;
            }
            else if("Hide User".equals(action)){
                url= ADMIN_HIDE_USER;
            }
            else if("addProduct".equals(action)){
                url= ADMIN_ADD_PRODUCT;
            }
            else if("Confirm Add".equals(action)){
                url= ADMIN_ADD_CONFIRM;
            }
            else{
                HttpSession session= request.getSession();
                session.setAttribute("ERROR_MESSAGE", "Function is not avaiale");
            }
        } catch (Exception e) {
            log("Error at MainController:" + e.toString());
        }finally{
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
