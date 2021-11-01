/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.AccountDTO;
import dtos.AccountTempDTO;
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
public class AccountDAO implements Serializable {

    public AccountDTO checkLoginAccount(String username, String password)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO user = null;
        try {
            //1.Open connection
            con = DBConnection.makeConnection();
            if (con != null) {
                //2. Create SQL String 
                String sql = "Select id, username, password, full_name, role, del_flag From "
                        + "Account Where username=? AND password=?";
                //3. Create statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4.Execute
                rs = stm.executeQuery();
                //5.process
                if (rs.next()) {
                    return new AccountDTO(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("full_name"),
                            rs.getInt("role"),
                            rs.getBoolean("del_flag"));
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
        return user;
    }

    public AccountDTO getAccountID() throws SQLException, NamingException, Exception {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT TOP 1 id FROM Account ORDER BY id DESC";
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    AccountDTO dto = new AccountDTO(id);

                    return dto;
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
        return null;
    }

    public int getIdByUsername(String username) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int result = -1;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Select id from Account where username like ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, username);
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    return resultSet.getInt("id");
                }
            }

        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return -1;
    }
    
    public AccountDTO viewAccountProfile(String username)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1.Open connection
            con = DBConnection.makeConnection();
            if (con != null) {
                //2. Create SQL String 
                String sql = "Select id, username, password, full_name From "
                        + "Account Where username=?";
                //3. Create statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                //4.Execute
                rs = stm.executeQuery();
                //5.process
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("username");
                    String password = rs.getString("password");
                    String fullname = rs.getString("full_name");

                    AccountDTO dto = new AccountDTO(id, username, password, fullname);

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

    public boolean updateAccountProfile(String username, String studentFullName)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Update Account "
                        + "Set full_name = ? Where username=?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, studentFullName);
                pstm.setString(2, username);

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

    public List<AccountTempDTO> getAllMentor() throws Exception {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<AccountTempDTO> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT a.username, a.full_name , m.mentor_email, m.mentor_phone, m.created_by "
                        + "FROM Account a "
                        + "inner join Mentor m on a.id = m.id "
                        + "WHERE a.role = 2 and a.del_flag = 'false'";
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String username = rs.getString("username");
                    String fullname = rs.getString("full_name");
                    String email = rs.getString("mentor_email");
                    String phone = rs.getString("mentor_phone");
                    String createBy = rs.getString("created_by");
                    AccountTempDTO dto = new AccountTempDTO(username, fullname, email, phone, createBy);
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

    public List<AccountTempDTO> getAllStudent() throws Exception {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<AccountTempDTO> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT a.username, a.full_name , s.student_email, s.student_phone "
                        + "FROM Account a "
                        + "inner join Student s on a.id = s.id "
                        + "WHERE a.role = 3 and a.del_flag = 'false'";
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String username = rs.getString("username");
                    String fullname = rs.getString("full_name");
                    String email = rs.getString("student_email");
                    String phone = rs.getString("student_phone");
                    AccountTempDTO dto = new AccountTempDTO(username, fullname, email, phone);
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

    public boolean banAccount(String username) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Update Account "
                        + "Set del_flag='True' Where username=?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, username);

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

    public AccountDTO getUsernameById(int id) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        AccountDTO result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT id, username FROM Account WHERE id=?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, id);
                rs = pstm.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("username");
                    result = new AccountDTO(id,name);
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

    public List<AccountDTO> getAllUserAccount() throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<AccountDTO> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT id, username FROM Account";
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("username");
                    AccountDTO dto = new AccountDTO(id, name);
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
