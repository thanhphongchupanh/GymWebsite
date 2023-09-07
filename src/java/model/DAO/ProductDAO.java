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
import model.DTO.ProductDTO;
import utils.DBHelper;

/**
 *
 * @author ADMIN
 */
public class ProductDAO {

    private List<ProductDTO> preworkoutDetailList;

    public List<ProductDTO> getPreworkoutDetailList() {
        return preworkoutDetailList;
    }

    private List<ProductDTO> massDetailList;

    public List<ProductDTO> getMassDetailList() {
        return massDetailList;
    }

    private List<ProductDTO> wheyDetailList;

    public List<ProductDTO> getWheyDetailList() {
        return wheyDetailList;
    }

    public void showDetailedProduct(String productType) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDTO dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT productID, productName, price, image FROM Product WHERE productType = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productType);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productName = rs.getString("productName");
                    int productID = rs.getInt("productID");
                    String image = rs.getString("image");
                    int price = rs.getInt("price");
                    dto = new ProductDTO(productName, 0, 0, 0, 0, image, 0,
                            price, productType, "", productID);
                    if (productType.equals("Mass")) {
                        if (this.massDetailList == null) {
                            this.massDetailList = new ArrayList<>();
                        }
                        this.massDetailList.add(dto);
                    }
                    if (productType.equals("Whey")) {
                        if (this.wheyDetailList == null) {
                            this.wheyDetailList = new ArrayList<>();
                        }
                        this.wheyDetailList.add(dto);
                    }
                    if (productType.equals("Pre Workout")) {
                        if (this.preworkoutDetailList == null) {
                            this.preworkoutDetailList = new ArrayList<>();
                        }
                        this.preworkoutDetailList.add(dto);
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

    //Detail information of a product
    private List<ProductDTO> detailProduct;

    public List<ProductDTO> getDetailProduct() {
        return detailProduct;
    }

    public void showProductInDetail(String productType, int id) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDTO dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT p.productName, p.price, p.description FROM Product p "
                        + "WHERE productType = ? AND productID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, productType);
                stm.setInt(2, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String des = rs.getString("description");
                    String name = rs.getString("productName");
                    float price = rs.getFloat("price");
                    dto = new ProductDTO(name, 0, 0, 0, 0, "", 0,
                            price, "", des, 0);

                    if (this.detailProduct == null) {
                        this.detailProduct = new ArrayList<>();
                    }
                    this.detailProduct.add(dto);
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
