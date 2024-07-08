package Servlet;

import Database.DbConnection;
import Model.Gor;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String gorName = request.getParameter("gorName");
        Gor selectedGor = null;

        try (Connection connection = new DbConnection().setConnection()) {
            String sql = "SELECT * FROM Gor WHERE Nama_Gor = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, gorName);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        selectedGor = new Gor();
                        selectedGor.setNama_Gor(resultSet.getString("Nama_Gor"));
                        selectedGor.setKota(resultSet.getString("Kota"));
                        selectedGor.setRating(resultSet.getDouble("Rating"));
                        selectedGor.setHarga(resultSet.getDouble("Harga_Gor"));
                        selectedGor.setImageBlob(resultSet.getBlob("Gambar"));
                        selectedGor.setLocation(resultSet.getString("Location"));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (selectedGor == null) {
            response.sendRedirect("SewaLapangan.jsp");
            return;
        }

        request.setAttribute("selectedGor", selectedGor);
        request.getRequestDispatcher("OrderPage.jsp").forward(request, response);
    }
}
