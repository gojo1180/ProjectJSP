package Servlet;

import Controller.BeritaDAO;
import Model.Berita;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/PageBeritaServlet")
public class PageBeritaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BeritaDAO beritaDAO;

    @Override
    public void init() throws ServletException {
        beritaDAO = new BeritaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Berita> beritaList = beritaDAO.getAllBerita();
        request.setAttribute("beritaList", beritaList);
        request.getRequestDispatcher("PageBerita.jsp").forward(request, response);
    }
}
