/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

/**
 *
 * @author Admin
 */
public class CartDTO {

    private int userID;
    private int quantity;
    private float total_price;
    private int product_id;

    public CartDTO() {
    }

    public CartDTO(int userID, int quantity, float total_price, int product_id) {
        this.userID = userID;
        this.quantity = quantity;
        this.total_price = total_price;
        this.product_id = product_id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getTotal_price() {
        return total_price;
    }

    public void setTotal_price(float total_price) {
        this.total_price = total_price;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    
}
