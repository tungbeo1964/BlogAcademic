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
public class ImageDTO implements Serializable{
    private int id;
    private String url;
    private int contentId;

    public ImageDTO() {
    }

    public ImageDTO(int id, String url, int contentId) {
        this.id = id;
        this.url = url;
        this.contentId = contentId;
    }
    
    public ImageDTO(String url) {
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getContentId() {
        return contentId;
    }

    public void setContentId(int contentId) {
        this.contentId = contentId;
    }
    
    
}
