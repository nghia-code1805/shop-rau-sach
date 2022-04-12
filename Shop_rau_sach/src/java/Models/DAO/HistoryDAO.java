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
        PreparedStatement pst = conn.prepareStatement("INSERT INTO `history`(`uId`, `pId`, `hDate`, `hQuantity`, `uName`) VALUES (?, ?, ?, ?, ?)");
        pst.setInt(1, h.getuId());
        pst.setInt(2, h.getpId());
        pst.setString(3, h.gethDate());
        pst.setInt(4, h.gethQuantity());
        pst.setString(5, h.getuName());
        
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
    public ArrayList<History> getAllHistory(){
        ArrayList<History> listOfHistorys = new ArrayList<>();
        History history = new History();
        try {
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM history");
            rs = pst.executeQuery();
            
            while(rs.next()){
                listOfHistorys.add(new History(rs.getInt("hId"), rs.getInt(2),
                rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
                
//                History history = new History();
//                history.sethId(rs.getInt(1));
//                history.setuId(rs.getInt(2));
//                history.setpId(rs.getInt(3));
//                history.sethDate(rs.getString(4));
//                history.sethQuantity(rs.getInt(5));
//                history.setuName(rs.getString(6));
//                listOfHistorys.add(history);
            }
            closeConnection();
            return listOfHistorys;
        } catch (SQLException ex) {
           ex.printStackTrace();
        }
        return null;
    } 
}
