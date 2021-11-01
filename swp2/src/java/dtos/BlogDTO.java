/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;

/**
 *
 * @author DELL
 */
public class BlogDTO implements Serializable{
    private int id;
    private String title;
    private String blogContent;
    private String createOn;
    private AccountDTO createBy;
    private String approveOn;
    private int approveBy;
    private int status;
    private int voteTotal;
    private SubjectDTO subjectId;

    public BlogDTO() {
    }

    public BlogDTO(int id, String title, String blogContent, String createOn, AccountDTO createBy, String approveOn, int approveBy, int status, int voteTotal, SubjectDTO subjectId) {
        this.id = id;
        this.title = title;
        this.blogContent = blogContent;
        this.createOn = createOn;
        this.createBy = createBy;
        this.approveOn = approveOn;
        this.approveBy = approveBy;
        this.status = status;
        this.voteTotal = voteTotal;
        this.subjectId = subjectId;
    }
    
        public BlogDTO(int id, String title, String createOn, AccountDTO createBy, String approveOn, int approveBy, int status, int voteTotal) {
        this.id = id;
        this.title = title;
        this.createOn = createOn;
        this.createBy = createBy;
        this.approveOn = approveOn;
        this.approveBy = approveBy;
        this.status = status;
        this.voteTotal = voteTotal;
    }
    
    public BlogDTO(int id, String title, String approveOn, int approveBy, int status, int voteTotal) {
        this.id = id;
        this.title = title;
        this.approveOn = approveOn;
        this.approveBy = approveBy;
        this.status = status;
        this.voteTotal = voteTotal;
    }
    
    public BlogDTO(int id, String title, String createOn, AccountDTO createBy, int status) {
        this.id = id;
        this.title = title;
        this.createOn = createOn;
        this.createBy = createBy;
        this.status = status;
    }
    
    public BlogDTO(int id, String title, String createOn, AccountDTO createBy) {
        this.id = id;
        this.title = title;
        this.createOn = createOn;
        this.createBy = createBy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBlogContent() {
        return blogContent;
    }

    public void setBlogContent(String blogContent) {
        this.blogContent = blogContent;
    }

    public String getCreateOn() {
        return createOn;
    }

    public void setCreateOn(String createOn) {
        this.createOn = createOn;
    }

    public AccountDTO getCreateBy() {
        return createBy;
    }

    public void setCreateBy(AccountDTO createBy) {
        this.createBy = createBy;
    }

    public String getApproveOn() {
        return approveOn;
    }

    public void setApproveOn(String approveOn) {
        this.approveOn = approveOn;
    }

    public int getApproveBy() {
        return approveBy;
    }

    public void setApproveBy(int approveBy) {
        this.approveBy = approveBy;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getVoteTotal() {
        return voteTotal;
    }

    public void setVoteTotal(int voteTotal) {
        this.voteTotal = voteTotal;
    }

    public SubjectDTO getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(SubjectDTO subjectId) {
        this.subjectId = subjectId;
    }
    
    
}
