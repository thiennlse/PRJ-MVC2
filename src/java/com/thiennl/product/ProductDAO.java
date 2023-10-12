/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.thiennl.product;

import com.thiennl.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author PC
 */
public class ProductDAO implements Serializable {

    public void getAllProduct()
            throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try {

            con = DBHelper.createConnection();
            String sql = "Select id ,  name , description, quantity, unitprice , status "
                    + "From tbl_Product";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();

            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                int quantity = rs.getInt("quantity");
                float unitprice = rs.getFloat("unitprice");
                boolean status = rs.getBoolean("status");

                ProductDTO dto = new ProductDTO(id, name, description, quantity, unitprice, status);

                if (this.product == null) {
                    this.product = new ArrayList<>();
                }
                this.product.add(dto);
            }
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

    private List<ProductDTO> product;

    public List<ProductDTO> getProduct() {
        return product;
    }
}
