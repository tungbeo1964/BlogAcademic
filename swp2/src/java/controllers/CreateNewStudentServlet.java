/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
import daos.StudentDAO;
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

@WebServlet(name = "CreateNewStudentServlet", urlPatterns = {"/CreateNewStudentServlet"})
public class CreateNewStudentServlet extends HttpServlet {
    
    private final String SUCCESS = "login.jsp";
    private final String FAIL = "register.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("txtId");
        String fullname = request.getParameter("txtFullname");
        String email = request.getParameter("txtEmail");
        String phone = request.getParameter("txtPhone");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = dateFormat.format(new Date());
        AccountDAO accDAO = new AccountDAO();
        StudentDAO dao = new StudentDAO();
        String url = FAIL;
        CreateNewErrorObj errors = new CreateNewErrorObj();
        try {
            boolean valid = true;
            if (id.isEmpty()) {
                valid = false;
                errors.setIdLengthError("ID is empty!!!");
            }
            if (fullname.isEmpty()) {
                valid = false;
                errors.setFullnameLengthError("Fullname is empty!!!");
            }
            if (email.isEmpty()) {
                valid = false;
                errors.setEmailValidation("Email is empty");
            } else if (!email.isEmpty() && !email.trim().matches("\\w+@\\w+[.]\\w+")) {
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
            if (password.isEmpty()) {
                valid = false;
                errors.setPasswordLengthError("Password is empty!!!");
            } else if (!confirm.trim().equals(password.trim())) {
                valid = false;
                errors.setConfirmNotMatch("Password and confirm are not match!!!");
            }
            if (valid) {
                dao.createNewAccount(id, password, fullname, 3, false);
                try {
                    AccountDTO dto = accDAO.getAccountID();
                    boolean result = dao.insertInfo(dto.getId(), email, phone, date);
                    if (result) {
                        url = SUCCESS;
                    } else {
                        url = FAIL;
                    }
                    
                } catch (Exception e) {
                    log(this.getServletName(), e);
                }
            } else {
                request.setAttribute("CREATEERROR", errors);
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (SQLException e) {
            log(this.getServletName(), e);
            errors.setUserIsExisted(id + " is existed !!!");
            request.setAttribute("CREATEERROR", errors);
            request.getRequestDispatcher(url).forward(request, response);
        } catch (NamingException e) {
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
