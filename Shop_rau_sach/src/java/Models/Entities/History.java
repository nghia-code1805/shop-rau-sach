/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.Entities;

/**
 *
 * @author KhangNVCE140224
 */
public class History {
    private int hId; 
    private int uId;
    private int pId;
    private String hDate;
    private int hQuantity;
    private String uName;

    /**
     * Constructor # creates new object for history
     */
    public History() {
    }

    /**
     * Constructor # creates new object for history
     * @param hId the id of history
     * @param hDate the date now when user payment success
     * @param hQuantity quantity product after user payment
     * @param pId the id of product
     * @param uId the id of user
     */
    public History(int hId, int uId, int pId, String hDate, int hQuantity, String uName) {    
        this.hId = hId;
        this.uId = uId;
        this.pId = pId;
        this.hDate = hDate;
        this.hQuantity = hQuantity;
        this.uName = uName;
    }

    /**
     * Gets the id of history
     * @return the id of object history
     */
    public int gethId() {
        return hId;
    }

    /**
     * Sets id for history
     * @param hId the id of history
     */
    public void sethId(int hId) {
        this.hId = hId;
    }

    /**
     * Gets the date of history
     * @return the date of object history
     */
    public String gethDate() {
        return hDate;
    }

    /**
     *Sets date for history
     * @param hDate the date now when user payment success
     */
    public void sethDate(String hDate) {
        this.hDate = hDate;
    }

    /**
     * Gets the quantity of history
     * @return the quantity of object history
     */
    public int gethQuantity() {
        return hQuantity;
    }

    /**
     * Sets quantity for history
     * @param hQuantity quantity product after user payment
     */
    public void sethQuantity(int hQuantity) {
        this.hQuantity = hQuantity;
    }

    /**
     * Gets the id of product
     * @return the id of object product
     */
    public int getpId() {
        return pId;
    }

    /**
     * Sets id for product
     * @param pId the id of product
     */
    public void setpId(int pId) {
        this.pId = pId;
    }

    /**
     * Gets the id of user
     * @return the id of object user
     */
    public int getuId() {
        return uId;
    }

    /**
     * Sets id for user
     * @param uId the id of user
     */
    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }
    
    

    
    
}