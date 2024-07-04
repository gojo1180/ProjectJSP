<%-- 
    Document   : Register
    Created on : 3 Jul 2024, 12.52.23
    Author     : VENU WICAKSONO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/Login.css">
    </head>
    <body>
        <div class="login-wrapper">
            <form action="RegisterServlet" method="post" id="register-form" class="form">
                <img src="Media/pict.svg" alt="">
                <h2>Register</h2>
                <div class="input-group">
                    <input type="text" name="Username" id="registerUser" required>
                    <label for="registerUser">User Name</label>
                </div>
                <div class="input-group">
                    <input type="email" name="Email" id="registerEmail" required>
                    <label for="registerEmail">Email</label>
                </div>
                <div class="input-group">
                    <input type="password" name="Password" id="registerPassword" required>
                    <label for="registerPassword">Password</label>
                </div>
   
                <label>Sudah punya akun? <span id="daftar"><a href="index.jsp"> Masuk Sekarang!</a></span></label>
                <input class="btn" type="submit" value="Register" >
                <button type="button" class="btn-exit" onclick="location.href='index.jsp'">Cancel</button>
            </form>
        </div>
    </body>
</html>
