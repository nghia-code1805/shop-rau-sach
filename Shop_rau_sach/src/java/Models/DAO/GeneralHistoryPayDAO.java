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
    public int noOfRecords;

    public int getNoOfRecords() {
        return noOfRecords;
    }

    public void setNoOfRecords(int noOfRecords) {
        this.noOfRecords = noOfRecords;
    }
    
    

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
    
    public ArrayList<GeneralHistoryPay> getAll(int start, int limit){
        ArrayList<GeneralHistoryPay> ls = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM generalhistorypay ORDER BY gId DESC LIMIT ? , ?");
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
            rs = preparedStatement.executeQuery();
            
            while(rs.next()){
                ls.add(new GeneralHistoryPay(rs.getInt("gId"), rs.getInt(2), rs.getString(3), rs.getDouble(4), rs.getInt(5), rs.getInt(6)));
            }
            rs = conn.prepareStatement("SELECT count(*) FROM generalhistorypay").executeQuery();
            closeConnection();
            if (rs.next()) {
                this.noOfRecords = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return ls;
    }
    
    public int getIdGeneralHistoryPay(int id){
        GeneralHistoryPay generalHistoryPay = new GeneralHistoryPay();
        int status = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("select ps.gPaymentStatus from generalhistorypay ps where ps.gId=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                generalHistoryPay.setgPaymentStatus(rs.getInt("gPaymentStatus"));
                status = generalHistoryPay.getgPaymentStatus();
                closeConnection();
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return status;
    }

    public GeneralHistoryPay getIdGeneralHistory(int id){
        GeneralHistoryPay generalHistoryPay = new GeneralHistoryPay();
        try {
            PreparedStatement ps = conn.prepareStatement("select * from generalhistorypay where gId=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                generalHistoryPay.setgId(rs.getInt("gId"));
                generalHistoryPay.setuId(rs.getInt("uId"));
                generalHistoryPay.setuName(rs.getString("uName"));
                generalHistoryPay.setgTotal(rs.getDouble("gTotal"));
                generalHistoryPay.setgPaymentStatus(rs.getInt("gPaymentStatus"));
                generalHistoryPay.setgGrossProduct(rs.getInt("gGrossProduct"));
                closeConnection();
                return generalHistoryPay;
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }
    
    public boolean editStatus(int gId, int status){
        int i = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE `generalhistorypay` SET `gPaymentStatus`=? WHERE `gId`=?");
            ps.setInt(1, status);
            ps.setInt(2, gId);
            
            
            i = ps.executeUpdate();
            closeConnection();
            
            if(i > 0){
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
