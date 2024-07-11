<%@page import="Model.Gor"%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Sewa Lapangan</title>
  <link rel="stylesheet" type="text/css" href="CSS/SewaLapanganPage.css">
  <script>
    function searchGor() {
      const searchInput = document.getElementById("gor-search").value;
      const citySelect = document.getElementById("city-dropdown").value;
      const url = new URL(window.location.href);
      url.searchParams.set("search", searchInput);
      url.searchParams.set("city", citySelect);
      window.location.href = url.toString();
    }
  </script>
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
            <button id="search-btn" onclick="searchGor()">Cari Venue</button>
        </div>
        <div class="gor-container">
            <%
                List<Gor> gorList = (List<Gor>) request.getAttribute("gorList");
                if (gorList != null) {
                    for (Gor gor : gorList) {
            %>
            <a class="gor-item" href="OrderServlet?gorName=<%= gor.getNama_Gor() %>">
                <%
                    String base64Image = gor.getImageBase64();
                    if (base64Image != null) {
                %>
                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= gor.getNama_Gor() %>">
                <%
                    } else {
                %>
                <img src="default-image.jpg" alt="<%= gor.getNama_Gor() %>">
                <%
                    }
                %>
                <div class="gor-info">
                    <h3><%= gor.getNama_Gor() %></h3>
                    <p>Rating: ⭐ <%= gor.getRating() %></p>
                    <p>Harga per jam: Rp <%= gor.getHarga() %></p>
                </div>
            </a>
            <%
                    }
                }
            %>
        </div>
    </section>
</body>
</html>
<%@ include file="Footer.jsp" %>
