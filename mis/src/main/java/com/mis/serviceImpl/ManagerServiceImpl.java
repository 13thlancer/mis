package com.mis.serviceImpl;

import com.mis.entity.Manager;
import com.mis.entity.RoleUser;
import com.mis.entity.User;
import com.mis.mapper.ManagerMapper;
import com.mis.mapper.RoleMapper;
import com.mis.service.ManagerServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by admin on 2016/9/23.
 */
@Service("ManagerService")
public class ManagerServiceImpl implements ManagerServiceI {

    @Autowired
    private ManagerMapper managerMapper;

    @Override
    public void addManager(Manager manager) {
        RoleUser ru = new RoleUser();
        Date date = new Date();
        String id = UUID.randomUUID().toString();

        manager.setRegdate(date);
        manager.setIsenabledMis("1");
        ru.setRolenum(String.valueOf(manager.getRoletype()));
        ru.setUserid(manager.getId());
        ru.setId(id);
        managerMapper.addManager(manager);
        managerMapper.bindRole(ru);
    }

    @Override
    public void edit(Manager manager) {
        managerMapper.edit(manager);
    }

    @Override
    public List<Manager> showManager() {
        return managerMapper.selectManager();
    }

    @Override
    public void statusOn(String id) {
        managerMapper.statusOn(id);
    }

    @Override
    public void delete(String id) {
        managerMapper.delete(id);
    }

    @Override
    public void statusOff(String id) {
        managerMapper.statusOff(id);
    }


}
