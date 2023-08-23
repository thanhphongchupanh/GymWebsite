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
import java.util.Random;
import model.DTO.DTO;
import utils.DBHelper;

/**
 *
 * @author Admin
 */
public class DAO {

    private static final String LOGIN = "SELECT username, role from Account WHERE email=? AND password=?";
    private static final String REGISTER = "INSERT INTO Account(email, password, username) VALUES(?,?,?)";

    public DTO checkLogin(String email, String password) throws SQLException {
        DTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, email);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("username");
                    String roleID = rs.getString("role");
                    String userID = rs.getString("userID");
                    user = new DTO(userID, fullName, password, roleID, email);
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

    public boolean register(DTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REGISTER);
                ptm.setString(1, user.getUsername());
                ptm.setString(2, user.getEmail());
                ptm.setString(3, user.getPassword());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
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

    public String generateRandomUserID() {
        Random random = new Random();
        int randomNumber = random.nextInt(10000); 
        return String.format("%04d", randomNumber); 
    }

}
