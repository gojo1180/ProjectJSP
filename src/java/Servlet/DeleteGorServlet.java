package Servlet;

import Controller.GorDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteGorServlet")
public class DeleteGorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GorDAO gorDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        gorDAO = new GorDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            gorDAO.deleteGor(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("GorDataServlet");
    }
}
