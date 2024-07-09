<%-- 
    Document   : About
    Created on : Jul 8, 2024, 12:16:00 AM
    Author     : Raka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <link rel="stylesheet" href="CSS/About.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
    <main>
        <section class="about-section">
            <div class="about-container">
                <h1>Tentang Kami</h1>
                <br>
                <p>Selamat datang di website kami, platform terbaik untuk memesan dan booking lapangan atau venue olahraga badminton. 
                <br>Kami memberikan kemudahan bagi Anda untuk memesan lapangan sesuai dengan waktu dan tanggal yang diinginkan tanpa harus datang langsung ke lokasi.
                </p>
                <br>
                <p>Kami juga merangkul komunitas-komunitas olahraga badminton untuk bermain bersama, sehingga Anda dapat berolahraga sekaligus memperluas jaringan pertemanan dan komunitas Anda.</p>
            </div>
        </section>

        <section class="vision-mission-section">
            <div class="about-container">
                <h1>Visi dan Misi</h1>
                <br><br>
                <div class="vision">
                    <h2>Visi</h2>
                    <p>Menjadi platform terbaik dan terpercaya untuk memesan lapangan olahraga badminton di Indonesia, serta mendukung perkembangan komunitas olahraga badminton.</p>
                </div>
                <br><br>
                <div class="mission">
                    <h2>Misi</h2>
                    <ul>
                        <li> Memberikan kemudahan akses dalam pemesanan lapangan olahraga badminton.</li>
                        <li>Menyediakan layanan yang cepat, mudah, dan terpercaya.</li>
                        <li> Mendukung dan merangkul komunitas-komunitas olahraga badminton.</li>
                        <li> Meningkatkan kesadaran dan partisipasi masyarakat dalam olahraga badminton.</li>
                    </ul>
                </div>
            </div>
        </section>

        <section class="more-info-section">
            <div class="about-container">
                <div class="image-container">
                    <img src="Image/contactus.jpg" alt="About Us Image">
                    <p>Untuk informasi lebih lanjut, silahkan hubungi kami melalui halaman kontak kami.</p>
                    <a href="ContactUs.jsp" class="button">Lihat Selengkapnya</a>
                </div>
            </div>
        </section>
    </main>
    </body>
</html>
<%@include file="Footer.jsp" %>