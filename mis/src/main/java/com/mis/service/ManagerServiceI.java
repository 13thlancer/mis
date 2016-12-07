package com.mis.service;

import com.mis.entity.Manager;
import com.mis.entity.User;

import java.util.List;

/**
 * Created by admin on 2016/9/23.
 */
public interface ManagerServiceI {

    void addManager(Manager manager);

    void edit(Manager manager);

    List<Manager> showManager();

    void statusOn(String id);

    void delete(String id);

    void statusOff(String id);
}
