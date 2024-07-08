package Servlet;

import Controller.PemesananDAO;
import Model.Pemesanan;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private Connection connection;

    @Override
    public void init() throws ServletException {
        super.init();
        connection = (Connection) getServletContext().getAttribute("DbConnection");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String court = request.getParameter("court");
        Date date = Date.valueOf(request.getParameter("date"));
        String[] times = request.getParameterValues("time");
        double price = Double.parseDouble(request.getParameter("price"));
        String gor_Nama = request.getParameter("gor_nama");

        PemesananDAO pemesananDAO = new PemesananDAO(connection);

        try {
            for (String time : times) {
                if (pemesananDAO.isBookingExists(court, date, time)) {
                    response.sendRedirect("BookingConflict.jsp");
                    return;
                }
            }

            for (String time : times) {
                Pemesanan pemesanan = new Pemesanan();
                pemesanan.setName(name);
                pemesanan.setEmail(email);
                pemesanan.setCourt(court);
                pemesanan.setDate(date);
                pemesanan.setTime(time);
                pemesanan.setHarga(price);
                pemesanan.setGor_NamaGor(gor_Nama);

                pemesananDAO.addPemesanan(pemesanan);
            }
            response.sendRedirect("BookingSuccess.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("BookingError.jsp");
        }
    }
}
