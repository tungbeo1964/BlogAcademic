/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
import daos.MentorDAO;
import dtos.AccountDTO;
import errorObj.CreateNewErrorObj;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TuanTDA
 */
@WebServlet(name = "CreateMentorServlet", urlPatterns = {"/CreateMentorServlet"})
public class CreateMentorServlet extends HttpServlet {

    private final String SUCCESS = "admin.jsp";
    private final String FAIL = "creatementor.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get data from FE
        String id = request.getParameter("mentorID");
        String name = request.getParameter("mentorName");
        String email = request.getParameter("mentorEmail");
        String phone = request.getParameter("mentorPhone"); 
        String password = request.getParameter("mentorPassword");
        String confirm = request.getParameter("txtConfirm");
        HttpSession session = request.getSession();
        String createdBy = session.getAttribute("USER").toString();
        
        // Get current datetime
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentDate = dateFormat.format(new Date());

        // Validate input
        String url = FAIL;
        CreateNewErrorObj errorList = new CreateNewErrorObj();
        
        AccountDAO accDAO = new AccountDAO();
        MentorDAO dao = new MentorDAO();
        try {
            boolean valid = true;
            if (id.isEmpty()) {
                valid = false;
                errorList.setIdLengthError("ID is empty");
            } else if(id.length() > 15){
                valid = false;
                errorList.setIdLengthError("ID is longer than 15 characters!!!");
            }
            if (name.isEmpty()) {
                valid = false;
                errorList.setFullnameLengthError("Fullname is empty!!!");
            }
            if (email.isEmpty()) {
                valid = false;
                errorList.setEmailValidation("Email is empty");
            } else if (!email.isEmpty() && !email.trim().matches("\\w+@\\w+[.]\\w+")) {
                valid = false;
                errorList.setEmailValidation("Mail must be follow form: abc@abc.abc");
            }
            if (phone.isEmpty()) {
                valid = false;
                errorList.setPhoneLengthError("Phone is empty!!!");
            } else if (!phone.isEmpty() && !phone.trim().matches("\\d{10}")) {
                valid = false;
                errorList.setPhoneLengthError("Phone must have 10 number");
            }
            if (password.isEmpty()) {
                valid = false;
                errorList.setPasswordLengthError("Password is empty!!!");
            } else if (!confirm.trim().equals(password.trim())) {
                valid = false;
                errorList.setConfirmNotMatch("Password and confirm are not match!!!");
            }

            // Process business
            if (valid) {            
                dao.createNewMentor(id, password, name, 2, false);
                try {
                    AccountDTO dto = accDAO.getAccountID();
                    boolean result = dao.insertInfo(dto.getId(), email, phone, currentDate, createdBy);
                    if (result) {
                        url = SUCCESS;
                    } else {
                        url = FAIL;
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                request.setAttribute("CREATEERROR", errorList);
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (SQLException ex) {
            log("CreateMentorServlet + SQL " + ex.getMessage());
            errorList.setUserIsExisted(id + " is existed !!!");
            request.setAttribute("CREATEERROR", errorList);
            request.getRequestDispatcher(url).forward(request, response);
        } catch (NamingException ex) {
            log("CreateMentorServlet + Class Not Found (Naming) " + ex.getMessage());
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
