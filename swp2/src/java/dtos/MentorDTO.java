/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author DELL
 */
public class MentorDTO {
    
    private int id;
    private String email;
    private String phone;
    private String createOn;
    private String createBy;

    public MentorDTO() {
    }

    public MentorDTO(int id, String email, String phone, String createOn, String createBy) {
        this.id = id;
        this.email = email;
        this.phone = phone;
        this.createOn = createOn;
        this.createBy = createBy;
    }
    
    public MentorDTO( String email, String phone, String createBy) {
        this.email = email;
        this.phone = phone;
        this.createBy = createBy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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
