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
                <h2>Profil</h2>
            </div>
            <div class="profile-content">
                <div class="sidebar">
                    <ul>
                        <li class="active"><a href="Profile.jsp">Data Diri</a></li>
                        <li><a href="UbahKataSandi.jsp">Ubah Kata Sandi</a></li>
                        <li><a href="RiwayatPemesanan.jsp">Riwayat Pemesanan</a></li>
                    </ul>
                </div>
                <div class="main-content">
                    <form id="profile-form" method="post" action="UpdateProfileServlet">
                        <%
                     
                            if (session != null && session.getAttribute("user") != null) {
                                String username = (String) session.getAttribute("user");
                                userDAO UserDAO = new userDAO();
                                User user = UserDAO.getUserByUsername(username);
                                String email = (user != null) ? user.getEmail() : "";
                        %>
                        <div class="form-group">
                            <label for="username">Username <span>*</span></label>
                            <input type="text" id="username" name="username" value="<%= username %>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="<%= email %>">
                        </div>
                        <button type="submit" class="btn-save">Simpan Perubahan</button>
                        <%
                            } else {
                                response.sendRedirect("login.jsp");
                            }
                        %>
                    </form>
                    <form id="delete-account-form" method="post" action="DeleteAccountServlet">
                        <button type="submit" class="btn-delete">Hapus Akun</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%@include file="Footer.jsp" %>
