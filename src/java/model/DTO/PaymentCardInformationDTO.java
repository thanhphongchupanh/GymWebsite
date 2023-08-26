/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DTO;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class PaymentCardInformationDTO {
    private int userID;
    private String nameCardHolder;
    private int cardID;
    private String cardType;
    private Date expiredDate;

    public PaymentCardInformationDTO() {
    }

    public PaymentCardInformationDTO(int userID, String nameCardHolder, int cardID, String cardType, Date expiredDate) {
        this.userID = userID;
        this.nameCardHolder = nameCardHolder;
        this.cardID = cardID;
        this.cardType = cardType;
        this.expiredDate = expiredDate;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getNameCardHolder() {
        return nameCardHolder;
    }

    public void setNameCardHolder(String nameCardHolder) {
        this.nameCardHolder = nameCardHolder;
    }

    public int getCardID() {
        return cardID;
    }

    public void setCardID(int cardID) {
        this.cardID = cardID;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public Date getExpiredDate() {
        return expiredDate;
    }

    public void setExpiredDate(Date expiredDate) {
        this.expiredDate = expiredDate;
    }
    
    
}
