/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
import daos.MentorDAO;
import errorObj.CreateNewErrorObj;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "UpdateMentorProfileServlet", urlPatterns = {"/UpdateMentorProfileServlet"})
public class UpdateMentorProfileServlet extends HttpServlet {

    private final String VIEW_PROFILE_MENTOR_PAGE = "ViewMentorProfileServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("txtID");
        String username = request.getParameter("txtUsername");
        String fullname = request.getParameter("txtFullname");
        String mail = request.getParameter("txtEmail");
        String phone = request.getParameter("txtPhone");
        String createBy = request.getParameter("txtCreateBy");

        AccountDAO accDao = new AccountDAO();
        MentorDAO dao = new MentorDAO();

        String url = VIEW_PROFILE_MENTOR_PAGE;

        CreateNewErrorObj errors = new CreateNewErrorObj();
        try {
            boolean valid = true;

            // Fullname
            if (fullname.isEmpty()) {
                valid = false;
                errors.setFullnameLengthError("Fullname is empty!!!");
            }

            //Email
            if (mail.isEmpty()) {
                valid = false;
                errors.setEmailValidation("Email is empty");
            } else if (!mail.isEmpty() && !mail.trim().matches("\\w+@\\w+[.]\\w+")) {
                valid = false;
                errors.setEmailValidation("Mail must be follow form: abc@abc.abc");
            }

            // Phone
            if (phone.isEmpty()) {
                valid = false;
                errors.setPhoneLengthError("Phone is empty!!!");
            } else if (!phone.isEmpty() && !phone.trim().matches("\\d{10}")) {
                valid = false;
                errors.setPhoneLengthError("Phone must have 10 number");
            }

            if (valid) {
                accDao.updateAccountProfile(username, fullname);

                boolean reult = dao.updateMentorProfile(id, mail, phone);
                if (reult) {
                    response.sendRedirect(url);
                } else {
                    response.sendRedirect(url);
                }

            } else {
                request.setAttribute("CREATEERROR", errors);
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            out.close();
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
