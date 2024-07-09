package Controller;

import Database.DbConnection;
import Model.Pemesanan;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public List<String> getBookedTimes(String court, Date date) throws SQLException {
        List<String> bookedTimes = new ArrayList<>();
        String sql = "SELECT time FROM pemesanan_tbl WHERE court = ? AND date = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, court);
            stmt.setDate(2, date);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    bookedTimes.add(rs.getString("time"));
                }
            }
        }
        return bookedTimes;
    }
}