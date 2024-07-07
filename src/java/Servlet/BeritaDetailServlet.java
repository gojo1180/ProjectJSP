package Servlet;

import Controller.BeritaDAO;
import Model.Berita;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BeritaDetailServlet")
public class BeritaDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BeritaDAO beritaDAO;

    @Override
    public void init() throws ServletException {
        beritaDAO = new BeritaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Berita berita = beritaDAO.getBeritaById(id);
        request.setAttribute("berita", berita);
        request.getRequestDispatcher("BeritaDetail.jsp").forward(request, response);
    }
}