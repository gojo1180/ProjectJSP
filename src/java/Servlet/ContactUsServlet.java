/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controller.ContactUsDAO;
import Model.ContactUs;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Raka
 */
@WebServlet(name = "ContactUsServlet", urlPatterns = {"/ContactUsServlet"})
public class ContactUsServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String domicile = request.getParameter("domicile");
        String message = request.getParameter("message");

        ContactUs contact = new ContactUs();
        contact.setName(name);
        contact.setEmail(email);
        contact.setPhone(phone);
        contact.setDomicile(domicile);
        contact.setMessage(message);

        ContactUsDAO dao = new ContactUsDAO();
        boolean isSaved = dao.saveContact(contact);

        if (isSaved) {
            response.sendRedirect("ContactUsSuccess.jsp");
        } else {
            response.sendRedirect("ContactUsError.jsp");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Handles the submission of the Contact Us form.";
    }// </editor-fold>

}
