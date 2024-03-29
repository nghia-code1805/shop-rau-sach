/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.DAO;

import Models.Entities.CartProduct;
import Models.Entities.GeneralHistoryPay;
import Models.Entities.History;
import Models.Entities.Product;
import Models.Entities.User;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author KhangNVCE140224
 */
public class PaysDAO extends DBConnection{
    private Connection conn;

    /**
     *conStructor
     */
    public PaysDAO() {
        try {
            DBConnection db = new DBConnection();
            this.conn = db.getConnect(); //open connection on DB
            
            //disable auto commit
            conn.setAutoCommit(false);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    /**
     *
     * @param user object User
     * @param sold all Product in cart
     * @param total
     * @param grossProduct
     * @return
     */
    public boolean startPayment(User user, ArrayList<CartProduct> sold, double total, int grossProduct) {
        try {
            //update user balance
//            new UserDAO().updateUserBalance(user);
            
            //update amount of product on stock & insert into history
            ProductsDAO productsDAO = new ProductsDAO();
            for (CartProduct itemSold : sold) {
                Product product = new Product();
                product.setpId(itemSold.getpId());
                product.setpQuantity(itemSold.getpQuantity() - itemSold.getCartQuantity());
                productsDAO.updateProductQuantity(product);
                
                //save process in history
                History history = new History();
                history.sethDate(LocalDateTime.of(LocalDate.now(), LocalTime.now()) + "");
                history.setpId(itemSold.getpId());
                history.setuId(user.getuId());
                history.setuName(user.getuName());
                history.setuTotal(total);
                history.sethPaymentStatus(0);
                history.sethGrossProduct(grossProduct);
                history.sethQuantity(itemSold.getCartQuantity());
                
                new HistoryDAO().addUserHistory(history);
            }
            
            GeneralHistoryPay generalHistoryPay = new GeneralHistoryPay();
            generalHistoryPay.setuId(user.getuId());
            generalHistoryPay.setuName(user.getuName());
            generalHistoryPay.setgTotal(total);
            generalHistoryPay.setgPaymentStatus(0);
            generalHistoryPay.setgGrossProduct(grossProduct);
            
            new GeneralHistoryPayDAO().addGeneralHistory(generalHistoryPay);
            
            //empty user cart
            new CartsDAO().deleteUserCart(user.getuId());
            
            //commit
            conn.commit();
            
            //return default value of database
               closeConnection();
            return true;
        } catch (SQLException ex) {
            try {
                conn.rollback();
                ex.getMessage();
                conn.setAutoCommit(true);
            } catch (SQLException ex1) {
            }
            return false;
        }
    }
}
