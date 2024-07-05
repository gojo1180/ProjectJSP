package Servlet;

import Database.DbConnection;
import Model.Gor;
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

@WebServlet("/GorServlet")
public class GorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String city = request.getParameter("city");
        String search = request.getParameter("search");

        List<Gor> gorList = new ArrayList<>();
        try (Connection connection = new DbConnection().setConnection()) {
            StringBuilder sql = new StringBuilder("SELECT * FROM Gor WHERE 1=1");

            if (city != null && !city.isEmpty()) {
                sql.append(" AND Kota = ?");
            }

            if (search != null && !search.isEmpty()) {
                sql.append(" AND Nama_Gor LIKE ?");
            }

            PreparedStatement statement = connection.prepareStatement(sql.toString());

            int paramIndex = 1;
            if (city != null && !city.isEmpty()) {
                statement.setString(paramIndex++, city);
            }

            if (search != null && !search.isEmpty()) {
                statement.setString(paramIndex++, "%" + search + "%");
            }

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Gor gor = new Gor();
                gor.setNama_Gor(resultSet.getString("Nama_Gor"));
                gor.setKota(resultSet.getString("Kota"));
                gor.setRating(resultSet.getDouble("Rating"));
                gor.setHarga(resultSet.getDouble("Harga_Gor"));
                gor.setImageBlob(resultSet.getBlob("GamBar"));
                gorList.add(gor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("gorList", gorList);
        request.getRequestDispatcher("SewaLapangan.jsp").forward(request, response);
    }
}
