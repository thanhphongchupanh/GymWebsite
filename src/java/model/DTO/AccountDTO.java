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
public class AccountDTO {

    private int userID;
    private String username;
    private String password;
    private String role;
    private String email;

    public AccountDTO() {
    }

    public AccountDTO(int userID, String username, String password, String role, String email) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.role = role;
        this.email = email;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    

    
}
