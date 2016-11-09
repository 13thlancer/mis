package com.mis.serviceImpl;

import com.mis.entity.Manager;
import com.mis.entity.RoleUser;
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
    public void AddManager(Manager manager) {
        RoleUser ru = new RoleUser();
        Date date = new Date();
        String userid = UUID.randomUUID().toString();
        String id = UUID.randomUUID().toString();
        manager.setUserid(userid);
        manager.setRegdate(date);
        manager.setIsenabledMis("1");
        ru.setRolenum(manager.getRoletype());
        ru.setUserid(userid);
        ru.setId(id);
        managerMapper.addManager(manager);
        managerMapper.bindRole(ru);
    }

    @Override
    public List<Manager> ShowManager() {
        return managerMapper.selectManager();
    }


}
