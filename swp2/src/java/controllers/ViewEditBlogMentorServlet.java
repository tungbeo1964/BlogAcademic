/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.BlogDAO;
import daos.ImageDAO;
import daos.SubjectDAO;
import daos.TagDAO;
import daos.VideoDAO;
import dtos.BlogDTO;
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

@WebServlet(name = "ViewEditBlogMentorServlet", urlPatterns = {"/ViewEditBlogMentorServlet"})
public class ViewEditBlogMentorServlet extends HttpServlet {

    private final String EDIT_BLOG_PAGE_STUDENT = "editblogmentor.jsp";
    private final String HISTORY_PAGE_STUDENT = "historymentor.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = HISTORY_PAGE_STUDENT;
        try {
            int blogId = Integer.parseInt(request.getParameter("txtBlogId"));
            BlogDAO blogDAO = new BlogDAO();
            BlogDTO blogDTO = blogDAO.viewBlogDetail(blogId);
            request.setAttribute("BLOGDETAILS", blogDTO);
            TagDAO tagDAO = new TagDAO();
            List<String> blogTags = tagDAO.getTagIdByBlogId(blogId);
            request.setAttribute("BLOGTAGS", blogTags);
            ImageDAO imageDAO = new ImageDAO();
            List<ImageDTO> blogImages = imageDAO.getImagesOfBlog(blogId);
            for (ImageDTO imgs : blogImages) {
                imgs.setUrl("Storage/Images/" + imgs.getUrl());
            }
            request.setAttribute("BLOGIMAGES", blogImages); 
            VideoDAO videoDAO = new VideoDAO();
            List<VideoDTO> blogVideos = videoDAO.getVideoOfBlog(blogId);
            for (VideoDTO vids : blogVideos) {
                vids.setUrl("Storage/Videos/" + vids.getUrl());
            }
            request.setAttribute("BLOGVIDEOS", blogVideos);
            List<TagDTO> allTags = tagDAO.getAllTag();
            request.setAttribute("ALLTAGS", allTags);
            SubjectDAO subjectDAO = new SubjectDAO();
            List<SubjectDTO> allSubjects = subjectDAO.getAllSubject();
            allSubjects.add(0, new SubjectDTO("None", null));
            request.setAttribute("ALLSUBJECTS", allSubjects);
            url = EDIT_BLOG_PAGE_STUDENT;
        } catch (NamingException | NumberFormatException | SQLException e) {
            log(this.getServletName(), e);
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
