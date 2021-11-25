/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.TagDAO;
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

@WebServlet(name = "CreateTagServlet", urlPatterns = {"/CreateTagServlet"})
public class CreateTagServlet extends HttpServlet {

    private final String SUCCESS = "admin.jsp";
    private final String FAIL = "createtag.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("txtTagId");
        String name = request.getParameter("txtTagName");
        String url = FAIL;
        CreateNewErrorObj errorList = new CreateNewErrorObj();
        try {
            boolean valid = true;
            if (id.isEmpty()) {
                valid = false;
                errorList.setIdLengthError("Tag ID is empty!!!");
            } else if (id.length() > 15) {
                valid = false;
                errorList.setIdLengthError("Tag ID must have 15 characters!!!");
            }
            if (name.isEmpty()) {
                valid = false;
                errorList.setFullnameLengthError("Tag name is empty!!!");
            }
            if (valid) {
                TagDAO dao = new TagDAO();
                boolean result = dao.createNewTag(id, name);
                if (result) {
                    url = SUCCESS;
                } else {
                    url = FAIL;
                }
            } else {
                request.setAttribute("CREATEERROR", errorList);
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (SQLException e) {
            log(this.getServletName(), e);
            errorList.setUserIsExisted(id + " is existed !!!");
        } catch (NamingException e) {
            log(this.getServletName(), e);
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
