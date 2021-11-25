/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AdminDAO;
import daos.MentorDAO;
import daos.StudentDAO;
import errorObj.CreateNewErrorObj;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginSerlet", urlPatterns = {"/LoginSerlet"})
public class LoginSerlet extends HttpServlet {

    private final String invalid = "login.jsp";
    private final String adminPage = "admin.jsp";
    private final String mentorPage = "GetListAllBlogMentorServlet";
    private final String studentPage = "GetListAllBlogStudentServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("txtID");
        String password = request.getParameter("txtpassword");
        String cbRole = request.getParameter("cboSetRole");
        AdminDAO adminDao = new AdminDAO();
        StudentDAO studentDao = new StudentDAO();
        MentorDAO mentorDao = new MentorDAO();
        String url = invalid;
        CreateNewErrorObj error = new CreateNewErrorObj();
        try {
            try {
                if (cbRole.equals("Admin")) {
                    boolean adminLoginResult = adminDao.checkLoginAdmin(username, password);
                    if (adminLoginResult) {
                        url = adminPage;
                    }
                }
                if (cbRole.equals("Mentor")) {
                    boolean adminLoginResult = mentorDao.checkLoginMentor(username, password);
                    if (adminLoginResult) {
                        url = mentorPage;
                    }
                }
                if (cbRole.equals("Student")) {
                    boolean adminLoginResult = studentDao.checkLoginStudent(username, password);
                    if (adminLoginResult) {
                        url = studentPage;
                    }
                }
                if (url.equals(invalid)) {
                    url = invalid;
                    error.setIdLengthError("Username or Password is wrong!!!!!");
                    request.setAttribute("LOGINERROR", error);
                    request.getRequestDispatcher(url).forward(request, response);
                }
                HttpSession session = request.getSession();
                session.setAttribute("USER", username);
            } catch (IOException | SQLException | NamingException | ServletException e) {
                log(this.getServletName(), e);
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
