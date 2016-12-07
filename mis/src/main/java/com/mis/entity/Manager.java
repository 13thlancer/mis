package com.mis.entity;

import java.util.Date;

/**
 * Created by admin on 2016/9/23.
 */
public class Manager {
    private String id;

    private String employeename;

    private String account;

    private String password;

    private String repassword;

    private String isenabledMis;

    private Date regdate;

    private String roletype;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
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

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
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

    public String getRoletype() {
        return roletype;
    }

    public void setRoletype(String roletype) {
        this.roletype = roletype;
    }
}
