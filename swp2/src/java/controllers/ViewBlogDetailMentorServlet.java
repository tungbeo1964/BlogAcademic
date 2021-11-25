/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
import daos.AwardDAO;
import daos.BlogDAO;
import daos.CommentDAO;
import daos.ImageDAO;
import daos.SubjectDAO;
import daos.TagDAO;
import daos.VideoDAO;
import dtos.AccountDTO;
import dtos.AwardDTO;
import dtos.BlogDTO;
import dtos.CommentDTO;
import dtos.ImageDTO;
import dtos.SubjectDTO;
import dtos.TagDTO;
import dtos.VideoDTO;
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

@WebServlet(name = "ViewBlogDetailMentorServlet", urlPatterns = {"/ViewBlogDetailMentorServlet"})
public class ViewBlogDetailMentorServlet extends HttpServlet {

    private final String BLOG_DETAIL_PAGE = "blogDetailMentor.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("txtBlogId");
        int blogId = Integer.parseInt(id);
        try {
            BlogDAO blogDao = new BlogDAO();
            AccountDAO accDao = new AccountDAO();
            SubjectDAO subDao = new SubjectDAO();
            TagDAO tagDao = new TagDAO();
            ImageDAO imgDao = new ImageDAO();
            VideoDAO vidDao = new VideoDAO();
            CommentDAO commDao = new CommentDAO();
            AwardDAO awardDao = new AwardDAO();
            BlogDTO blogDto = blogDao.viewBlogDetail(blogId);
            List<AccountDTO> listAccount = accDao.getAllUserAccount();
            List<SubjectDTO> listSubject = subDao.getAllSubject();
            List<TagDTO> listTag = tagDao.getTagNameById(blogId);
            List<ImageDTO> result = imgDao.getImagesOfBlog(blogId);
            for (ImageDTO dto : result) {
                dto.setUrl("Storage/Images/" + dto.getUrl());
            }
            List<VideoDTO> videoDto = vidDao.getVideoOfBlog(blogId);
            for (VideoDTO dto2 : videoDto) {
                dto2.setUrl("Storage/Videos/" + dto2.getUrl());
            }
            List<CommentDTO> listComment = commDao.getAllCommentById(blogId);
            List<AwardDTO> listAward = awardDao.getAwardById(blogId);
            request.setAttribute("BLOGDETAIL", blogDto);
            request.setAttribute("LISTACCOUNT", listAccount);
            request.setAttribute("LISTSUBJECT", listSubject);
            request.setAttribute("LISTTAG", listTag);
            request.setAttribute("LISTIMAGE", result);
            request.setAttribute("VIDEODTO", videoDto);
            request.setAttribute("LISTCOMMENT", listComment);
            request.setAttribute("LISTAWARD", listAward);
        } catch (SQLException | NamingException e) {
            log(this.getServletName(), e);
        } finally {
            request.getRequestDispatcher(BLOG_DETAIL_PAGE).forward(request, response);
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
