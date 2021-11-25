/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.TagDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import util.DBConnection;

public class TagDAO implements Serializable {

    public boolean createNewTag(String id, String name) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Insert into Tag(tag_id, tag_name) values (?, ?)";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, id);
                pstm.setString(2, name);
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

    public List<TagDTO> getTagNameById(int id) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<TagDTO> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Select Tag.tag_id, tag_name From Tag "
                        + "INNER JOIN TagEntry On TagEntry.tag_id = Tag.tag_id "
                        + "INNER JOIN Blog On Blog.id = TagEntry.content_id "
                        + "Where id=?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, id);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String name = rs.getString("tag_name");
                    TagDTO dto = new TagDTO(name);
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

    public List<TagDTO> getAllTag() throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<TagDTO> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT tag_id, tag_name FROM Tag";
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String id = rs.getString("tag_id");
                    String name = rs.getString("tag_name");
                    TagDTO dto = new TagDTO(id, name);
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

    public List<String> getTagIdByBlogId(int id) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<String> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Select Tag.tag_id, tag_name From Tag "
                        + "inner join TagEntry On TagEntry.tag_id = Tag.tag_id "
                        + "inner join Blog On Blog.id = TagEntry.content_id "
                        + "where id=?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, id);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String tagId = rs.getString("tag_id");
                    result.add(tagId);
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

}
