package Servlet;

import Database.DbConnection;
import Model.User;
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

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        List<User> userList = new ArrayList<>();
        try (Connection connection = new DbConnection().setConnection()) {
            String sql = "SELECT Username, Email FROM user_tbl";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setUsername(resultSet.getString("Username"));
                user.setEmail(resultSet.getString("Email"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("userList", userList);
        request.getRequestDispatcher("Admin_DataUser.jsp").forward(request, response);
    }
}
