package Servlet;

import Database.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;
    static String sql;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String uName = request.getParameter("uName");
        String pWord = request.getParameter("pWord");

        try {
            conn = new DbConnection().setConnection();
            ps = conn.prepareStatement("SELECT * FROM user_tbl WHERE Username=? AND Password=?");
            ps.setString(1, uName);
            ps.setString(2, pWord);

            rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("user", uName);
                session.setAttribute("login", true);
                session.setAttribute("uName", uName);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("LoginError_1.jsp");
            }
        } catch (IOException | SQLException | ServletException e) {
            response.sendRedirect("LoginError_1.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
