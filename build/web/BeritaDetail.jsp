<%@page import="Model.Berita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Berita</title>
        <link rel="stylesheet" type="text/css" href="CSS/Berita.css">
    </head>
    <body>
        <main>
            <%
                Berita berita = (Berita) request.getAttribute("berita");
                if (berita != null) {
                    String base64Image = berita.getImageBase64();
            %>
            <section class="title-section">
                <h1><%= berita.getJudul() %></h1>
                <p><%= berita.getPenulis() %> | <%= berita.getTanggal() %></p>
            </section>
            <section class="image-section">
                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= berita.getJudul() %>">
            </section>
            <section class="article-content">
                <p><%= berita.getKonten().replace("\n", "<br>") %></p>    
            </section>
            <button class="back-btn" onclick="window.location='PageBeritaServlet'">Back</button>
            <%
                } else {
            %>
            <section class="error-section">
                <p>Berita tidak ditemukan.</p>
            </section>
            <%
                }
            %>
        </main>
    </body>
</html>
<%@include file="Footer.jsp" %>