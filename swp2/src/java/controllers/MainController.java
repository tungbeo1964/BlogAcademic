/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {

    private final String LOGIN_PAGE = "GetListAllBlogStudentServlet";
    private final String LOGIN_SERVLET = "LoginSerlet";
    private final String CREATE_NEW_STUDENT_SERVLET = "CreateNewStudentServlet";
    private final String VIEW_STUDENT_PROFILE_SERVLET = "ViewStudentProfileServlet";
    private final String UPDATE_STUDENT_PROFILE_SERVLET = "UpdateStudentProfileServlet";
    private final String VIEW_MENTOR_PROFILE_SERVLET = "ViewMentorProfileServlet";
    private final String UPDATE_MENTOR_PROFILE_SERVLET = "UpdateMentorProfileServlet";
    private final String CREATE_MENTOR_SERVLET = "CreateMentorServlet";
    private final String CREATE_TAG_SERVLET = "CreateTagServlet";
    private final String CREATE_SUBJECT_SERVLET = "CreateSubjectServlet";
    private final String BAN_MENTOR_SERVLET = "BanMentorServlet";
    private final String BAN_STUDENT_SERVLET = "BanStudentServlet";
    private final String VIEW_BLOG_DETAIL_STUDENT_SERVLET = "ViewBlogDetailStudentServlet";
    private final String VIEW_BLOG_DETAIL_MENTOR_SERVLET = "ViewBlogDetailMentorServlet";
    private final String POST_COMMENT_SERVLET = "PostCommentServlet";
    private final String POST_COMMENT_MENTOR_SERVLET = "PostCommentMentorServlet";
    private final String SEARCH_BY_TITLE = "SearchBlogByTitleServlet";
    private final String SEARCH_BY_SUBJECT = "SearchBlogBySubject";
    private final String SEARCH_BY_TAG = "SearchBlogByTagServlet";
    private final String CREATE_BLOG_SERVLET = "CreateBlogServlet";
    private final String CREATE_BLOG_MENTOR_SERVLET = "CreateBlogMentorServlet";
    private final String SET_STATUS_BLOG = "SetBlogStatusServlet";
    private final String VIEW_EDIT_BLOG_STUDENT_SERVLET = "ViewEditBlogStudentServlet";
    private final String VIEW_EDIT_BLOG_MENTOR_SERVLET = "ViewEditBlogMentorServlet";
    private final String SET_AWARD_SERVLET = "SetAwardServlet";
    private final String DELETE_IMAGE_SERVLET = "DeleteImageServlet";
    private final String DELETE_VIDEO_SERVLET = "DeleteVideoServlet";
    
    private final String CHECK_ACCOUNT_SERVLET = "CheckAccountServlet";
    private final String UPDATE_PASSWORD_SERVLET = "UpdatePasswordServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String button = request.getParameter("btnAction");
        String url = LOGIN_PAGE;
        try {
            if (button == null) {
            } else if (button.equals("Login")) {
                url = LOGIN_SERVLET;
            } else if (button.equals("Sign Up")) {
                url = CREATE_NEW_STUDENT_SERVLET;
            } else if (button.equals("View my profile")) {
                url = VIEW_STUDENT_PROFILE_SERVLET;
            } else if (button.equals("Update Profile")) {
                url = UPDATE_STUDENT_PROFILE_SERVLET;
            } else if (button.equals("View your profile")) {
                url = VIEW_MENTOR_PROFILE_SERVLET;
            } else if (button.equals("Update Your Profile")) {
                url = UPDATE_MENTOR_PROFILE_SERVLET;
            } else if (button.equals("Create Mentor")) {
                url = CREATE_MENTOR_SERVLET;
            } else if (button.equals("Create Subject")) {
                url = CREATE_SUBJECT_SERVLET;
            } else if (button.equals("Create Tag")) {
                url = CREATE_TAG_SERVLET;
            } else if (button.equals("Ban Mentor")) {
                url = BAN_MENTOR_SERVLET;
            } else if (button.equals("Ban Student")) {
                url = BAN_STUDENT_SERVLET;
            } else if (button.equals("View Detail")) {
                url = VIEW_BLOG_DETAIL_STUDENT_SERVLET;
            } else if (button.equals("View Blog Detail Mentor")) {
                url = VIEW_BLOG_DETAIL_MENTOR_SERVLET;
            } else if (button.equals("Post Comment")) {
                url = POST_COMMENT_SERVLET;
            } else if (button.equals("Post Mentor Comment")) {
                url = POST_COMMENT_MENTOR_SERVLET;
            } else if (button.equals("Search")) {
                url = SEARCH_BY_TITLE;
            } else if (button.equals("sear")) {
                url = SEARCH_BY_TAG;
            } else if (button.equals("searSub")) {
                url = SEARCH_BY_SUBJECT;
            } else if (button.equals("Create blog")) {
                url = CREATE_BLOG_SERVLET;
            } else if (button.equals("Create blog mentor")) {
                url = CREATE_BLOG_MENTOR_SERVLET;
            } else if (button.equals("Change Status")) {
                url = SET_STATUS_BLOG;
            } else if (button.equals("View This Blog to Edit")) {
                url = VIEW_EDIT_BLOG_STUDENT_SERVLET;
            } else if (button.equals("Set Award")) {
                url = SET_AWARD_SERVLET;
            } else if (button.equals("View Edit Blog")) {
                url = VIEW_EDIT_BLOG_MENTOR_SERVLET;
            } else if (button.equals("Delete Image")) {
                url = DELETE_IMAGE_SERVLET;
            } else if (button.equals("Delete Video")) {
                url = DELETE_VIDEO_SERVLET;
            } else if(button.equals("Find Account")){
                url = CHECK_ACCOUNT_SERVLET;
            } else if(button.equals("Update Password")){
                url = UPDATE_PASSWORD_SERVLET;
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
