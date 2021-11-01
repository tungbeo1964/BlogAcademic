/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.BlogDAO;
import daos.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "PostCommentServlet", urlPatterns = {"/PostCommentServlet"})
public class PostCommentServlet extends HttpServlet {

    private String STUDENT_HOME_PAGE = "GetListAllBlogStudentServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String detail = request.getParameter("txtCommentDetail").trim();

        String voteStr = request.getParameter("rating");
        int vote = Integer.parseInt(voteStr);

        String voteTotalStr = request.getParameter("txtVoteTotal");
        int voteTotal = Integer.parseInt(voteTotalStr);

        String contentIdStr = request.getParameter("txtBlogId");
        int contentId = Integer.parseInt(contentIdStr);

        HttpSession session = request.getSession();
        String postBy = session.getAttribute("USER").toString();

        // Get current datetime
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datePost = dateFormat.format(new Date());

        CommentDAO cmmDao = new CommentDAO();
        BlogDAO blogDao = new BlogDAO();

        String url = STUDENT_HOME_PAGE;

        try {
            boolean postResult = cmmDao.postComment(detail, vote, contentId, datePost, postBy);
            try {
                int updateVote = (vote + voteTotal);

                boolean updateVoteResult = blogDao.updateVotedBlog(contentId, updateVote);

            } catch (Exception ex) {
                ex.printStackTrace();
            }
            url = "MainController?txtBlogId="+ contentIdStr +"&btnAction=View+Detail";
            response.sendRedirect(url);

        } catch (Exception ex) {
            ex.printStackTrace();
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
