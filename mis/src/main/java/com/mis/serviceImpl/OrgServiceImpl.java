package com.mis.serviceImpl;

import com.mis.entity.Org;
import com.mis.mapper.OrgMapper;
import com.mis.mapper.RoleMapper;
import com.mis.service.OrgServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2016/9/25.
 */
@Service("OrgService")
public class OrgServiceImpl implements OrgServiceI {

    @Autowired
    private OrgMapper orgMapper;

    @Override
    public void AddOrg(Org org){
        UUID uuid = UUID.randomUUID();
        String uuidstr = uuid.toString();
        org.setId(uuidstr);
        orgMapper.addOrg(org);
    }

    @Override
    public List ShowOrg(){
        return orgMapper.selectOrg();
    }

    @Override
    public List ShowOrgType() {
        return orgMapper.ShowOrgType();
    }
}
