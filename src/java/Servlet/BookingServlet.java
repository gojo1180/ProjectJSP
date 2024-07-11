package Servlet;

import Controller.PemesananDAO;
import Model.Pemesanan;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private Connection connection;

    @Override
    public void init() throws ServletException {
        super.init();
        connection = (Connection) getServletContext().getAttribute("DbConnection");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");
        String court = request.getParameter("court");
        String gorNama = request.getParameter("gor_nama");

        PemesananDAO pemesananDAO = new PemesananDAO(connection);
        try {
            List<String> bookedTimeSlots = pemesananDAO.getBookedTimes(gorNama, court, Date.valueOf(date));

            // Convert list to JSON and write to response
            Gson gson = new Gson();
            String json = gson.toJson(bookedTimeSlots);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching booked time slots");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String court = request.getParameter("court");
        Date date = Date.valueOf(request.getParameter("date"));
        String[] times = request.getParameterValues("time");
        double price = Double.parseDouble(request.getParameter("price"));
        String gorNama = request.getParameter("gor_nama");

        PemesananDAO pemesananDAO = new PemesananDAO(connection);

        try {
            List<String> bookedTimes = pemesananDAO.getBookedTimes(gorNama, court, date);
            request.setAttribute("bookedTimes", bookedTimes);

            for (String time : times) {
                if (bookedTimes.contains(time)) {
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
                pemesanan.setGor_NamaGor(gorNama);

                pemesananDAO.addPemesanan(pemesanan);
            }
            response.sendRedirect("BookingSuccess.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("BookingError.jsp");
        }
    }
}
