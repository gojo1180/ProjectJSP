<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="HeaderAdmin.jsp" %>
<%@page import="Model.Gor" %>
<%@page import="Model.Pemesanan" %>
<%@page import="java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="CSS/AdminStyle.css">
    </head>
    <body>
        <div class="main-content    ">
            <h1>Data Pemesanan</h1>
            <table border="1">
                <tr>
                    <th>Nama Pemesan</th>
                    <th>Email Pemesan</th>
                    <th>Lapangan</th>
                    <th>Tanggal</th>
                    <th>Waktu</th>
                    <th>Harga</th>
                    <th>Gor</th>
                </tr>
                <%
                    List<Pemesanan> historyList = (List<Pemesanan>) request.getAttribute("historyList");
                    if (historyList != null) {
                        for (Pemesanan pemesanan : historyList) {
                %>
                <tr>
                    <td><%= pemesanan.getName() %></td>
                    <td><%= pemesanan.getEmail() %></td>
                    <td><%= pemesanan.getCourt() %></td>
                    <td><%= pemesanan.getDate() %></td>
                    <td><%= pemesanan.getTime() %></td>
                    <td><%= pemesanan.getHarga() %></td>
                    <td><%= pemesanan.getGor_NamaGor() %></td>
                </tr>
                <% } %>
            </table>
            <% } %>
        </div>
    </body>
</html>
<%@include file="Footer.jsp" %>
