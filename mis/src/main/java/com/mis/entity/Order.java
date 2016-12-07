package com.mis.entity;

import java.util.Date;
import java.util.List;

/**
 * Created by admin on 2016/12/6.
 */
public class Order {
    private String id;
    private String userid;
    private String username;
    private String requirenum;
    private String requirename;
    private Date requiredate;
    private String requiretype;
    private int requirestatus;
    private String conname;
    private String conphone;
    private String company;
    private List<MessageType> mtype;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

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

    public String getRequirenum() {
        return requirenum;
    }

    public void setRequirenum(String requirenum) {
        this.requirenum = requirenum;
    }

    public String getRequirename() {
        return requirename;
    }

    public void setRequirename(String requirename) {
        this.requirename = requirename;
    }

    public Date getRequiredate() {
        return requiredate;
    }

    public void setRequiredate(Date requiredate) {
        this.requiredate = requiredate;
    }

    public String getRequiretype() {
        return requiretype;
    }

    public void setRequiretype(String requiretype) {
        this.requiretype = requiretype;
    }

    public int getRequirestatus() {
        return requirestatus;
    }

    public void setRequirestatus(int requirestatus) {
        this.requirestatus = requirestatus;
    }

    public String getConname() {
        return conname;
    }

    public void setConname(String conname) {
        this.conname = conname;
    }

    public String getConphone() {
        return conphone;
    }

    public void setConphone(String conphone) {
        this.conphone = conphone;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public List<MessageType> getMtype() {
        return mtype;
    }

    public void setMtype(List<MessageType> mtype) {
        this.mtype = mtype;
    }
}
