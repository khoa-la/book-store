/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import store.models.DAO;
import store.models.UserDTO;

/**
 *
 * @author lakho
 */
public class DBUtils {
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url="jdbc:sqlserver://localhost:1433;databaseName=BookManagement";
        Connection conn= DriverManager.getConnection(url, "sa", "123456");
        return conn;
    }
//    public static void main(String[] args) throws ClassNotFoundException, SQLException {
//          System.out.println(new DBUtils().getConnection());
//    }
}
