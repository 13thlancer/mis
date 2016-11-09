package com.mis.mapper;

import com.mis.entity.Role;
import java.util.List;

/**
 * Created by admin on 2016/9/21.
 */
public interface RoleMapper {

    int insert(Role record);

    List<Role> select();

    int statusoff(String id);

    int statuson(String id);

    int setAction(List list);

}
