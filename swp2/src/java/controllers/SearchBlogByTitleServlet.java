/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
import daos.BlogDAO;
import daos.SubjectDAO;
import daos.TagDAO;
import dtos.AccountDTO;
import dtos.BlogDTO;
import dtos.SubjectDTO;
import dtos.TagDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchBlogByTitleServlet", urlPatterns = {"/SearchBlogByTitleServlet"})
public class SearchBlogByTitleServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String title = request.getParameter("txtSearchValue");
        String page = request.getParameter("currentPage");
        try {
            BlogDAO dao = new BlogDAO();
            AccountDAO accDao = new AccountDAO();
            SubjectDAO subDao = new SubjectDAO();
            TagDAO tagDao = new TagDAO();
            List<BlogDTO> result;
            if (title.isEmpty()) {
                result = dao.getListAllBlog();
            } else {
                result = dao.getBlogsByTitle(title);
            }
            List<AccountDTO> listAccount = accDao.getAllUserAccount();
            List<SubjectDTO> listSubject = subDao.getAllSubject();
            List<TagDTO> listTag = tagDao.getAllTag();
            List<BlogDTO> listTop5 = dao.getTop5Blog();
            request.setAttribute("LISTTOP5", listTop5);
            request.setAttribute("LISTACCOUNT", listAccount);
            request.setAttribute("LISTBLOG", result);
            request.setAttribute("LISTSUBJECT", listSubject);
            request.setAttribute("LISTTAG", listTag);
        } catch (NamingException | SQLException e) {
            log(this.getServletName(), e);
        } finally {
            request.getRequestDispatcher(page).forward(request, response);
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
