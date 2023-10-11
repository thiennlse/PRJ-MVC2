/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thiennl.util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author thich
 */
public class DBHelper implements Serializable {

    public static Connection createConnection() throws ClassNotFoundException, NamingException, SQLException {
        Context currentContext = new InitialContext();
        Context tomcatContext = (Context) currentContext.lookup("java:comp/env");
        DataSource ds = (DataSource) tomcatContext.lookup("SE1707DS");
        Connection con = ds.getConnection();
//        //1.Load Driver
        
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        //2.Create Connection
//        String url ="jdbc:sqlserver://localhost:1433;databaseName=SE1707";
//        //Open connection
//         3.Look up
        
//        Connection con = DriverManager.getConnection(url, "sa", "123456");
//        4. Open connection
            
        return con;
//        return con;
    }

}
