<%@page import="Model.Berita"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Berita</title>
        <link rel="stylesheet" type="text/css" href="CSS/PageBerita.css">
    </head>
    <body>
        <main>
            <div class="news-container">
                <%
                    List<Berita> beritaList = (List<Berita>) request.getAttribute("beritaList");
                    if (beritaList != null) {
                        for (Berita berita : beritaList) {
                            String base64Image = berita.getImageBase64();
                %>
                <div class="news-card">
                    <a href="BeritaDetailServlet?id=<%= berita.getId() %>">
                        <div class="image-container">
                            <img src="data:image/jpeg;base64,<%= base64Image %>" alt="News Image">
                        </div>
                        <div class="news-content">
                            <h2><%= berita.getJudul() %></h2>
                            <br>
                            <p>Oleh <%= berita.getPenulis() %></p>
                            <p><%= berita.getTanggal() %></p>
                        </div>
                    </a>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </main>
    </body>
</html>
<%@include file="Footer.jsp" %>
