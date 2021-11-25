/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
import daos.StudentDAO;
import errorObj.CreateNewErrorObj;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateStudentProfileServlet", urlPatterns = {"/UpdateStudentProfileServlet"})
public class UpdateStudentProfileServlet extends HttpServlet {

    private final String VIEW_PROFILE_STUDENT_PAGE = "ViewStudentProfileServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("txtID");
        String username = request.getParameter("txtUsername");
        String fullname = request.getParameter("txtFullname");
        String mail = request.getParameter("txtEmail");
        String phone = request.getParameter("txtPhone");
        AccountDAO accDao = new AccountDAO();
        StudentDAO dao = new StudentDAO();
        String url = VIEW_PROFILE_STUDENT_PAGE;
        CreateNewErrorObj errors = new CreateNewErrorObj();
        try {
            boolean valid = true;
            if (fullname.isEmpty()) {
                valid = false;
                errors.setFullnameLengthError("Fullname is empty!!!");
            }
            if (mail.isEmpty()) {
                valid = false;
                errors.setEmailValidation("Email is empty");
            } else if (!mail.isEmpty() && !mail.trim().matches("\\w+@\\w+[.]\\w+")) {
                valid = false;
                errors.setEmailValidation("Mail must be follow form: abc@abc.abc");
            }
            if (phone.isEmpty()) {
                valid = false;
                errors.setPhoneLengthError("Phone is empty!!!");
            } else if (!phone.isEmpty() && !phone.trim().matches("\\d{10}")) {
                valid = false;
                errors.setPhoneLengthError("Phone must have 10 number");
            }
            if (valid) {
                accDao.updateAccountProfile(username, fullname);
                boolean reult = dao.updateStudentProfile(id, mail, phone);
                if (reult) {
                    response.sendRedirect(url);
                } else {
                    response.sendRedirect(url);
                }
            } else {
                request.setAttribute("CREATEERROR", errors);
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (IOException | SQLException | NamingException | ServletException e) {
            log(this.getServletName(), e);
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
