/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thiennl.registration;

import com.thiennl.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author thich
 */
public class RegistrationDAO implements Serializable {

    public boolean checkLogin(String username, String password)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //Create connection
            con = DBHelper.createConnection();
            if (con != null) {
                //create sql string
                String sql = "Select username "
                        + "From Registration "
                        + "Where username = ? and password = ? ";
                //create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //execute querry
                rs = stm.executeQuery();
                //process}
                if (rs.next()) {
                    result = true;
                }// end username and pass are existed
            }//end connection is available
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    private List<RegistrationDTO> accounts;

    // nhap getA + ctrl + space
    public List<RegistrationDTO> getAccounts() {
        return accounts;
    }

    public void searchLastname(String searchValue) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            //1. Create connection
            con = DBHelper.createConnection();
            if (con != null) {
                //2. create sql string
                String sql = "Select username, password, lastname, isAdmin"
                        + " From Registration"
                        + " Where lastname like ? ";
                //3. create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                //4. execute querry
                rs = stm.executeQuery();
                //5. process}
                while (rs.next()) {
                    //5.1 map data
                    //5.1.1 get data from rs
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String fullname = rs.getString("lastname");
                    boolean role = rs.getBoolean("isAdmin");
                    //5.1.2 set data into properties of DTO
                    RegistrationDTO dto = new RegistrationDTO(username, password, fullname, role);
                    //5.1.3 add DTO into list
                    if (this.accounts == null) {
                        this.accounts = new ArrayList<>();
                    } //end account had not existed
                    this.accounts.add(dto);
                    //5.2 done
                }//end traverse rs
            }//end connection is available
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public boolean deleteAccount(String username) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //create connection
            con = DBHelper.createConnection();
            if (con != null) {
                //create sql string
                String sql = "DELETE FROM Registration "
                        + "WHERE username = ?";
                //create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                //execute query
                int effectRows = stm.executeUpdate();
                //process
                if (effectRows > 0) {
                    result = true;
                }
            }//end connection is available
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public boolean updateAccount(String username, String password,String fullname , boolean isAdmin) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            //create connection
            con = DBHelper.createConnection();
            if (con != null) {
                //create sql string
                String sql = "UPDATE Registration SET password = ?, isAdmin = ?, lastname = ? WHERE username = ?";
                //create statement obj
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setBoolean(2, isAdmin);
                stm.setString(3, fullname);
                stm.setString(4, username);
                //execute query
                int effectRows = stm.executeUpdate();
                //process
                if (effectRows > 0) {
                    result = true;
                }
            }//end connection is available
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

}
