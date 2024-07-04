<%-- 
    Document   : Homejsp
    Created on : 2 Jul 2024, 21.04.43
    Author     : VENU WICAKSONO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="Header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/Home.css">
    </head>
    <body>
            <section class="hero" id="hero-section">
        <h1>Super Sport Application</h1>
        <p>Platform all-in-one untuk sewa lapangan, informasi mengenai olahraga badminton. Olahraga makin mudah dan menyenangkan!</p>
    </section>

    <section class="content">
        <div class="card">
            <div class="card-content">
                <h2>Sewa lapangan dengan mudah dan cepat.</h2>
                <p>Ada rencana berolahraga minggu ini tapi belum tahu mau main di mana? Atau tidak sempat jauh-jauh datang ke venue hanya untuk booking lapangan?</p>
                <a href="PageSewaLapangan.html">Lihat Selengkapnya →</a>
            </div>
            <div class="card-background">
                <button class="arrow-left" data-target="0">&#9664;</button>
                <div class="background-container" id="background-0"></div>
                <button class="arrow-right" data-target="0">&#9654;</button>
            </div>
        </div>
        <div class="card">
            <div class="card-content">
                <h2>Berita seputar olahraga badminton</h2>
                <p>Informasi mengenai Dunia Badminton, jadwal kompetisi resmi BWF, hasil pertandingan, dan Press Match Conference</p>
                <a href="PageBerita.html">Lihat Selengkapnya →</a>
            </div>
            <div class="card-background">
                <button class="arrow-left" data-target="1">&#9664;</button>
                <div class="background-container" id="background-1"></div>
                <button class="arrow-right" data-target="1">&#9654;</button>
            </div>
        </div>
        <div class="card">
            <div class="card-content">
                <h2>Mengapa Super Sport App?</h2>
                <p>Bersama Super Sport App, Anda dapat menemukan teman bermain olahraga badminton dan komunitas amatir dalam satu kolaborasi.</p>
                
                <ul class="features-list">
                    <li><strong style="font-weight: bold;">Introduce</strong><br>Meningkatkan brand awareness kepada masyarakat yang gemar berolahraga.</li>
                    <br>
                    <li><strong style="font-weight: bold;">Interact</strong><br>Melibatkan komunitas amatir saat bermain bersama menggunakan Super Sport App.</li>
                    <br>
                    <li><strong style="font-weight: bold;">Amplify</strong><br>Memperluas jangkauan melalui activation online dan offline yang terintegrasi.</li>
                    <br>
                </ul>

                <a href="About.html" class="read-more">Lihat Selengkapnya →</a>
                
            </div>
            <div class="card-background">
                <button class="arrow-left" data-target="2">&#9664;</button>
                <div class="background-container" id="background-2"></div>
                <button class="arrow-right" data-target="2">&#9654;</button>
                </div>
            </div>
        </div>
        <div class="modal" id="login-modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p>Anda harus login terlebih dahulu untuk memesan lapangan.</p>
                <a href="Login.html" class="button">Login</a>
            </div>
        </div>
    </section>
    </body>
</html>
<%@include file="Footer.jsp" %>