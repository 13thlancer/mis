package com.mis.mapper;

import com.mis.entity.Manager;
import com.mis.entity.RoleUser;
import com.mis.entity.User;

import java.util.List;

public interface ManagerMapper {

    int addManager(Manager manager);

    int addUser(User user);

    int bindRole(RoleUser ru);

    List<Manager> selectManager();

    void edit(Manager manager);

    void statusOn(String id);

    void statusOff(String id);

    void delete(String id);
}