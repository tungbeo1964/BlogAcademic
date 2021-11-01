/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.MentorDTO;
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
public class MentorDAO implements Serializable {

    public boolean checkLoginMentor(String username, String password)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1.Open connection
            con = DBConnection.makeConnection();
            if (con != null) {
                //2. Create SQL String 
                String sql = "Select id, username From "
                        + "Account Where username=? AND password=? AND role=2 AND del_flag='False'";
                //3. Create statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4.Execute
                rs = stm.executeQuery();
                //5.process
                if (rs.next()) {
                    return true;
                }//end if rs
            }//end if con is not null
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean createNewMentor(String username, String password, String studentFullName, int role, boolean flag)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO Account(username, password, full_name, role, del_flag)"
                        + " VALUES(?,?,?,?,?)";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, username);
                pstm.setString(2, password);
                pstm.setString(3, studentFullName);
                pstm.setInt(4, role);
                pstm.setBoolean(5, flag);
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

    public boolean insertInfo(int id, String email, String phone, String date, String createBy)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO Mentor(id, mentor_email, mentor_phone, created_on, created_by)"
                        + " VALUES(?,?,?,?,?)";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, id);
                pstm.setString(2, email);
                pstm.setString(3, phone);
                pstm.setString(4, date);
                pstm.setString(5, createBy);
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

    public MentorDTO viewMentorProfile(int mentorId)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1.Open connection
            con = DBConnection.makeConnection();
            if (con != null) {
                //2. Create SQL String 
                String sql = "Select mentor_email, mentor_phone, created_by From "
                        + "Mentor Where id=?";
                //3. Create statement
                stm = con.prepareStatement(sql);
                stm.setInt(1, mentorId);
                //4.Execute
                rs = stm.executeQuery();
                //5.process
                if (rs.next()) {
                    String email = rs.getString("mentor_email");
                    String phone = rs.getString("mentor_phone");
                    String createBy = rs.getString("created_by");

                    MentorDTO dto = new MentorDTO(email, phone, createBy);

                    return dto;
                }//end if rs
            }//end if con is not null
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public boolean updateMentorProfile(String id, String mentorEmail, String mentorPhone)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Update Mentor "
                        + "Set  mentor_email = ?, mentor_phone = ? Where id=?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, mentorEmail);
                pstm.setString(2, mentorPhone);
                pstm.setString(3, id);

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
