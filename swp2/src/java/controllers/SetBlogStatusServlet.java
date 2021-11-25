/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
import daos.BlogDAO;
import daos.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SetBlogStatusServlet", urlPatterns = {"/SetBlogStatusServlet"})
public class SetBlogStatusServlet extends HttpServlet {

    private final String WAITING_BLOG_PAGE = "ViewListWaitingBlogServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String idString = request.getParameter("txtBlogId");
        int id = Integer.parseInt(idString);
        
        String title = request.getParameter("txtTitleBlog");
        
        String cboStatus = request.getParameter("cboSetStatus");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentDate = dateFormat.format(new Date());
        try {
            HttpSession session = request.getSession();
            String username = session.getAttribute("USER").toString();
            AccountDAO accountDAO = new AccountDAO();
            int user = accountDAO.getIdByUsername(username);
            BlogDAO dao = new BlogDAO();
            CommentDAO cmtDao = new CommentDAO();
            
            if (cboStatus.equals("Approve")) {
                dao.setStatusBlog(id, currentDate, user, 2);
                boolean delComment = cmtDao.deleteAllComment(id);
                dao.titleIsExisted(title);
            }
            if (cboStatus.equals("Un-Approve")) {
                dao.setStatusBlog(id, currentDate, user, 3);
            }
        } catch (SQLException | NamingException e) {
            log(this.getServletName(), e);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(WAITING_BLOG_PAGE);
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
