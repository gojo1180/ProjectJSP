<%@page import="Model.Gor"%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JSP Page</title>
  <link rel="stylesheet" type="text/css" href="CSS/SewaLapangan.css">
</head>
<body>
   <section class="booking">
        <h2>BOOKING LAPANGAN TERBAIK</h2>
        <div class="search-container">
            <input type="text" id="gor-search" placeholder="Cari nama GOR">
            <select id="city-dropdown">
                <option value="">Pilih Kota</option>
                <option value="Jakarta">Jakarta</option>
                <option value="Depok">Depok</option>
                <option value="Bekasi">Bekasi</option>
            </select>
            <button id="search-btn">Cari Venue</button>
        </div>
        <div class="gor-container">
            <%
                List<Gor> gorList = (List<Gor>) request.getAttribute("gorList");
                for (Gor gor : gorList) {
            %>
            <div class="gor-item" data-gor="<%= gor.getNama_Gor() %>" data-city="<%= gor.getKota() %>" onclick="navigateTo<%= gor.getNama_Gor().replaceAll(" ", "") %>()">
                <img src="<%= gor.getImage() %>" alt="<%= gor.getNama_Gor() %>">
                <div class="gor-info">
                    <h3><%= gor.getNama_Gor() %></h3>
                    <p>Rating: ⭐ <%= gor.getRating() %></p>
                    <p>Harga per jam: Rp <%= gor.getHarga() %></p>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </section>
</body>
</html>
<%@ include file="Footer.jsp" %>
