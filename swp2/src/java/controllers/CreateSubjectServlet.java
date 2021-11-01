/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.SubjectDAO;
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

/**
 *
 * @author TuanTDA
 */
@WebServlet(name = "CreateSubjectServlet", urlPatterns = {"/CreateSubjectServlet"})
public class CreateSubjectServlet extends HttpServlet {

    private final String SUCCESS = "admin.jsp";
    private final String FAIL = "createsubject.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get data from FE
        String id = request.getParameter("txtSubjectID");
        String name = request.getParameter("txtSubjectName");

        // Validate input
        String url = FAIL;
        CreateNewErrorObj errorList = new CreateNewErrorObj();
        try {
            boolean valid = true;
            if (id.isEmpty()) {
                valid = false;
                errorList.setIdLengthError("Subject ID is empty!!!");
            } else if (!id.trim().matches("[A-Z]{3}+[0-9]{3}")) {
                valid = false;
                errorList.setIdLengthError("Subject ID must be follow form: ABC123!!!");
            }

            if (name.isEmpty()) {
                valid = false;
                errorList.setFullnameLengthError("Subject name is empty!!!");
            }

            // Process business
            if (valid) {
                SubjectDAO dao = new SubjectDAO();
                boolean result = dao.createNewSubject(id, name);
                if (result) {
                    url = SUCCESS;
                } else {
                    url = FAIL;
                }
            } else {
                request.setAttribute("CREATEERROR", errorList);
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (SQLException ex) {
            log("CreateSubjectServlet + SQL " + ex.getMessage());
            errorList.setUserIsExisted(id + " is existed !!!");
        } catch (NamingException ex) {
            log("CreateSubjectServlet + Class Not Found (Naming) " + ex.getMessage());
        } finally {
            request.setAttribute("CREATEERROR", errorList);
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
