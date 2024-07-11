<%@page import="Controller.userDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Profil Pengguna</title>
    <link rel="stylesheet" type="text/css" href="CSS/Profile.css">
</head>
<body>
    <div class="content">
        <div class="profile-container">
            <div class="profile-header">
                <h2>Ubah Kata Sandi</h2>
            </div>
            <div class="profile-content">
                <div class="sidebar">
                    <ul>
                        <li><a href="Profile.jsp">Data Diri</a></li>
                        <li class="active"><a href="UbahKataSandi.jsp">Ubah Kata Sandi</a></li>
                        <li><a href="History.jsp">Riwayat Pemesanan</a></li>
                    </ul>
                </div>
                <div class="main-content">
                    <form id="profile-form" action="ResetPasswordServlet" method="post">
                        <div class="form-group">
                            <label for="sandi-lama">Masukkan Kata Sandi Lama<span>*</span></label>
                            <input type="password" id="sandi-lama" name="sandi-lama" required>
                        </div>
                        <div class="form-group">
                            <label for="sandi-baru">Kata Sandi Baru<span>*</span></label>
                            <input type="password" id="sandi-baru" name="sandi-baru" required>
                        </div>
                        <div class="form-group">
                            <label for="konfirmasi-sandi-baru">Ketik Ulang Kata Sandi Baru<span>*</span></label>
                            <input type="password" id="konfirmasi-sandi-baru" name="konfirmasi-sandi-baru" required>
                        </div>
                        <% if (session.getAttribute("errorMessage") != null) { %>
                            <div class="error-message">
                                <%= session.getAttribute("errorMessage") %>
                            </div>
                        <% session.removeAttribute("errorMessage"); } %>
                        <% if (session.getAttribute("successMessage") != null) { %>
                            <div class="success-message">
                                <%= session.getAttribute("successMessage") %>
                            </div>
                        <% session.removeAttribute("successMessage"); } %>
                        <button type="submit" class="btn-save">Simpan Perubahan</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%@include file="Footer.jsp" %>