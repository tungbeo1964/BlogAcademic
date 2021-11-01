/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.CommentDTO;
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
public class CommentDAO implements Serializable{
    
    public List<CommentDTO> getAllCommentById(int id) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<CommentDTO> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Select detail, vote, created_on, created_by From Comment Where content_id=?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, id);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String detail = rs.getString("detail");
                    int voted = rs.getInt("vote");
                    String createOn = rs.getString("created_on");
                    String CreateBy = rs.getString("created_by");
                    CommentDTO dto = new CommentDTO(detail, voted, createOn, CreateBy);
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
    
    public boolean postComment(String detail, int vote, int contentId, String datePost, String postBy)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO Comment(detail, vote, content_id, created_on, created_by)"
                        + " VALUES(?,?,?,?,?)";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, detail);
                pstm.setInt(2, vote);
                pstm.setInt(3, contentId);
                pstm.setString(4, datePost);
                pstm.setString(5, postBy);
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
