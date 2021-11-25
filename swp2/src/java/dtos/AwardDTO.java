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
public class AwardDTO implements Serializable{
    private int id;
    private String detail;
    private int contentId;
    private String createOn;
    private String createBy;

    public AwardDTO() {
    }

    public AwardDTO(int id, String detail, int contentId, String createOn, String createBy) {
        this.id = id;
        this.detail = detail;
        this.contentId = contentId;
        this.createOn = createOn;
        this.createBy = createBy;
    }
    
    public AwardDTO(String detail, int contentId, String createOn, String createBy) {
        this.detail = detail;
        this.contentId = contentId;
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
