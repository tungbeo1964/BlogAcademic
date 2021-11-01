/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.StudentDTO;
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
public class StudentDAO implements Serializable {
    public boolean checkLoginStudent(String username, String password)
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
                        + "Account Where username=? AND password=? AND role=3 AND del_flag='False'";
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

    public boolean createNewAccount(String username, String password, String studentFullName, int role, boolean flag)
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

    public boolean insertInfo(int id, String email, String phone, String date)
            throws SQLException, NamingException{
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO Student(id, student_email, student_phone, created_on)"
                        + " VALUES(?,?,?,?)";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, id);
                pstm.setString(2, email);
                pstm.setString(3, phone);
                pstm.setString(4, date);
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
    
    public StudentDTO viewStudentProfile(int stdId)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1.Open connection
            con = DBConnection.makeConnection();
            if (con != null) {
                //2. Create SQL String 
                String sql = "Select student_email, student_phone From "
                        + "Student Where id=?";
                //3. Create statement
                stm = con.prepareStatement(sql);
                stm.setInt(1, stdId);
                //4.Execute
                rs = stm.executeQuery();
                //5.process
                if (rs.next()) {
                    String email = rs.getString("student_email");
                    String phone = rs.getString("student_phone");

                    StudentDTO dto = new StudentDTO( email, phone);

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

    public boolean updateStudentProfile(String id, String studentEmail, String studentPhone)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Update Student "
                        + "Set student_email = ?, student_phone = ? Where id=?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, studentEmail);
                pstm.setString(2, studentPhone);
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
