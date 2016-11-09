package com.mis.service;

import com.mis.entity.Manager;
import com.mis.entity.User;

import java.util.List;

/**
 * Created by admin on 2016/9/23.
 */
public interface ManagerServiceI {

    void AddManager(Manager manager);

    List<Manager> ShowManager();
}
