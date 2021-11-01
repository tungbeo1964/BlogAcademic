/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AccountDAO;
import daos.BlogDAO;
import daos.ImageDAO;
import daos.TagEntryDAO;
import daos.VideoDAO;
import errorObj.CreateNewErrorObj;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import object.FileObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author TuanTDA
 */
@WebServlet(name = "EditBlogMentorServlet", urlPatterns = {"/EditBlogMentorServlet"})
public class EditBlogMentorServlet extends HttpServlet {

    private final String SUCCESS = "ViewHistoryBlogMentorServlet";
    private final String FAIL = "editblogmentor.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Default page when fail
        String url = FAIL;

        try {
            // Get account id
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("USER");
            AccountDAO accountDAO = new AccountDAO();
            int user = accountDAO.getIdByUsername(username);

            // Process all parameters
            boolean isMP = ServletFileUpload.isMultipartContent(request);
            if (isMP) {
                FileItemFactory fac = new DiskFileItemFactory();
                ServletFileUpload upl = new ServletFileUpload(fac);
                List items = null;
                try {
                    items = upl.parseRequest(request);
                } catch (FileUploadException e) {
                }
                Iterator iter = items.iterator();
                Hashtable params = new Hashtable();
                String fileName = null;

                // Prepare lists to save records
                List<String> images = new ArrayList<>();
                List<String> videos = new ArrayList<>();
                List<String> tags = new ArrayList<>();
                Map<FileObject, Boolean> fileList = new HashMap<>();

                // Get input parameters
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();
                    if (item.isFormField()) {
                        // Get all tag parameters
                        if (item.getFieldName().equals("tags")) {
                            tags.add(item.getString());
                        }
                        // Except files, get all parameter and put them in params
                        params.put(item.getFieldName(), item.getString());
                    } else {
                        // Get files and put it in Map
                        try {
                            String itemName = item.getName();
                            fileName = itemName.substring(itemName.lastIndexOf("\\") + 1);
                            if (fileName != null) {
                                String rp = "";
                                FileObject f = new FileObject();
                                File file;
                                // Check extension if it is video
                                if (checkIfVideo(fileName)) {
                                    String newName = changeFileName(fileName, true, user);
                                    rp = getServletContext().getRealPath("/") + "Storage\\Videos\\" + newName;
                                    Thread.sleep(1000);
                                    file = new File(rp);
                                    f.setFile(file);
                                    f.setFileItem(item);
                                    f.setItemName(rp);
                                    fileList.put(f, true);
                                    videos.add(newName);
                                    System.out.println(newName);
                                } else if (checkIfImage(fileName)) { // Check extension if it is image
                                    String newName = changeFileName(fileName, true, user);
                                    rp = getServletContext().getRealPath("/") + "Storage\\Images\\" + newName;
                                    Thread.sleep(1000);
                                    file = new File(rp);
                                    f.setFile(file);
                                    f.setFileItem(item);
                                    f.setItemName(rp);
                                    fileList.put(f, true);
                                    images.add(newName);
                                    System.out.println(newName);
                                }
                            }
                        } catch (IOException | InterruptedException e) {
                        }
                    }
                }

                // Convert input parameters into data types
                String id = (String) params.get("txtBlogId");
                String title = (String) params.get("txtTitle");
                String detail = (String) params.get("txtDetail");
                String subjectId = (String) params.get("subjectId");

                try {
                    int blogId = Integer.parseInt(id);

                    // Validate input, if it's valid then start storing data
                    boolean valid = true;
                    CreateNewErrorObj errorList = new CreateNewErrorObj();
                    if (title.isEmpty()) {
                        valid = false;
                        errorList.setIdLengthError("Title is empty!!!");
                    }
                    if (detail.isEmpty()) {
                        valid = false;
                        errorList.setFullnameLengthError("Detail is empty!!!");
                    }
                    if (valid) {

                        // Save files on server at [This project]/build/web/Storage
                        Set<FileObject> keySet = fileList.keySet();
                        for (FileObject key : keySet) {
                            key.getFileItem().write(key.getFile());
                        }

                        // Create blog and get its id
                        BlogDAO blogDAO = new BlogDAO();
                        blogDAO.updateBlog(blogId, title, detail, user, subjectId);

                        // By using blog id, mapping images
                        ImageDAO imageDAO = new ImageDAO();
                        imageDAO.deleteBlogImages(blogId);
                        for (int i = 0; i < images.size(); i++) {
                            imageDAO.createImage(images.get(i), blogId);
                        }

                        // By using blog id, mapping videos
                        VideoDAO videoDAO = new VideoDAO();
                        videoDAO.deleteBlogVideos(blogId);
                        for (int i = 0; i < videos.size(); i++) {
                            videoDAO.createVideo(videos.get(i), blogId);
                        }

                        // By using blog id, mapping tags
                        TagEntryDAO tagEntryDAO = new TagEntryDAO();
                        tagEntryDAO.deleteBlogTags(blogId);
                        for (int i = 0; i < tags.size(); i++) {
                            tagEntryDAO.createTagEntry(blogId, tags.get(i));
                        }

                        url = SUCCESS;

                        // Add blogId to view
                        session.setAttribute("BLOGID", blogId);
                    } else {
                        request.setAttribute("CREATEERROR", errorList);
                        System.out.println("Failed");
                    }
                } catch (Exception e) {
                }
            }
        } catch (SQLException | NamingException e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
            out.close();
        }
    }

    // Check if file is image
    private boolean checkIfImage(String fileName) throws IOException {
        File file = new File(fileName);
        String mimetype = Files.probeContentType(file.toPath());
        return mimetype != null && mimetype.split("/")[0].equals("image");
    }

    // Check if file is video
    private boolean checkIfVideo(String fileName) throws IOException {
        File file = new File(fileName);
        String mimetype = Files.probeContentType(file.toPath());
        return mimetype != null && mimetype.split("/")[0].equals("video");
    }

    // Change file name in order to prevent duplicate
    private String changeFileName(String fileName, boolean isImage, int id) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String currentDatetime = formatter.format(date);
        int dot = fileName.lastIndexOf('.');
        String base;
        if (isImage) {
            base = "img" + id + currentDatetime;
        } else {
            base = "vid" + id + currentDatetime;
        }
        String extension = (dot == -1) ? "" : fileName.substring(dot + 1);
        String result = base + "." + extension.toLowerCase();
        return result;
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
