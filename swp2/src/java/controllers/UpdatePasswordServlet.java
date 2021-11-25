/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
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
@WebServlet(name = "UpdatePasswordServlet", urlPatterns = {"/UpdatePasswordServlet"})
public class UpdatePasswordServlet extends HttpServlet {

    private final String SUCCESS = "login.jsp";
    private final String FAIL = "enterpassword.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = FAIL;
        try {
            String username = request.getParameter("txtUserName");
            String password = request.getParameter("txtNewPassword");
            String confirm = request.getParameter("txtConfirmNewPassword");

            AccountDAO dao = new AccountDAO();
            CreateNewErrorObj error = new CreateNewErrorObj();

            try {
                boolean valid = true;

                if (password.isEmpty()) {
                    valid = false;
                    error.setPasswordLengthError("Password is empty!!!");
                } else if (!confirm.trim().equals(password.trim())) {
                    valid = false;
                    error.setConfirmNotMatch("Password and confirm are not match!!!");
                }

                if (valid) {
                    boolean result = dao.updatePassword(username, password);
                    if (result) {
                        url = SUCCESS;
                    }
                } else {
                    request.setAttribute("USERNAME", username);
                    request.setAttribute("UPDATEEERROR", error);
                }
                request.getRequestDispatcher(url).forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
