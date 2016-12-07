package com.mis.service;

import com.mis.entity.Org;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/9/25.
 */
public interface OrgServiceI {

    public void addOrg(Org org);

    public void update(Org org);

    public List showOrg();

    public List showOrgType();

    public Map<String,List> showOrgById(String id);
}
