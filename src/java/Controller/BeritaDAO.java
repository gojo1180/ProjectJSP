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
        String sql = "SELECT * FROM berita_tbl";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Berita berita = new Berita();
                berita.setId(resultSet.getInt("Id_Berita"));
                berita.setJudul(resultSet.getString("Judul_Berita"));
                berita.setPenulis(resultSet.getString("Penulis_Berita"));
                berita.setTanggal(resultSet.getString("Tanggal_Berita"));
                berita.setKonten(resultSet.getString("Konten_Berita"));
                berita.setImageBlob(resultSet.getBlob("Gambar"));
                beritaList.add(berita);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return beritaList;
    }

    public Berita getBeritaById(int id) {
        Berita berita = null;
        String sql = "SELECT * FROM berita_tbl WHERE Id_Berita = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                berita = new Berita();
                berita.setId(resultSet.getInt("Id_Berita"));
                berita.setJudul(resultSet.getString("Judul_Berita"));
                berita.setPenulis(resultSet.getString("Penulis_Berita"));
                berita.setTanggal(resultSet.getString("Tanggal_Berita"));
                berita.setKonten(resultSet.getString("Konten_Berita"));
                berita.setImageBlob(resultSet.getBlob("Gambar"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return berita;
    }
}

