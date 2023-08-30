/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.DTO.CategoryDTO;
import model.DTO.ProductDTO;
import utils.DBHelper;

/**
 *
 * @author ADMIN
 */
public class HomepageDAO {
    private List<CategoryDTO> cateList;

    public List<CategoryDTO> getCateList() {
        return cateList;
    }
    
    public void showCategory() throws SQLException{
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CategoryDTO dto = null;
        try {
            conn = DBHelper.makeConnection();
            if(conn != null){
                String sql = "SELECT categoryID, categoryName FROM Category";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    String categoryName = rs.getString("categoryName");
                    int categoryID = rs.getInt("categoryID");
                    dto = new CategoryDTO(categoryID, categoryName);
                    if(this.cateList == null){
                       this.cateList = new ArrayList<>();
                   }
                    this.cateList.add(dto);
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
    }
    
    private List<ProductDTO> productList;

    public List<ProductDTO> getProductList() {
        return productList;
    }
    public void showWheyProduct() throws SQLException{
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDTO dto = null;
        try {
            conn = DBHelper.makeConnection();
            if(conn != null){
                String sql = "SELECT TOP 8 productName, price FROM Product ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    String productName = rs.getString("productName");
                    int price = rs.getInt("price");
                    dto = new ProductDTO(productName, 0, 0, 0, 0, "", 0, 
                            price, "", "", 0);
                    if(this.productList == null){
                       this.productList = new ArrayList<>();
                   }
                    this.productList.add(dto);
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
    }
}
