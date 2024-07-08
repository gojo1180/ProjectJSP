package Controller;

import Database.DbConnection;
import Model.Pemesanan;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PemesananDAO {
    private Connection connection;

    public PemesananDAO(Connection connection) {
        this.connection = new DbConnection().setConnection();
    }

    public void addPemesanan(Pemesanan pemesanan) throws SQLException {
        String sql = "INSERT INTO pemesanan_tbl (Nama_Pemesan, Email_Pemesan, court, date, time, Harga, ) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, pemesanan.getName());
            stmt.setString(2, pemesanan.getEmail());
            stmt.setString(3, pemesanan.getCourt());
            stmt.setDate(4, pemesanan.getDate());
            stmt.setString(5, pemesanan.getTime());
            stmt.setDouble(6, pemesanan.getHarga());
            stmt.setString(7, pemesanan.getGor_NamaGor());
            stmt.executeUpdate();
        }
    }

    public boolean isBookingExists(String court, Date date, String time) throws SQLException {
        String sql = "SELECT COUNT(*) FROM pemesanan_tbl WHERE court = ? AND date = ? AND time = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, court);
            stmt.setDate(2, date);
            stmt.setString(3, time);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
}