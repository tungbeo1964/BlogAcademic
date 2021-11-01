/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.io.Serializable;

/**
 *
 * @author TuanTDA
 */
public class TagDTO implements Serializable {

    private String tagId;
    private String tagName;

    public TagDTO() {
    }

    public TagDTO(String tagId, String tagName) {
        this.tagId = tagId;
        this.tagName = tagName;
    }

    public TagDTO(String tagName) {
        this.tagName = tagName;
    }

    public String getTagId() {
        return tagId;
    }

    public void setTagId(String tagId) {
        this.tagId = tagId;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

}
