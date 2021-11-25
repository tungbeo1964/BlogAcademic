/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.SubjectDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import util.DBConnection;

public class SubjectDAO implements Serializable {

    public boolean createNewSubject(String id, String name) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Insert into Subject(subject_id, subject_name) values (?, ?)";
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

    public SubjectDTO getSubjectNameById(String id) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        SubjectDTO result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT subject_id, subject_name FROM Subject WHERE subject_id=?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, id);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("subject_name");
                    result = new SubjectDTO(id, name);
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

    public List<SubjectDTO> getAllSubject() throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<SubjectDTO> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT subject_id, subject_name FROM Subject";
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String id = rs.getString("subject_id");
                    String name = rs.getString("subject_name");
                    SubjectDTO dto = new SubjectDTO(id, name);
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

}
