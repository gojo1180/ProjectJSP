package Servlet;

import Controller.GorDAO;
import Model.Gor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import java.io.IOException;
import java.util.Base64;

@WebServlet("/UpdateGorServlet")
public class UpdateGorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private GorDAO gorDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        gorDAO = new GorDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String namaGor = request.getParameter("namaGor");
            String kota = request.getParameter("kota");
            double rating = Double.parseDouble(request.getParameter("rating"));
            double harga = Double.parseDouble(request.getParameter("harga"));
            String Location = request.getParameter("location");
            String LocationLink = request.getParameter("locationLink");
            String Deskripsi = request.getParameter("Deskripsi");
            String updateImageBase64 = request.getParameter("imageBase64");
            
            Deskripsi = Deskripsi.replace("\n","<br>").replace("\r","");

            Gor gor = new Gor();
            gor.setId_Gor(id);
            gor.setNama_Gor(namaGor);
            gor.setKota(kota);
            gor.setRating(rating);
            gor.setHarga(harga);
            gor.setLocation(Location);
            gor.setLocationLink(LocationLink);
            gor.setDeskripsi(Deskripsi);
            if (updateImageBase64 != null && !updateImageBase64.isEmpty()) {
                gor.setImageBlob(new SerialBlob(Base64.getDecoder().decode(updateImageBase64)));
            }

            gorDAO.updateGor(gor);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("GorDataServlet");
    }
}
