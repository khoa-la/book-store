/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.models;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import store.utils.DBUtils;

/**
 *
 * @author lakho
 */
public class DAO {

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT name, phone, email, createDate, roleID, statusID"
                        + " FROM tblUsers "
                        + " WHERE userID=? AND password= ? AND statusID='1'";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    Date createDate = rs.getDate("createDate");
                    String roleID = rs.getString("roleID");
                    user = new UserDTO(userID, name, password, phone, email, createDate, roleID, 1);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
    
    
    public boolean insertBook(BookDTO book) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblProducts(productName, author, categoryID, price, quantity, statusID, createDate, image)"
                        + " VALUES(?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, book.getProductName());
                stm.setString(2, book.getAuthor());
                stm.setInt(3, book.getCategoryID());
                stm.setDouble(4, book.getPrice());
                stm.setInt(5, book.getQuantity());
                stm.setInt(6, book.getStatusID());
                stm.setDate(7, book.getCreateDate());
                stm.setString(8, book.getImage());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT userID"
                        + " FROM tblUsers"
                        + " WHERE userID=? AND statusID='1'";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insert(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblUsers(userID, name, password, phone, email, createDate, roleID, statusID) "
                        + " VALUES(?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getName());
                stm.setString(3, user.getPassword());
                stm.setString(4, user.getPhone());
                stm.setString(5, user.getEmail());
                stm.setDate(6, user.getCreateDate());
                stm.setString(7, user.getRoleID());
                stm.setInt(8, user.getStatus());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
        

    public List<CategoryDTO> getListCategory() throws SQLException {
        List<CategoryDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT categoryID, categoryName "
                        + " FROM tblCategory ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int categoryID = Integer.parseInt(rs.getString("categoryID"));
                    String categoryName = rs.getString("categoryName");
                    list.add(new CategoryDTO(categoryID, categoryName));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<BookDTO> getListAllBooks() throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT productID, productName, author, categoryID, price, quantity, statusID, createDate, image "
                        + " FROM tblProducts ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int productID = Integer.parseInt(rs.getString("productID"));
                    String productName = rs.getString("productName");
                    String author = rs.getString("author");
                    int categoryID = Integer.parseInt(rs.getString("categoryID"));
                    double price = Double.parseDouble(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int statusID = Integer.parseInt(rs.getString("statusID"));
                    Date createDate = rs.getDate("createDate");
                    String image = rs.getString("image");
                    list.add(new BookDTO(productID, productName, author, categoryID, price, quantity, statusID, createDate, image));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public List<BookDTO> getListAllBooksActive() throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT productID, productName, author, categoryID, price, quantity, statusID, createDate, image "
                        + " FROM tblProducts "
                        + " WHERE quantity > 0 AND statusID = 1";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int productID = Integer.parseInt(rs.getString("productID"));
                    String productName = rs.getString("productName");
                    String author = rs.getString("author");
                    int categoryID = Integer.parseInt(rs.getString("categoryID"));
                    double price = Double.parseDouble(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int statusID = Integer.parseInt(rs.getString("statusID"));
                    Date createDate = rs.getDate("createDate");
                    String image = rs.getString("image");
                    list.add(new BookDTO(productID, productName, author, categoryID, price, quantity, statusID, createDate, image));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public List<BookDTO> getRandomTop10BooksActive() throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT TOP 10 productID, productName, author, categoryID, price, quantity, statusID, createDate, image "
                        + " FROM tblProducts "
                        + " WHERE statusID = 1 AND quantity >0 ORDER BY NEWID()";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int productID = Integer.parseInt(rs.getString("productID"));
                    String productName = rs.getString("productName");
                    String author = rs.getString("author");
                    int categoryID = Integer.parseInt(rs.getString("categoryID"));
                    double price = Double.parseDouble(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int statusID = Integer.parseInt(rs.getString("statusID"));
                    Date createDate = rs.getDate("createDate");
                    String image = rs.getString("image");
                    list.add(new BookDTO(productID, productName, author, categoryID, price, quantity, statusID, createDate, image));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<BookDTO> getListSearchBooks(String search) throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT productID, productName, author, categoryID, price, quantity, statusID, createDate, image "
                        + " FROM tblProducts "
                        + " WHERE productName like ? AND quantity > 0";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    int productID = Integer.parseInt(rs.getString("productID"));
                    String productName = rs.getString("productName");
                    String author = rs.getString("author");
                    int categoryID = Integer.parseInt(rs.getString("categoryID"));
                    double price = Double.parseDouble(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int statusID = Integer.parseInt(rs.getString("statusID"));
                    Date createDate = rs.getDate("createDate");
                    String image = rs.getString("image");
                    list.add(new BookDTO(productID, productName, author, categoryID, price, quantity, statusID, createDate, image));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<BookDTO> getListBooksByCategory(int categoryID) throws SQLException {
        List<BookDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT productID, productName, author, categoryID, price, quantity, statusID, createDate, image "
                        + " FROM tblProducts "
                        + " WHERE categoryID=? AND quantity > 0";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int productID = Integer.parseInt(rs.getString("productID"));
                    String productName = rs.getString("productName");
                    String author = rs.getString("author");
                    double price = Double.parseDouble(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int statusID = Integer.parseInt(rs.getString("statusID"));
                    Date createDate = rs.getDate("createDate");
                    String image = rs.getString("image");
                    list.add(new BookDTO(productID, productName, author, categoryID, price, quantity, statusID, createDate, image));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public BookDTO getBookById(int productID) throws Exception {
        BookDTO book = new BookDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT productID, productName, author, categoryID, price, quantity, statusID, createDate, image"
                        + " FROM tblProducts "
                        + " WHERE productID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, productID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productName = rs.getString("productName");
                    String author = rs.getString("author");
                    int categoryID = Integer.parseInt(rs.getString("categoryID"));
                    double price = Double.parseDouble(rs.getString("price"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int statusID = Integer.parseInt(rs.getString("statusID"));
                    Date createDate = rs.getDate("createDate");
                    String image = rs.getString("image");
                    book = new BookDTO(productID, productName, author, categoryID, price, quantity, statusID, createDate, image);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return book;
    }

    public boolean insertOrderDetail(OrderDetailDTO order) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblOrderDetail "
                        + " VALUES(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, order.getOrderID());
                stm.setInt(2, order.getProductID());
                stm.setInt(3, order.getQuantity());
                stm.setDouble(4, order.getPrice());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean deleteOrderDetail(int orderDetailID) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblOrderDetails "
                        + " WHERE orderDetailID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, orderDetailID);
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<OrderDetailDTO> getListOrderDetail(int productID) throws SQLException {
        List<OrderDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT orderDetailID, orderID, productID, quantity, price"
                        + " FROM tblOrderDetails "
                        + " WHERE productID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, productID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int orderdDetailID = Integer.parseInt(rs.getString("orderDetailID"));
                    int orderID = Integer.parseInt(rs.getString("orderID"));
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    double price = Double.parseDouble(rs.getString("price"));
                    list.add(new OrderDetailDTO(orderdDetailID, orderID, productID, quantity, price));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;

    }

    public OrderDetailDTO getOrderDetail(int orderDetailID) throws SQLException {
        OrderDetailDTO orderDetail = new OrderDetailDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT orderDetailID, orderID, productID, quantity, price"
                        + " FROM tblOrderDetails "
                        + " WHERE orderDetailID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, orderDetailID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    orderDetail.setOrderID(rs.getInt("orderID"));
                    orderDetail.setProductID(rs.getInt("productID"));
                    orderDetail.setQuantity(rs.getInt("quantity"));
                    orderDetail.setPrice(rs.getDouble("price"));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orderDetail;
    }

    public boolean insertOrder(OrderDTO order) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " INSERT INTO tblOrders"
                        + " VALUES(?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, order.getEmail());
                stm.setString(2, order.getUserID());
                stm.setString(3, order.getAddress());
                stm.setString(4, order.getPhone());
                stm.setDouble(5, order.getTotalMoney());
                stm.setDate(6, order.getOrderDate());
                stm.setInt(7, order.getStatusID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean deleteOrder(int orderID) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblOrders "
                        + " WHERE orderID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, orderID);
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateUser(UserDTO user) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblUsers set "
                        + "name=?,"
                        + "password=?,"
                        + "phone=?,"
                        + "email=?,"
                        + "createDate=?,"
                        + "roleID=?,"
                        + "statusID=?"
                        + " WHERE userID=?";
                stm = conn.prepareStatement(sql);                
                stm.setString(1, user.getName());
                stm.setString(2, user.getPassword());
                stm.setString(3, user.getPhone());
                stm.setString(4, user.getEmail());
                stm.setDate(5, user.getCreateDate());
                stm.setString(6, user.getRoleID());
                stm.setInt(7, user.getStatus());
                stm.setString(8, user.getUserID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<UserDTO> getListUser() throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT userID, name, password, phone, email, createDate, roleID, statusID "
                        + " FROM tblUsers ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String name = rs.getString("name");
                    String password = rs.getString("password");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    Date createDate = rs.getDate("createDate");
                    String roleID = rs.getString("roleID");
                    int statusID = Integer.parseInt(rs.getString("statusID"));
                    list.add(new UserDTO(userID, name, password, phone, email, createDate, roleID, statusID));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean updateCategory(CategoryDTO category) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql= " UPDATE tblCategory "
                        + " SET categoryName=?"
                        + " WHERE categoryID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, category.getName());
                stm.setInt(2, category.getCategoryID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertCategory(String categoryName) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql= " INSERT INTO tblCategory"
                        + " VALUES(?)";
                stm= conn.prepareStatement(sql);
                stm.setString(1, categoryName);
                check= stm.executeUpdate()>0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean deleteCategory(int categoryID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql= " DELETE FROM tblCategory "
                        + " WHERE categoryID=? ";
                stm= conn.prepareStatement(sql);
                stm.setInt(1, categoryID);
                check= stm.executeUpdate()>0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean updateBook(BookDTO book) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProducts SET "
                        + " productName=?,"
                        + " author=?,"
                        + " categoryID=?,"
                        + " price=?,"
                        + " quantity=?,"
                        + " statusID=?,"
                        + " createDate=?,"
                        + " image=?"                       
                        + " WHERE productID=?";
                stm = conn.prepareStatement(sql);                
                stm.setString(1, book.getProductName());
                stm.setString(2, book.getAuthor());
                stm.setInt(3, book.getCategoryID());
                stm.setDouble(4, book.getPrice());
                stm.setInt(5, book.getQuantity());
                stm.setInt(6, book.getStatusID());
                stm.setDate(7, book.getCreateDate());
                stm.setString(8, book.getImage());
                stm.setInt(9, book.getProductID());
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    
    public boolean hideBook(int productID) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblProducts SET statusID='0'"
                        + " WHERE productID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, productID);
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean hideUser(String userID) throws Exception {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblUsers SET statusID='0'"
                        + " WHERE userID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public OrderDTO getNewestOrder() throws SQLException{
        OrderDTO list = new OrderDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " SELECT TOP(1) orderID, email, userID, address, phone, totalMoney, orderDate, statusID "
                        + " FROM tblOrders "
                        + " ORDER BY orderID desc";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int orderID = Integer.parseInt(rs.getString("orderID"));
                    String email= rs.getString("email");
                    String userID= rs.getString("userID");
                    String address= rs.getString("address");
                    String phone= rs.getString("phone");
                    double totalMoney= Double.parseDouble(rs.getString("totalMoney"));
                    Date orderDate= rs.getDate("orderDate");
                    int statusID= Integer.parseInt(rs.getString("statusID"));
                    list = new OrderDTO(orderID, email, userID, address, phone, totalMoney, orderDate, statusID);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public CategoryDTO getCategoryByName(String categoryName) throws SQLException{
        CategoryDTO category= new CategoryDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql= " SELECT categoryID, categoryName"
                        + " FROM tblCategory"
                        + " WHERE categoryName=?";
                stm= conn.prepareStatement(sql);
                stm.setString(1, categoryName);
                rs= stm.executeQuery();
                while(rs.next()){
                    int categoryID= Integer.parseInt(rs.getString("categoryID"));
                    category= new CategoryDTO(categoryID, categoryName);
                }
            }
        } catch (Exception e) {
        }finally{
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return category;
        
    }

    public static void main(String[] args) throws SQLException {
        DAO dao = new DAO();
        UserDTO user = dao.checkLogin("admin", "1");
        System.out.println(user);

    }
}
