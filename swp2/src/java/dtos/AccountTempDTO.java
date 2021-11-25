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
public class AccountTempDTO implements Serializable{
    private String username;
    private String fullname;
    private String email;
    private String phone;
    private String createBy;
    private boolean delFlag;

    public AccountTempDTO() {
    }

    public AccountTempDTO(String username, String fullname, String email, String phone, String createBy, boolean delFlag) {
        this.username = username;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.createBy = createBy;
        this.delFlag = delFlag;
    }
    
    public AccountTempDTO(String username, String fullname, String email, String phone, boolean delFlag) {
        this.username = username;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.createBy = createBy;
        this.delFlag = delFlag;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public boolean isDelFlag() {
        return delFlag;
    }

    public void setDelFlag(boolean delFlag) {
        this.delFlag = delFlag;
    }

    
}
