package com.mis.service;

import com.mis.entity.Role;

import java.util.List;

/**
 * Created by admin on 2016/9/21.
 */
public interface RoleServiceI {

    public void AddRole(Role role);

    public List ShowRole();

    public void StatusOn(String id);

    public void StatusOff(String id);

    public void EditAction(String rolenum,String actionnum);
}
