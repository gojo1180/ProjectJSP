<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="HeaderAdmin.jsp" %>
<%@page import="Model.Gor" %>
<%@page import="Model.User" %>
<%@page import="java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="CSS/AdminStyle.css">
    </head>
    <body>
        <div class="main-content    ">
            <h1>Data User</h1>
            <table border="1">
                <tr>
                    <th>Username</th>
                    <th>Email</th>
                </tr>
                <%
                    List<User> userList = (List<User>) request.getAttribute("userList");
                    if (userList != null) {
                        for (User user : userList) {
                %>
                <tr>
                    <td><%= user.getUsername() %></td>
                    <td><%= user.getEmail() %></td>
                </tr>
                <% } %>
            </table>
            <% } %>
        </div>
    </body>
</html>
<%@include file="Footer.jsp" %>
