package com.mis.entity;

/**
 * Created by Administrator on 2016/11/6.
 */
public class Action {

    private String userid;

    private String actionname;

    private String rolenum;

    private String actionnum;

    public String getActionname() {
        return actionname;
    }

    public void setActionname(String actionname) {
        this.actionname = actionname;
    }

    public String getActionnum() {
        return actionnum;
    }

    public void setActionnum(String actionnum) {
        this.actionnum = actionnum;
    }

    public String getRolenum() {
        return rolenum;
    }

    public void setRolenum(String rolenum) {
        this.rolenum = rolenum;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }
}
