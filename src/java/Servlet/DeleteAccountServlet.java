package Servlet;

import Controller.userDAO;
import Controller.userDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DeleteAccountServlet", urlPatterns = {"/DeleteAccountServlet"})
public class DeleteAccountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            String username = (String) session.getAttribute("user");
            userDAO UserDAO = new userDAO();
            boolean isDeleted = UserDAO.deleteUserByUsername(username);
            if (isDeleted) {
                session.invalidate();
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("deleteAccountError.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
