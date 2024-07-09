<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Header</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<!--    <link rel="stylesheet" href="CSS/Header.css">-->
</head>
<body>
<header>
    <a href="Home.html" class="logo">
        <svg width="81" height="81" viewBox="0 0 81 81" xmlns="http://www.w3.org/2000/svg">
            <path fill="currentColor" d="M40.5 0C18.127 0 0 18.127 0 40.5C0 62.873 18.127 81 40.5 81C62.873 81 81 62.873 81 40.5C81 18.127 62.873 0 40.5 0ZM48.3714 53.2542H18.8129L32.645 27.7621H62.2034L48.3714 53.2542Z" fill="white"/>
            <path fill="currentColor" d="M14.2771 51.583L60.3952 25.3667L64.2422 32.1341L18.1241 58.3504L14.2771 51.583Z" fill="white"/>
        </svg>
    </a>

    <ul class="navbar">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="GorServlet" title="Sewa Lapangan">Sewa Lapangan</a></li>
        <li><a href="PageBeritaServlet">Blog</a></li>
        <li><a href="About.jsp">About</a></li>
    </ul>

    <div class="main">
        <%
            if (session != null && session.getAttribute("user") != null) {
                String username = (String) session.getAttribute("user");
        %>
        <a href="Profile.jsp" class="user"><i class="ri-user-fill"></i></a>
            <button id="logout-button" onclick="location.href='LogoutServlet'" class="log-out">Logout</button>
        <%
            } else {
        %>
            <button id="login-button" onclick="location.href='login.jsp'">Masuk</button>
            <button id="register-button" onclick="location.href='Register.jsp'">Daftar</button>
        <%
            }
        %>
    </div>
    <div class="bx bx-menu" id="menu-icon"></div>
</header>
</body>
</html>
