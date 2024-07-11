package Servlet;


import Controller.userDAO;
import Model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("user");
        
        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String oldPassword = request.getParameter("sandi-lama");
        String newPassword = request.getParameter("sandi-baru");
        String confirmNewPassword = request.getParameter("konfirmasi-sandi-baru");

        userDAO userDAO = new userDAO();
        User user = userDAO.getUserByUsername(username);

        if (user != null && userDAO.validatePassword(username, oldPassword)) {
            if (newPassword.equals(confirmNewPassword)) {
                boolean isUpdated = userDAO.updateUserPassword(username, newPassword);
                if (isUpdated) {
                    session.setAttribute("successMessage", "Kata sandi berhasil diubah.");
                } else {
                    session.setAttribute("errorMessage", "Gagal mengubah kata sandi.");
                }
            } else {
                session.setAttribute("errorMessage", "Kata sandi baru tidak cocok.");
            }
        } else {
            session.setAttribute("errorMessage", "Kata sandi lama salah.");
        }

        response.sendRedirect("UbahKataSandi.jsp");
    }
}