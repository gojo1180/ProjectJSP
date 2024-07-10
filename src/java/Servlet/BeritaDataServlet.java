package Servlet;

import Controller.BeritaDAO;
import Model.Berita;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

@WebServlet("/BeritaDataServlet")
public class BeritaDataServlet extends HttpServlet {
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
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        List<Berita> beritaList = beritaDAO.getAllBerita();
        request.setAttribute("beritaList", beritaList);
        request.getRequestDispatcher("Admin_DataBerita.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addBerita(request, response);
        }
    }

    private void addBerita(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String judul = request.getParameter("judul");
            String penulis = request.getParameter("penulis");
            String tanggal = request.getParameter("tanggal");
            String konten = request.getParameter("konten");
            String imageBase64 = request.getParameter("imageBase64");
            
            konten = konten.replace("\n","<br>").replace("\r","");

            Berita berita = new Berita();
            berita.setJudul(judul);
            berita.setPenulis(penulis);
            berita.setTanggal(tanggal);
            berita.setKonten(konten);
            berita.setImageBlob(new SerialBlob(Base64.getDecoder().decode(imageBase64)));

            beritaDAO.addBerita(berita);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("BeritaDataServlet");
    }
}
