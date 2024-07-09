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
        <link rel="stylesheet" href="CSS/ContactUs.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <section class="contact-form-section">
        <div class="container">
            <h2>Mau mengobrol langsung dengan tim Super Sport App?</h2>
            <p>Terima kasih sudah mengunjungi website kami. Apakah Kamu memiliki pertanyaan seputar platform Super Sport App?</p>
            <p>Sampaikan pertanyaan Anda disini. Tim kami akan menghubungi Anda secepatnya.</p>
            <form id="contact-form" action="ContactUsServlet" method="post">
                <div class="form-group">
                    <input type="text" id="name" name="name" placeholder="Nama" required>
                </div>
                <div class="form-group">
                    <input type="email" id="email" name="email" placeholder="Email" required>
                </div>
                <div class="form-group">
                    <input type="text" id="phone" name="phone" placeholder="Nomor Hp" required>
                </div>
                <div class="form-group">
                    <input type="text" id="domicile" name="domicile" placeholder="Domisili" required>
                </div>
                <div class="form-group">
                    <textarea id="message" name="message" placeholder="Pertanyaan" required></textarea>
                </div>
                <div class="form-group captcha">
                    <div class="g-recaptcha" data-sitekey="your-site-key"></div>
                </div>
                <div class="form-group">
                    <button type="submit" class="submit-button">Submit</button>
                </div>
            </form>
        </div>
    </section>
    </body>
</html>
<%@include file="Footer.jsp" %>