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
public class CommentDTO implements Serializable{
    private int id;
    private String detail;
    private int vote;
    private int contentId;
    private String createOn;
    private String createBy;

    public CommentDTO() {
    }

    public CommentDTO(int id, String detail, int vote, int contentId, String createOn, String createBy) {
        this.id = id;
        this.detail = detail;
        this.vote = vote;
        this.contentId = contentId;
        this.createOn = createOn;
        this.createBy = createBy;
    }
    
    public CommentDTO(String detail, int vote, String createOn, String createBy) {
        this.detail = detail;
        this.vote = vote;
        this.createOn = createOn;
        this.createBy = createBy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getVote() {
        return vote;
    }

    public void setVote(int vote) {
        this.vote = vote;
    }

    public int getContentId() {
        return contentId;
    }

    public void setContentId(int contentId) {
        this.contentId = contentId;
    }

    public String getCreateOn() {
        return createOn;
    }

    public void setCreateOn(String createOn) {
        this.createOn = createOn;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }
    
    
}
