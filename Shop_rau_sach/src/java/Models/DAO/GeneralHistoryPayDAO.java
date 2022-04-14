/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.DAO;

import Models.Entities.GeneralHistoryPay;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author NhaBaoViec
 */
public class GeneralHistoryPayDAO extends DBConnection{
    
    DBConnection db = new DBConnection();
    private Connection conn;
    private ResultSet rs = null;

    public GeneralHistoryPayDAO() {
        this.conn = db.getConnect();
    }
    
    public boolean addGeneralHistory(GeneralHistoryPay ghp) throws SQLException{
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO `generalhistorypay`(`uId`, `uName`, `gTotal`, `gPaymentStatus`, `gGrossProduct`) VALUES (?, ?, ?, ?, ?)");
            
            preparedStatement.setInt(1, ghp.getuId());
            preparedStatement.setString(2, ghp.getuName());
            preparedStatement.setDouble(3, ghp.getgTotal());
            preparedStatement.setInt(4, ghp.getgPaymentStatus());
            preparedStatement.setInt(5, ghp.getgGrossProduct());
            
            int executeUpdate = preparedStatement.executeUpdate();
            closeConnection();
            if (executeUpdate > 0) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            e.getMessage();
        }
        return false;
    }
    
    public ArrayList<GeneralHistoryPay> getAll(){
        ArrayList<GeneralHistoryPay> ls = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM generalhistorypay");
            rs = preparedStatement.executeQuery();
            
            while(rs.next()){
                ls.add(new GeneralHistoryPay(rs.getInt("gId"), rs.getInt(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6)));
            }
            closeConnection();
            return ls;
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }
    
    public GeneralHistoryPay getIdGeneralHistoryPay(int id){
        GeneralHistoryPay generalHistoryPay = new GeneralHistoryPay();
        try {
            PreparedStatement ps = conn.prepareStatement("select ps.gPaymentStatus from generalhistorypay ps where ps.gId=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                generalHistoryPay.setgPaymentStatus(rs.getInt("gPaymentStatus"));
                closeConnection();
                return generalHistoryPay;
            }
        } catch (Exception e) {
        }
        return null;
    }

    
    
}
