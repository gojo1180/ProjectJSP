<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.3.0/fonts/remixicon.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="CSS/HeaderAdmin.css">
    </head>
    <body>
        <header>
        <a href="index.jsp" class="logo">
            <svg width="81" height="81" viewBox="0 0 81 81" xmlns="http://www.w3.org/2000/svg">
                <path fill="currentColor" d="M40.5 0C18.127 0 0 18.127 0 40.5C0 62.873 18.127 81 40.5 81C62.873 81 81 62.873 81 40.5C81 18.127 62.873 0 40.5 0ZM48.3714 53.2542H18.8129L32.645 27.7621H62.2034L48.3714 53.2542Z" fill="white"/>
                <path fill="currentColor" d="M14.2771 51.583L60.3952 25.3667L64.2422 32.1341L18.1241 58.3504L14.2771 51.583Z" fill="white"/>
            </svg>
        </a>
        
        <div class="main">
            <div class="dropdown">
                <button class="dropbtn">Data <i class="ri-arrow-down-s-line"></i></button>
                <div class="dropdown-content">
                    <a id="gor-button" onclick="location.href='GorDataServlet'">Data GOR</a>
                    <a user-button" onclick="location.href='UserServlet'">Data User</a>
                    <a id="berita-button" onclick="location.href='BeritaDataServlet'">Data Berita</a>
                </div>
            </div>
<!--            <button id="gor-button" onclick="location.href='GorDataServlet'">Data GOR</button>
            <button id="user-button" onclick="location.href='UserServlet'">Data User</button>
            <button id="berita-button" onclick="location.href='BeritaDataServlet'">Data Berita</button>-->
            <button id="logout-button" onclick="location.href='LogoutServlet'" class="log-out">Logout</button>
        </div>
        <div class="bx bx-menu" id="menu-icon"></div>
        
    </header>
    </body>
</html>
