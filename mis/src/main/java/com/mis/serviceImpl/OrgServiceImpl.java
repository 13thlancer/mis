package com.mis.serviceImpl;

import com.mis.entity.Org;
import com.mis.mapper.OrgMapper;
import com.mis.mapper.RoleMapper;
import com.mis.service.OrgServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by Administrator on 2016/9/25.
 */
@Service("OrgService")
public class OrgServiceImpl implements OrgServiceI {

    @Autowired
    private OrgMapper orgMapper;

    @Override
    public void addOrg(Org org){
        UUID uuid = UUID.randomUUID();
        String uuidstr = uuid.toString();
        org.setId(uuidstr);
        orgMapper.addOrg(org);
    }

    @Override
    public void update(Org org) {
        orgMapper.updateOrg(org);
    }

    @Override
    public List showOrg(){
        return orgMapper.selectOrg();
    }

    @Override
    public List showOrgType() {
        return orgMapper.ShowOrgType();
    }

    @Override
    public Map<String,List> showOrgById(String id) {
        Map<String,List> map = new HashMap();
        List<Org> listOrg = orgMapper.showOrgByid(id);
        List listPorg = orgMapper.ShowOrgType();
        map.put("org",listOrg);
        map.put("porg",listPorg);
        return map;
    }
}
