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

    public List<String> getBookedTimes(String gorNama, String court, Date date) throws SQLException {
        String sql = "SELECT time FROM pemesanan_tbl WHERE Nama_Gor = ? AND court = ? AND date = ?";
        List<String> bookedTimes = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, gorNama);
            statement.setString(2, court);
            statement.setDate(3, date);

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    bookedTimes.add(rs.getString("time"));
                }
            }
        }

        return bookedTimes;
    }

    public void addPemesanan(Pemesanan pemesanan) throws SQLException {
        String sql = "INSERT INTO pemesanan_tbl (Nama_Pemesan, Email_Pemesan, court, date, Time, Harga, Nama_Gor) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, pemesanan.getName());
            statement.setString(2, pemesanan.getEmail());
            statement.setString(3, pemesanan.getCourt());
            statement.setDate(4, pemesanan.getDate());
            statement.setString(5, pemesanan.getTime());
            statement.setDouble(6, pemesanan.getHarga());
            statement.setString(7, pemesanan.getGor_NamaGor());
            statement.executeUpdate();
        }
    }
    
 public List<Pemesanan> getBookingHistoryByUser(String name) throws SQLException {
    List<Pemesanan> bookingHistory = new ArrayList<>();
    String sql = "SELECT * FROM pemesanan_tbl WHERE Nama_Pemesan = ? ORDER BY date DESC";
    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setString(1, name);
        try (ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Pemesanan booking = new Pemesanan();
                booking.setName(resultSet.getString("Nama_Pemesan"));
                booking.setEmail(resultSet.getString("Email_Pemesan"));
                booking.setCourt(resultSet.getString("court"));
                booking.setDate(resultSet.getDate("date"));
                booking.setTime(resultSet.getString("Time"));
                booking.setHarga(resultSet.getDouble("Harga"));
                booking.setGor_NamaGor(resultSet.getString("Nama_Gor"));
                bookingHistory.add(booking);
            }
        }
    }
    return bookingHistory;
}
    
}
