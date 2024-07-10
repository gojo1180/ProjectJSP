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

@WebServlet("/UpdateBeritaServlet")
public class UpdateBeritaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BeritaDAO beritaDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        beritaDAO = new BeritaDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String judul = request.getParameter("judul");
            String penulis = request.getParameter("penulis");
            String tanggal = request.getParameter("tanggal");
            String konten = request.getParameter("konten");
            String updateImageBase64 = request.getParameter("imageBase64");
            
            konten = konten.replace("\n", "<br>").replace("\r", "");

            Berita berita = new Berita();
            berita.setId(id);
            berita.setJudul(judul);
            berita.setPenulis(penulis);
            berita.setTanggal(tanggal);
            berita.setKonten(konten);
            if (updateImageBase64 != null && !updateImageBase64.isEmpty()) {
                berita.setImageBlob(new SerialBlob(Base64.getDecoder().decode(updateImageBase64)));
            }

            beritaDAO.updateBerita(berita);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("BeritaDataServlet");
    }
}