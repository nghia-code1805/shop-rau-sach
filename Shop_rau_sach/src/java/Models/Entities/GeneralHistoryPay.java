/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.Entities;

/**
 *
 * @author NhaBaoViec
 */
public class GeneralHistoryPay {
    private int gId;
    private int uId;
    private String uName;
    private double gTotal;
    private int gPaymentStatus;
    private int gGrossProduct;

    public GeneralHistoryPay() {
    }

    public GeneralHistoryPay(int gId, int uId, String uName, double gTotal, int gPaymentStatus, int gGrossProduct) {
        this.gId = gId;
        this.uId = uId;
        this.uName = uName;
        this.gTotal = gTotal;
        this.gPaymentStatus = gPaymentStatus;
        this.gGrossProduct = gGrossProduct;
    }

    public int getgId() {
        return gId;
    }

    public void setgId(int gId) {
        this.gId = gId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public double getgTotal() {
        return gTotal;
    }

    public void setgTotal(double gTotal) {
        this.gTotal = gTotal;
    }

    public int getgPaymentStatus() {
        return gPaymentStatus;
    }

    public void setgPaymentStatus(int gPaymentStatus) {
        this.gPaymentStatus = gPaymentStatus;
    }

    public int getgGrossProduct() {
        return gGrossProduct;
    }

    public void setgGrossProduct(int gGrossProduct) {
        this.gGrossProduct = gGrossProduct;
    }
    
    
    
    
}
