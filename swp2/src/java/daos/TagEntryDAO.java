/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
import util.DBConnection;

public class TagEntryDAO implements Serializable {

    public boolean createTagEntry(int contentId, String tagId) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Insert into TagEntry (content_id, tag_id) values (?, ?)";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, contentId);
                preparedStatement.setString(2, tagId);
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

    public boolean deleteBlogTags(int id) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBConnection.makeConnection();
            if (connection != null) {
                String query = "Delete from TagEntry where content_id = ?";
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
