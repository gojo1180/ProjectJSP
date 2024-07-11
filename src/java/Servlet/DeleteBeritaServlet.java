package Servlet;

import Controller.BeritaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteBeritaServlet")
public class DeleteBeritaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BeritaDAO beritaDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        beritaDAO = new BeritaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            beritaDAO.deleteBerita(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("BeritaDataServlet");
    }
}
