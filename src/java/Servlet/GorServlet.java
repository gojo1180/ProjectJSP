/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
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

        List<Gor> gorList = new ArrayList<>();
        try (Connection connection = new DbConnection().setConnection()) {
            String sql = "SELECT * FROM Gor";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Gor gor = new Gor();
                gor.setNama_Gor(resultSet.getString("Nama_Gor"));
                gor.setKota(resultSet.getString("Kota"));
                gor.setRating(resultSet.getDouble("Rating"));
                gor.setHarga(resultSet.getDouble("Harga_Gor"));
                gor.setImage(resultSet.getString("GamBar"));
                gorList.add(gor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("gorList", gorList);
        request.getRequestDispatcher("SewaLapangan.jsp").forward(request, response);
    }
}



