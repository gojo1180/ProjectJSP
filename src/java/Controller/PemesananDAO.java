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

    public List<String> getBookedTimes(String court, Date date) throws SQLException {
        List<String> bookedTimes = new ArrayList<>();
        String sql = "SELECT time FROM pemesanan_tbl WHERE court = ? AND date = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, court);
            statement.setDate(2, date);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    bookedTimes.add(resultSet.getString("time"));
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
}
