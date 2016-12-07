package com.mis.serviceImpl;

import com.mis.entity.RoleAction;
import com.mis.mapper.RoleMapper;
import com.mis.entity.Role;
import com.mis.service.RoleServiceI;
import com.sun.xml.internal.fastinfoset.util.StringArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by admin on 2016/9/21.
 */
@Service("RoleService")
public class RoleServiceImpl implements RoleServiceI {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public void addRole(Role role) {
        UUID uuid = UUID.randomUUID();
        Date date = new Date();
        String uuidstr = uuid.toString();
        role.setId(uuidstr);
        role.setCreatedate(date);
        role.setStatus(1);
        roleMapper.insert(role);
    }

    @Override
    public List showRole() {
        return roleMapper.select();
    }

    @Override
    public List showAllRole() {
        return roleMapper.select();
    }

    @Override
    public void statusOff(String id){
        roleMapper.statusoff(id);
    }


    @Override
    public void statusOn(String id){
        roleMapper.statuson(id);
    }

    @Override
    public void editAction(String rolenum, String actionnum) {
        String[] strArray = null;
        strArray = actionnum.split(",");
        List<RoleAction> list = new ArrayList<RoleAction>();
        for(int i = 0;i<strArray.length;i++){
//            System.out.print(strArray[i]);
            RoleAction ra = new RoleAction();
            UUID uuid = UUID.randomUUID();
            String str = uuid.toString();
            ra.setId(str);
            ra.setActionnum(strArray[i]);
            ra.setRolenum(rolenum);
            list.add(ra);
        }
        roleMapper.setAction(list);
    }

}
