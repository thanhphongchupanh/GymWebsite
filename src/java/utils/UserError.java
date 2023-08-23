/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author Admin
 */
public class UserError {
    private String userIDError;
    private String fullNameError;
    private String roleError;
    private String passwordError;
    private String emailError;
    private String error;

    public UserError() {
        this.userIDError = "";
        this.fullNameError = "";
        this.roleError = "";
        this.passwordError = "";
        this.emailError = "";
        this.error = "";
    }

    public UserError(String userIDError, String fullNameError, String roleError, String passwordError, String emailError, String error) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.roleError = roleError;
        this.passwordError = passwordError;
        this.emailError = emailError;
        this.error = error;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getRoleError() {
        return roleError;
    }

    public void setRoleError(String roleError) {
        this.roleError = roleError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    
}
