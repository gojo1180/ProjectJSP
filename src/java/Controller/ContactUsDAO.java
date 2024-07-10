/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Database.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Model.ContactUs;

public class ContactUsDAO {
    private Connection connection;

    public ContactUsDAO() {
        DbConnection dbConnection = new DbConnection();
        this.connection = dbConnection.setConnection();
    }

    public boolean saveContact(ContactUs contact) {
        String query = "INSERT INTO contactus_tbl (Nama, Email, PhoneNumber, Domisili, Pesan) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, contact.getName());
            preparedStatement.setString(2, contact.getEmail());
            preparedStatement.setString(3, contact.getPhone());
            preparedStatement.setString(4, contact.getDomicile());
            preparedStatement.setString(5, contact.getMessage());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}