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
    <script>
        function showDeleteModal() {
            document.getElementById("deleteModalAccount").style.display = "block";
        }

        function closeDeleteModal() {
            document.getElementById("deleteModalAccount").style.display = "none";
        }

        function confirmDeleteAccount() {
            document.getElementById("profile-form").action = "DeleteAccountServlet";
            document.getElementById("profile-form").submit();
        }

        function showUpdateModal() {
            document.getElementById("updateModalAccount").style.display = "block";
        }

        function closeUpdateModal() {
            document.getElementById("updateModalAccount").style.display = "none";
        }

        function confirmUpdateAccount() {
            document.getElementById("profile-form").action = "UpdateServlet";
            document.getElementById("profile-form").submit();
        }

        function showSuccessModal(message) {
            document.getElementById("successMessage").innerText = message;
            document.getElementById("successModal").style.display = "block";
        }

        function closeSuccessModal() {
            document.getElementById("successModal").style.display = "none";
        }

        function showFailureModal(message) {
            document.getElementById("failureMessage").innerText = message;
            document.getElementById("failureModal").style.display = "block";
        }

        function closeFailureModal() {
            document.getElementById("failureModal").style.display = "none";
        }
    </script>
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
                    <form id="profile-form" method="post" action="">
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
                        <div class="button-container">
                            <button type="button" class="btn-save" onclick="showUpdateModal()">Simpan Perubahan</button>
                            <button type="button" class="btn-delete" onclick="showDeleteModal()">Hapus Akun</button>
                        </div>
                        <%
                            } else {
                                response.sendRedirect("login.jsp");
                            }
                        %>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div id="deleteModalAccount" class="modal">
        <div class="modal-confirmation">
            <h2>Konfirmasi Penghapusan</h2>
            <p>Apakah Anda yakin ingin menghapus akun Anda?</p>
            <div class="button-container">
                <button id="confirmDelete" class="btn-delete" onclick="confirmDeleteAccount()">Hapus</button>
                <button onclick="closeDeleteModal()" class="btn-cancel">Batal</button>
            </div>
        </div>
    </div>

    <!-- Update Confirmation Modal -->
    <div id="updateModalAccount" class="modal">
        <div class="modal-confirmation">
            <h2>Konfirmasi Pembaruan</h2>
            <p>Apakah Anda yakin ingin menyimpan perubahan pada profil Anda?</p>
            <div class="button-container">
                <button id="confirmUpdate" class="btn-save" onclick="confirmUpdateAccount()">Simpan</button>
                <button onclick="closeUpdateModal()" class="btn-cancel">Batal</button>
            </div>
        </div>
    </div>

    <!-- Success Modal -->
    <div id="successModal" class="modal">
        <div class="modal-confirmation">
            <h2>Berhasil</h2>
            <p id="successMessage"></p>
            <div class="button-container">
                <button onclick="closeSuccessModal()" class="btn-cancel">Tutup</button>
            </div>
        </div>
    </div>

    <!-- Failure Modal -->
    <div id="failureModal" class="modal">
        <div class="modal-confirmation">
            <h2>Gagal</h2>
            <p id="failureMessage"></p>
            <div class="button-container">
                <button onclick="closeFailureModal()" class="btn-cancel">Tutup</button>
            </div>
        </div>
    </div>
</body>
</html>
<%@include file="Footer.jsp" %>
