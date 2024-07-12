/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controller.userDAO;
import Model.Register;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author VENU WICAKSONO
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String username = request.getParameter("Username");
        String password = request.getParameter("Password");
        String confirmPassword = request.getParameter("ConfirmPassword");

        userDAO UserDAO = new userDAO();

        // Check if username is already taken
        if (UserDAO.isUsernameTaken(username)) {
            response.sendRedirect("RegisterError.jsp?error=UsernameTaken");
            return;
        }

        // Check if password and confirm password match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("RegisterError.jsp?error=PasswordMismatch");
            return;
        }

        Register rg = new Register();
        rg.setUsername(username);
        rg.setEmail(request.getParameter("Email"));
        rg.setPassword(password);

        boolean success = UserDAO.registerUser(rg);

        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("RegisterError.jsp?error=RegistrationFailed");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}