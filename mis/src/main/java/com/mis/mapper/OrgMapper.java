package com.mis.mapper;

import com.mis.entity.Manager;
import com.mis.entity.Org;

import java.util.List;

/**
 * Created by Administrator on 2016/9/25.
 */
public interface OrgMapper {
    int addOrg(Org org);

    List<Org> selectOrg();

}
