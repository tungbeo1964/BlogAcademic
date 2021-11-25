/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.VideoDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import util.DBConnection;

public class VideoDAO implements Serializable {

    public List<VideoDTO> getVideoOfBlog(int blogId) throws NamingException, SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<VideoDTO> result = null;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Select id, video_url from Video where content_id = ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, blogId);
                resultSet = preparedStatement.executeQuery();
                result = new ArrayList<>();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String image_url = resultSet.getString("video_url");
                    VideoDTO dto = new VideoDTO(id, image_url, blogId);
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

    public boolean createVideo(String videoUrl, int contentId) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Insert into Video(video_url, content_id) values (?, ?)";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, videoUrl);
                preparedStatement.setInt(2, contentId);
                int row = preparedStatement.executeUpdate();
                if (row > 0) {
                    return true;
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
        return false;
    }
    
    public boolean deleteBlogVideo(int id) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Delete from Video where id = ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, id);
                int row = preparedStatement.executeUpdate();
                if (row > 0) {
                    return true;
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
        return false;
    }

}
