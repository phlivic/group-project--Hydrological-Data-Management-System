package com.waterManageSystem.Bean;

import java.io.Serializable;


public class User {
    private static final long serialVersionUID = 1;
    // 用户编码
    private String userID;
    // 用户名
    private String userName;
    // 用户密码
    private String password;
    // 角色信息
    private String userRole;
    // 所属单位
    private String affiliation;
    // 备注
    private String note;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getAffiliation() {
        return affiliation;
    }

    public void setAffiliation(String affiliation) {
        this.affiliation = affiliation;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "User{" +
                "userID='" + userID + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", userRole=" + userRole +
                ", affiliation='" + affiliation + '\'' +
                ", note='" + note + '\'' +
                '}';
    }

}
