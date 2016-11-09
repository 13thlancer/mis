package com.mis.entity;

import java.util.Date;

/**
 * Created by admin on 2016/9/23.
 */
public class Manager {
    private String userid;

    private String username;

    private String sysaccount;

    private String password;

    private String telphone;

    private String email;

    private String isenabledMis;

    private Date regdate;

    private String usertype;

    private String roletype;

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSysaccount() {
        return sysaccount;
    }

    public void setSysaccount(String sysaccount) {
        this.sysaccount = sysaccount;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIsenabledMis() {
        return isenabledMis;
    }

    public void setIsenabledMis(String isenabledMis) {
        this.isenabledMis = isenabledMis;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getRoletype() {
        return roletype;
    }

    public void setRoletype(String roletype) {
        this.roletype = roletype;
    }
}
