package Servlet;

import Database.DbConnection;
import Model.Pemesanan;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HistoryDataServlet")
public class HistoryDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        List<Pemesanan> historyList = new ArrayList<>();
        try (Connection connection = new DbConnection().setConnection()) {
            String sql = "SELECT Nama_Pemesan, Email_Pemesan, court, date, Time, Harga, Nama_Gor FROM pemesanan_tbl";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Pemesanan pemesanan = new Pemesanan();
                pemesanan.setName(resultSet.getString("Nama_Pemesan"));
                pemesanan.setEmail(resultSet.getString("Email_Pemesan"));
                pemesanan.setCourt(resultSet.getString("court"));
                pemesanan.setDate(resultSet.getDate("date"));
                pemesanan.setTime(resultSet.getString("Time"));
                pemesanan.setHarga(resultSet.getDouble("Harga"));
                pemesanan.setGor_NamaGor(resultSet.getString("Nama_Gor"));
                historyList.add(pemesanan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("historyList", historyList);
        request.getRequestDispatcher("Admin_DataHistory.jsp").forward(request, response);
    }
}
