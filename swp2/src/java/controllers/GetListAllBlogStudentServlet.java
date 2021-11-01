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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "GetListAllBlogStudentServlet", urlPatterns = {"/GetListAllBlogStudentServlet"})
public class GetListAllBlogStudentServlet extends HttpServlet {

    private String HOME_PAGE = "student.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {      
            BlogDAO dao = new BlogDAO();
            AccountDAO accDao = new AccountDAO();
            SubjectDAO subDao = new SubjectDAO();
            TagDAO tagDao = new TagDAO();
            
            List<BlogDTO> listBlog = dao.getListAllBlog();
            List<AccountDTO> listAccount = accDao.getAllUserAccount();
            List<SubjectDTO> listSubject = subDao.getAllSubject();
            List<TagDTO> listTag = tagDao.getAllTag();
            List<BlogDTO> listTop5 = dao.getTop5Blog();
            
            request.setAttribute("LISTBLOG", listBlog);
            request.setAttribute("LISTACCOUNT", listAccount);
            request.setAttribute("LISTSUBJECT", listSubject);
            request.setAttribute("LISTTAG", listTag);
            request.setAttribute("LISTTOP5", listTop5);
            
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            request.getRequestDispatcher(HOME_PAGE).forward(request, response);
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
