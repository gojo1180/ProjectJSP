/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Database.DbConnection;
import Model.Berita;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author VENU WICAKSONO
 */
public class BeritaDAO {
    private Connection connection;

    public BeritaDAO() {
        this.connection = new DbConnection().setConnection();
    }

    public List<Berita> getAllBerita() {
        List<Berita> beritaList = new ArrayList<>();
        String sql = "SELECT * FROM Berita";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Berita berita = new Berita();
                berita.setId(resultSet.getInt("id"));
                berita.setJudul(resultSet.getString("judul"));
                berita.setPenulis(resultSet.getString("penulis"));
                berita.setTanggal(resultSet.getString("tanggal"));
                berita.setKonten(resultSet.getString("konten"));
                berita.setImageBlob(resultSet.getBlob("gambar"));
                beritaList.add(berita);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return beritaList;
    }

    public Berita getBeritaById(int id) {
        Berita berita = null;
        String sql = "SELECT * FROM Berita WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                berita = new Berita();
                berita.setId(resultSet.getInt("id"));
                berita.setJudul(resultSet.getString("judul"));
                berita.setPenulis(resultSet.getString("penulis"));
                berita.setTanggal(resultSet.getString("tanggal"));
                berita.setKonten(resultSet.getString("konten"));
                berita.setImageBlob(resultSet.getBlob("gambar"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return berita;
    }
}

