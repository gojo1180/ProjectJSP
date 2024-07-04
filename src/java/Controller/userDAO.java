/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Database.DbConnection;
import Model.Register;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Database.DbConnection;

/**
 *
 * @author VENU WICAKSONO
 */
public class userDAO {
    
    public boolean registerUser(Register rg) {
        String sql = "INSERT INTO user_tbl (Username, Email, Password) VALUES (?, ?, ?)";
        try (Connection conn = new DbConnection().setConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, rg.getUsername());
            ps.setString(2, rg.getEmail());
            ps.setString(3, rg.getPassword());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            return false;
        }
    }
}
