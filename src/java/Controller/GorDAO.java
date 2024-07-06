package Controller;

import Database.DbConnection;
import Model.Gor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GorDAO {

    private Connection connection;

    public GorDAO() {
        this.connection = new DbConnection().setConnection();
    }

    public List<Gor> getAllGors() {
        List<Gor> gorList = new ArrayList<>();
        String sql = "SELECT * FROM Gor";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Gor gor = new Gor();
                gor.setId_Gor(resultSet.getInt("Id_GOR"));
                gor.setNama_Gor(resultSet.getString("Nama_Gor"));
                gor.setKota(resultSet.getString("Kota"));
                gor.setRating(resultSet.getDouble("Rating"));
                gor.setHarga(resultSet.getDouble("Harga_Gor"));
                gor.setImageBlob(resultSet.getBlob("Gambar"));
                gorList.add(gor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return gorList;
    }

    public void addGor(Gor gor) {
        String sql = "INSERT INTO Gor (Nama_Gor, Kota, Rating, Harga_Gor, Gambar) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, gor.getNama_Gor());
            statement.setString(2, gor.getKota());
            statement.setDouble(3, gor.getRating());
            statement.setDouble(4, gor.getHarga());
            statement.setBlob(5, gor.getImageBlob());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateGor(Gor gor) {
        String sql = "UPDATE Gor SET Nama_Gor=?, Kota=?, Rating=?, Harga_Gor=?, Gambar=? WHERE Id_Gor=?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, gor.getNama_Gor());
            statement.setString(2, gor.getKota());
            statement.setDouble(3, gor.getRating());
            statement.setDouble(4, gor.getHarga());
            statement.setBlob(5, gor.getImageBlob());
            statement.setInt(6, gor.getId_Gor());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteGor(int id) {
        String sql = "DELETE FROM Gor WHERE Id_Gor=?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
