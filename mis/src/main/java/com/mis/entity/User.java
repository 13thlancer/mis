package com.mis.entity;

import java.util.Date;

import java.util.List;

public class User {
    private String userid;

    private String username;

    private String account;

    private String password;

    private String telphone;

    private String wxid;

    private String yzjid;

    private String email;

    private Boolean isenabledMis;

    private Boolean isenabledWX;

    private Boolean isenabledYZJ;

    private Date regdate;

    private Integer usertype;

    private Boolean userlevel;

    private String peopleid;

    private List<People> people;

    private List<Org> org;

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

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
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

    public String getWxid() {
        return wxid;
    }

    public void setWxid(String wxid) {
        this.wxid = wxid;
    }

    public String getYzjid() {
        return yzjid;
    }

    public void setYzjid(String yzjid) {
        this.yzjid = yzjid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getIsenabledMis() {
        return isenabledMis;
    }

    public void setIsenabledMis(Boolean isenabledMis) {
        this.isenabledMis = isenabledMis;
    }

    public Boolean getIsenabledWX() {
        return isenabledWX;
    }

    public void setIsenabledWX(Boolean isenabledWX) {
        this.isenabledWX = isenabledWX;
    }

    public Boolean getIsenabledYZJ() {
        return isenabledYZJ;
    }

    public void setIsenabledYZJ(Boolean isenabledYZJ) {
        this.isenabledYZJ = isenabledYZJ;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public Integer getUsertype() {
        return usertype;
    }

    public void setUsertype(Integer usertype) {
        this.usertype = usertype;
    }

    public Boolean getUserlevel() {
        return userlevel;
    }

    public void setUserlevel(Boolean userlevel) {
        this.userlevel = userlevel;
    }

    public String getPeopleid() {
        return peopleid;
    }

    public void setPeopleid(String peopleid) {
        this.peopleid = peopleid;
    }

    public List<People> getPeople() {
        return people;
    }

    public void setPeople(List<People> people) {
        this.people = people;
    }

    public List<Org> getOrg() {
        return org;
    }

    public void setOrg(List<Org> org) {
        this.org = org;
    }
}