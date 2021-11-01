/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import util.DBConnection;

/**
 *
 * @author DELL
 */
public class AdminDAO implements Serializable{
    
    public boolean checkLoginAdmin(String username, String password)
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
                        + "Account Where username=? AND password=? AND role=1";
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
    
}
