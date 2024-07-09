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
import java.util.List;

@WebServlet("/GorDataServlet")
public class GorDataServlet extends HttpServlet {
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
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        List<Gor> gorList = gorDAO.getAllGors();
        request.setAttribute("gorList", gorList);
        request.getRequestDispatcher("Admin_DataGor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addGor(request, response);
        }
    }

    private void addGor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String namaGor = request.getParameter("namaGor");
            String kota = request.getParameter("kota");
            double rating = Double.parseDouble(request.getParameter("rating"));
            double harga = Double.parseDouble(request.getParameter("harga"));
            String imageBase64 = request.getParameter("imageBase64");
            String location = request.getParameter("location");
            String locationLink = request.getParameter("locationLink");
            String Deskripsi = request.getParameter("Deskripsi");

            Gor gor = new Gor();
            gor.setNama_Gor(namaGor);
            gor.setKota(kota);
            gor.setRating(rating);
            gor.setHarga(harga);
            gor.setImageBlob(new SerialBlob(Base64.getDecoder().decode(imageBase64)));
            gor.setLocation(location);
            gor.setLocationLink(locationLink);
            gor.setDeskripsi(Deskripsi);
            
            gorDAO.addGor(gor);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("GorDataServlet");
    }
}