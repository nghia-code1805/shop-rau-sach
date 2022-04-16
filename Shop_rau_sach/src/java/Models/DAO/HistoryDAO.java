/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.DAO;

import Models.Entities.History;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author KhangNVCE140224
 */
public class HistoryDAO extends DBConnection{
    DBConnection db = new DBConnection();
    private Connection conn;
    private ResultSet rs = null;
    public int noOfRecords;

    /**
     * constructor
     */
    public HistoryDAO() {
        this.conn = db.getConnect();
    }
    
    /**
     *
     * @param h object History
     * @return
     * @throws SQLException
     */
    public boolean addUserHistory(History h) throws SQLException {
        PreparedStatement pst = conn.prepareStatement("INSERT INTO `history`(`uId`, `pId`, `hDate`, `hQuantity`, `uName`, `uTotal`, `hPaymentStatus`, `hGrossProduct`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        pst.setInt(1, h.getuId());
        pst.setInt(2, h.getpId());
        pst.setString(3, h.gethDate());
        pst.setInt(4, h.gethQuantity());
        pst.setString(5, h.getuName());
        pst.setDouble(6, h.getuTotal());
        pst.setInt(7, h.gethPaymentStatus());
        pst.setInt(8, h.gethGrossProduct());
        
        int executeUpdate = pst.executeUpdate();
           closeConnection();
        if(executeUpdate > 0) {
            return true;
        }
        return false;
    }
    
    /**
     *
     * @return object History in database
     */
    public ArrayList<History> getAllHistory(int start, int limit){
        ArrayList<History> listOfHistorys = new ArrayList<>();
        try {
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM history ORDER BY hId DESC LIMIT ? , ?");
            pst.setInt(1, start);
            pst.setInt(2, limit);
            rs = pst.executeQuery();
            
            while(rs.next()){
                listOfHistorys.add(new History(rs.getInt("hId"), rs.getInt(2),
                rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getDouble(7), rs.getInt(8), rs.getInt(9)));
            }
            rs = conn.prepareStatement("SELECT count(*) FROM history").executeQuery();
            closeConnection();
            if (rs.next()) {
                this.noOfRecords = rs.getInt(1);
            }
            
        } catch (SQLException ex) {
           ex.printStackTrace();
        }
       return listOfHistorys;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public void setNoOfRecords(int noOfRecords) {
        this.noOfRecords = noOfRecords;
    }
    
    
}
