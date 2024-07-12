<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Error</title>
        <link rel="stylesheet" href="CSS/loginerror.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    </head>
    <body>
        <div class="container">
            <div class="wrapper">
                <div class="title"><span>Register FAILED!</span></div>
                <form>
                    <div>
                        <span>
                            <h4>
                                <% String error = request.getParameter("error");
                                   if ("UsernameTaken".equals(error)) { %>
                                       Username is already taken, please choose a different username!<br><br>
                                <% } else if ("PasswordMismatch".equals(error)) { %>
                                       Password doesn't match, please try again!<br><br>
                                <% } else { %>
                                       An unknown error occurred, please try again!<br><br>
                                <% } %>
                                <div class="row button">
                                    <input type="button" value="Back" onclick="window.location='Register.jsp'">
                                </div>
                            </h4>
                        </span>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
