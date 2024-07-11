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
import Model.User;

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
    
     public User getUserByUsername(String username) {
        String sql = "SELECT * FROM user_tbl WHERE Username = ?";
        try (Connection conn = new DbConnection().setConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getString("Username"), rs.getString("Email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
        }
        return null;
    }

    public boolean updateUserEmail(String username, String email) {
        String sql = "UPDATE user_tbl SET Email = ? WHERE Username = ?";
        try (Connection conn = new DbConnection().setConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, username);
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

    public boolean deleteUserByUsername(String username) {
    String sql = "DELETE FROM user_tbl WHERE Username = ?";
    try (Connection conn = new DbConnection().setConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, username);
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
    
    
    public boolean validatePassword(String username, String password) {
        String sql = "SELECT * FROM user_tbl WHERE Username = ? AND Password = ?";
        try (Connection conn = new DbConnection().setConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUserPassword(String username, String newPassword) {
        String sql = "UPDATE user_tbl SET Password = ? WHERE Username = ?";
        try (Connection conn = new DbConnection().setConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, newPassword);
            ps.setString(2, username);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    
}