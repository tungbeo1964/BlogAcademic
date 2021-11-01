/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.AwardDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import util.DBConnection;

/**
 *
 * @author DELL
 */
public class AwardDAO implements Serializable{
    
    public List<AwardDTO> getAwardById(int bid)
            throws SQLException, NamingException{
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<AwardDTO> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT detail, content_id, created_on, created_by FROM Award Where content_id=?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, bid);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String detail = rs.getString("detail");
                    int contentId = rs.getInt("content_id");
                    String createOn = rs.getString("created_on");
                    String createBy = rs.getString("created_by");
                    AwardDTO dto = new AwardDTO(detail, contentId, createOn, createBy);
                    result.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
    
    public boolean createAward(String detail, int contentId, String createOn, String createBy)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO Award(detail, content_id, created_on, created_by)"
                        + " VALUES(?,?,?,?)";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, detail);
                pstm.setInt(2, contentId);
                pstm.setString(3, createOn);
                pstm.setString(4, createBy);
                int row = pstm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return false;
    }
}
