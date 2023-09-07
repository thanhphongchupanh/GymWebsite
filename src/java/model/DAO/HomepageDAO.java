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
import model.DTO.ProductTypeDTO;
import utils.DBHelper;

/**
 *
 * @author ADMIN
 */
public class HomepageDAO {

    private List<ProductTypeDTO> cateList;

    public List<ProductTypeDTO> getCateList() {
        return cateList;
    }

    public void showNavigation() throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductTypeDTO dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT productType FROM [ProductType]";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String type = rs.getString("productType");
                    dto = new ProductTypeDTO(type, "");
                    if (this.cateList == null) {
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

    
    // Show Top 8 products
    private List<ProductDTO> wheyList;

    public List<ProductDTO> getWheyList() {
        return wheyList;
    }

    private List<ProductDTO> massList;

    public List<ProductDTO> getMassList() {
        return massList;
    }

    private List<ProductDTO> preworkoutList;

    public List<ProductDTO> getPreworkoutList() {
        return preworkoutList;
    }

    public void showTop8Product(String productType) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDTO dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT TOP 8 productID, productName, price, image FROM Product WHERE productType = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productType);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productName = rs.getString("productName");
                    int productID = rs.getInt("productID");
                    String image = rs.getString("image");
                    float price = rs.getFloat("price");
                    dto = new ProductDTO(productName, 0, 0, 0, 0, image, 0,
                            price, productType, "", productID);
                    if (productType.equals("Mass")) {
                        if (this.massList == null) {
                            this.massList = new ArrayList<>();
                        }
                        this.massList.add(dto);
                    }
                    if (productType.equals("Whey")) {
                        if (this.wheyList == null) {
                            this.wheyList = new ArrayList<>();
                        }
                        this.wheyList.add(dto);
                    }
                    if (productType.equals("Pre Workout")) {
                        if (this.preworkoutList == null) {
                            this.preworkoutList = new ArrayList<>();
                        }
                        this.preworkoutList.add(dto);
                    }
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
