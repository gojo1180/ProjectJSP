<%-- 
    Document   : History
    Created on : 9 Jul 2024, 15.55.43
    Author     : VENU WICAKSONO
--%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.PemesananDAO"%>
<%@page import="Model.Pemesanan"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Riwayat Pemesanan</title>
        <link rel="stylesheet" href="CSS/History.css">
    </head>
    <body>
        <div class="content">
            <div class="profile-container">
                <div class="profile-header">
                    <h2>Riwayat Pemesanan</h2>
                </div>
                <div class="profile-content">
                    <div class="sidebar">
                        <ul>
                            <li><a href="Profile.jsp">Data Diri</a></li>
                            <li><a href="UbahKataSandi.jsp">Ubah Kata Sandi</a></li>
                            <li class="active"><a href="History.jsp">Riwayat Pemesanan</a></li>
                        </ul>
                    </div>
                    <div class="main-content">
                        <div id="bookingHistory">
                            <%-- Booking history will be displayed here --%>
                            <%
                                String username = (String) session.getAttribute("user");
                                if (username != null) {
                                    Controller.userDAO userDAO = new Controller.userDAO();
                                    Model.User user = userDAO.getUserByUsername(username);
                                    String name = user.getUsername();
                                    if (name != null) {
                                        PemesananDAO pemesananDAO = new PemesananDAO((Connection) getServletContext().getAttribute("DbConnection"));
                                        List<Pemesanan> bookings = pemesananDAO.getBookingHistoryByUser(name);
                                        if (bookings != null && !bookings.isEmpty()) {
                                            for (Pemesanan booking : bookings) {
                                                out.println("<div class='booking'>");
                                                out.println("<h2>Lapangan: " + booking.getCourt() + "</p>");
                                                out.println("<h3>Tanggal: " + booking.getDate() + "</p>");
                                                out.println("<p>Waktu: " + booking.getTime() + "</p>");
                                                out.println("<p>Harga: Rp " + booking.getHarga() + "</p>");
                                                out.println("</div>");
                                            }
                                        } else {
                                            out.println("<p>No bookings found.</p>");
                                        }
                                    }
                                } else {
                                    response.sendRedirect("Login.jsp");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </body>
</html>
<%@include file="Footer.jsp" %>
