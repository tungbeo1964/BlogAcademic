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
public class AccountDTO implements Serializable{
    private int id;
    private String username;
    private String password;
    private String fullname;
    private int role;
    private boolean delFlag;

    public AccountDTO() {
    }

    public AccountDTO(int id, String username, String password, String fullname, int role, boolean delFlag) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.role = role;
        this.delFlag = delFlag;
    }
    
    public AccountDTO(int id, String username, String password, String fullname) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
    }
    
    public AccountDTO(int id, String username) {
        this.id = id;
        this.username = username;
    }
    
    public AccountDTO(String username) {
        this.username = username;
    }
    
    public AccountDTO(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public boolean isDelFlag() {
        return delFlag;
    }

    public void setDelFlag(boolean delFlag) {
        this.delFlag = delFlag;
    }
    
    
}
