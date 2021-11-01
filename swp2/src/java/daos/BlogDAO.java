/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.AccountDTO;
import dtos.BlogDTO;
import dtos.SubjectDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import util.DBConnection;

/**
 *
 * @author DELL
 */
public class BlogDAO implements Serializable {

    public List<BlogDTO> getListAllBlog() throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<BlogDTO> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT id, title, created_on, created_by FROM Blog where status=2";
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String createOn = rs.getString("created_on");
                    int createBy = rs.getInt("created_by");
                    AccountDAO accDAO = new AccountDAO();
                    AccountDTO username = accDAO.getUsernameById(createBy);
                    BlogDTO dto = new BlogDTO(id, title, createOn, username);
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

    public BlogDTO viewBlogDetail(int id) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1.Open connection
            con = DBConnection.makeConnection();
            if (con != null) {
                //2. Create SQL String 
                String sql = "Select id, title, blog_content, created_on, created_by, "
                        + "approved_on, approved_by, status, vote, subject_id From "
                        + "Blog Where id=?";
                //3. Create statement
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                //4.Execute
                rs = stm.executeQuery();
                //5.process
                if (rs.next()) {
                    int blogId = rs.getInt("id");
                    String title = rs.getString("title");
                    String content = rs.getString("blog_content");
                    String createOn = rs.getString("created_on");
                    int createBy = rs.getInt("created_by");
                    String approveOn = rs.getString("approved_on");
                    int approveBy = rs.getInt("approved_by");
                    int status = rs.getInt("status");
                    int vote = rs.getInt("vote");
                    String subjectId = rs.getString("subject_id");

                    //Account username
                    AccountDAO accDAO = new AccountDAO();
                    AccountDTO username = accDAO.getUsernameById(createBy);
                    //Subject name
                    SubjectDAO subDao = new SubjectDAO();
                    SubjectDTO subName = subDao.getSubjectNameById(subjectId);

                    BlogDTO dto = new BlogDTO(id, title, content, createOn, username, approveOn, approveBy, status, vote, subName);

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

    public boolean updateVotedBlog(int id, int vote) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Update Blog Set vote=? Where id=?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, vote);
                pstm.setInt(2, id);

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

    public List<BlogDTO> getBlogsByTitle(String searchValue) throws NamingException, SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<BlogDTO> result = null;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Select id, title, created_by, created_on from Blog where title like ? and status = 2";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, "%" + searchValue + "%");
                resultSet = preparedStatement.executeQuery();
                result = new ArrayList<>();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String title = resultSet.getString("title");
                    String createdOn = resultSet.getString("created_on");
                    int createdBy = resultSet.getInt("created_by");
                    AccountDAO accDAO = new AccountDAO();
                    AccountDTO username = accDAO.getUsernameById(createdBy);
                    BlogDTO dto = new BlogDTO(id, title, createdOn, username);
                    result.add(dto);
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
        return result;
    }

    public List<BlogDTO> getBlogsBySubject(String searchValue) throws NamingException, SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<BlogDTO> result = null;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Select id, title, created_by, created_on from Blog where subject_id=? and status = 2";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, searchValue);
                resultSet = preparedStatement.executeQuery();
                result = new ArrayList<>();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String title = resultSet.getString("title");
                    String createdOn = resultSet.getString("created_on");
                    int createdBy = resultSet.getInt("created_by");
                    AccountDAO accDAO = new AccountDAO();
                    AccountDTO username = accDAO.getUsernameById(createdBy);
                    BlogDTO dto = new BlogDTO(id, title, createdOn, username);
                    result.add(dto);
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
        return result;
    }

    public List<BlogDTO> getBlogsByTag(String searchValue) throws NamingException, SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<BlogDTO> result = null;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Select id, title, created_by, created_on from Blog A join TagEntry B on A.id = B.content_id join Tag C on C.tag_id = B.tag_id where C.tag_name=? and A.status = 2";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, searchValue);
                resultSet = preparedStatement.executeQuery();
                result = new ArrayList<>();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String title = resultSet.getString("title");
                    String createdOn = resultSet.getString("created_on");
                    int createdBy = resultSet.getInt("created_by");
                    AccountDAO accDAO = new AccountDAO();
                    AccountDTO username = accDAO.getUsernameById(createdBy);
                    BlogDTO dto = new BlogDTO(id, title, createdOn, username);
                    result.add(dto);
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
        return result;
    }

    public List<BlogDTO> getTop5Blog() throws NamingException, SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<BlogDTO> result = null;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Select top(5) id, title, created_by, created_on, vote from Blog where status = 2 order by vote desc";
                preparedStatement = connection.prepareStatement(query);
                resultSet = preparedStatement.executeQuery();
                result = new ArrayList<>();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String title = resultSet.getString("title");
                    String createdOn = resultSet.getString("created_on");
                    int createdBy = resultSet.getInt("created_by");
                    int voteTotal = resultSet.getInt("vote");
                    AccountDAO accDAO = new AccountDAO();
                    AccountDTO username = accDAO.getUsernameById(createdBy);
//                    BlogDTO dto = new BlogDTO(id, title, createdOn, username, voteTotal);
                    BlogDTO dto = new BlogDTO(id, title, null, createdOn, username, null, 0, 0, voteTotal, null);
                    result.add(dto);
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
        return result;
    }

    public int createNewBlog(String title, String blogContent, int createdBy, String subjectId) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Insert into Blog (title, blog_content, created_on, created_by, approved_by, status, vote, subject_id) values (?, ?, ?, ?, ?, ?, ?, ?)";
                preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, title);
                preparedStatement.setString(2, blogContent);
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                String currentDatetime = formatter.format(date);
                preparedStatement.setString(3, currentDatetime);
                preparedStatement.setInt(4, createdBy);
                preparedStatement.setInt(5, -1);
                preparedStatement.setInt(6, 1);
                preparedStatement.setInt(7, 0);
                preparedStatement.setString(8, subjectId);
                int row = preparedStatement.executeUpdate();
                if (row > 0) {
                    try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            return generatedKeys.getInt(1);
                        }
                    }
                }
            }
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return -1;
    }

    public List<BlogDTO> getListWaitingBlog() throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<BlogDTO> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT id, title, created_on, created_by, status"
                        + " FROM Blog Where status=1 OR status=3";
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String createOn = rs.getString("created_on");
                    int createBy = rs.getInt("created_by");
                    AccountDAO accDAO = new AccountDAO();
                    AccountDTO username = accDAO.getUsernameById(createBy);

                    int status = rs.getInt("status");

                    BlogDTO dto = new BlogDTO(id, title, createOn, username, status);
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

    public boolean setStatusBlog(int bid, String approveDate, int approveBy, int status)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "Update Blog Set status=?, approved_on=?, approved_by=? Where id=?";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, status);
                pstm.setString(2, approveDate);
                pstm.setInt(3, approveBy);
                pstm.setInt(4, bid);
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

    public List<BlogDTO> getHistoryBlogByUserName(String uname)
            throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<BlogDTO> result = null;
        try {
            conn = DBConnection.makeConnection();
            if (conn != null) {
                String sql = "SELECT Blog.id, title, created_on, created_by, approved_on, approved_by, status, vote, subject_id  From Blog "
                        + "inner join Account as A On A.id = Blog.created_by "
                        + "Where a.username=?";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, uname);
                rs = pstm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String createOn = rs.getString("created_on");
                    int createBy = rs.getInt("created_by");
                    AccountDAO accDAO = new AccountDAO();
                    AccountDTO username = accDAO.getUsernameById(createBy);
                    String approveOn = rs.getString("approved_on");
                    int approveBy = rs.getInt("approved_by");
                    int status = rs.getInt("status");
                    int voteTotal = rs.getInt("vote");
                    String subjectId = rs.getString("subject_id");
                    BlogDTO dto = new BlogDTO(id, title, createOn, username, approveOn, approveBy, status, voteTotal);
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

    public int updateBlog(int id, String title, String blogContent, int createdBy, String subjectId) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Update Blog set title = ?, blog_content = ?, created_on = ?, created_by = ?, status = ?, vote = ?, subject_id = ? where id = ?";
                preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, title);
                preparedStatement.setString(2, blogContent);
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date date = new Date();
                String currentDatetime = formatter.format(date);
                preparedStatement.setString(3, currentDatetime);
                preparedStatement.setInt(4, createdBy);
                preparedStatement.setInt(5, 1);
                preparedStatement.setInt(6, 0);
                preparedStatement.setString(7, subjectId);
                preparedStatement.setInt(8, id);
                int row = preparedStatement.executeUpdate();
                if (row > 0) {
                    try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            return generatedKeys.getInt(1);
                        }
                    }
                }
            }
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return -1;
    }


    
}
