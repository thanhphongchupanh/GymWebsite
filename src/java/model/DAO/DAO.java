/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import model.DTO.AccountDTO;
import model.DTO.CartDTO;
import utils.DBHelper;

/**
 *
 * @author Admin
 */
public class DAO {

    public AccountDTO checkLogin(String username, String password) throws SQLException {
        AccountDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            String url = "SELECT username, password, role from Account WHERE username=? AND password=?";
            conn = DBHelper.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(url);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    username = rs.getString("username");
                    password = rs.getString("password");
                    String roleID = rs.getString("role");
                    user = new AccountDTO(0, username, password, roleID, "");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public boolean registerUser(int userID, String firstName, String lastName, String phoneNumber, String shippingAddress) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String url = "INSERT INTO [User] (userID, firstName, lastName, phoneNumber, shipping_address) VALUES(?,?,?,?,?)";
                ptm = conn.prepareStatement(url);
                ptm.setInt(1, userID);
                ptm.setString(2, firstName);
                ptm.setString(3, lastName);
                ptm.setString(4, phoneNumber);
                ptm.setString(5, shippingAddress);
                check = ptm.executeUpdate() > 0 ? true : false;
                conn.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean registerAccount(int userID, String password, String username, String email) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String url = "INSERT INTO Account(userID, password, username, role, email) VALUES(?,?,?,?,?)";
                ptm = conn.prepareStatement(url);
                ptm.setInt(1, userID);
                ptm.setString(2, password);
                ptm.setString(3, username);
                ptm.setString(4, "Guest");
                ptm.setString(5, email);
                check = ptm.executeUpdate() > 0 ? true : false;
                conn.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertUserIDIntoCart(int userID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String url = "INSERT INTO Cart(userID) VALUES(?)";
                ptm = conn.prepareStatement(url);
                ptm.setInt(1, userID);
                check = ptm.executeUpdate() > 0 ? true : false;
                conn.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertUserIDIntoPaymentCardInfo(int userID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String url = "INSERT INTO Payment_Card_information(userID) VALUES (?)";
                ptm = conn.prepareStatement(url);
                ptm.setInt(1, userID);
                check = ptm.executeUpdate() > 0 ? true : false;
                conn.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insertUserIDIntoAccount(int userID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String url = "INSERT INTO Account(userID) VALUES(?)";
                ptm = conn.prepareStatement(url);
                ptm.setInt(1, userID);
                check = ptm.executeUpdate() > 0 ? true : false;
                conn.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int generateRandomUserID() {
        Random random = new Random();
        int randomNumber = random.nextInt(10000);
        return randomNumber;
    }

    public int generateOTP() {
        Random random = new Random();
        int randomOTP = random.nextInt(900000);
        return randomOTP;
    }

    public boolean isEmailExist(String email) throws ClassNotFoundException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            String query = "SELECT email FROM Account WHERE email = ?";
            ptm = conn.prepareStatement(query);
            ptm.setString(1, email);
            rs = ptm.executeQuery();
            while(rs.next()){
                email = rs.getString("email");
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ptm != null) {
                try {
                    ptm.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

}
