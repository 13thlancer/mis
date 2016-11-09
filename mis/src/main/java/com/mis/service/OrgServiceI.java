package com.mis.service;

import com.mis.entity.Org;

import java.util.List;

/**
 * Created by Administrator on 2016/9/25.
 */
public interface OrgServiceI {

    public void AddOrg(Org org);

    public List ShowOrg();
}
