package com.mis.service;

import com.mis.entity.Role;

import java.util.List;

/**
 * Created by admin on 2016/9/21.
 */
public interface RoleServiceI {

    public void addRole(Role role);

    public List showRole();

    public List showAllRole();

    public void statusOn(String id);

    public void statusOff(String id);

    public void editAction(String rolenum,String actionnum);
}
