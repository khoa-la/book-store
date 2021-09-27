/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.models;

/**
 *
 * @author lakho
 */
public class UserError {
    private String userIDError;
    private String nameError;
    private String passwordError;
    private String confirmError;
    private String phoneError;
    private String emailError;
    private String roleIDError;
    private String messageError;
    
    public UserError() {
        this.userIDError="";
        this.nameError ="";
        this.passwordError ="";
        this.confirmError ="";
        this.phoneError ="";
        this.emailError ="";
        this.roleIDError ="";
        this.messageError ="";
    }

    public UserError(String userIDError, String nameError, String passwordError, String confirmError, String phoneError, String emailError, String roleIDError, String messageError) {
        this.userIDError = userIDError;
        this.nameError = nameError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.phoneError = phoneError;
        this.emailError = emailError;
        this.roleIDError = roleIDError;
        this.messageError = messageError;
    }

    

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getMessageError() {
        return messageError;
    }

    public void setMessageError(String messageError) {
        this.messageError = messageError;
    }

    @Override
    public String toString() {
        return "UserError{" + "userIDError=" + userIDError + ", nameError=" + nameError + ", passwordError=" + passwordError + ", confirmError=" + confirmError + ", phoneError=" + phoneError + ", emailError=" + emailError + ", roleIDError=" + roleIDError + ", messageError=" + messageError + '}';
    }
    
}
