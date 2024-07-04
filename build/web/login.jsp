<%-- 
    Document   : LoginJsp
    Created on : 2 Jul 2024, 20.09.53
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
            <form action="<%=request.getContextPath()%>/LoginServlet" method="post" id="login-form" class="form">
            <img src="Media/pict.svg" alt="">
            <h2>Login</h2>
            <div class="input-group">
                <input type="text" name="uName" id="loginUser" required>
                <label for="loginUser">User Name</label>
            </div>
            <div class="input-group">
                <input type="password" name="pWord" id="loginPassword" required>
                <label for="loginPassword">Password</label>
            </div>
            <label for="">Belum punya akun? <span id="daftar"><a href="Register.jsp"> Daftarkan Sekarang!</a></span></label>
            <input class="btn" type="submit" value="Login">
            <button type="button" class="btn-exit" onclick="location.href='index.jsp'">Cancel</button>
        </form>
    </div>
    </body>
</html>
