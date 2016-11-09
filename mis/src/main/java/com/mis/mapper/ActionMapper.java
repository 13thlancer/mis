package com.mis.mapper;

import com.mis.entity.Action;

import java.util.List;

/**
 * Created by Administrator on 2016/11/6.
 */
public interface ActionMapper {

    List<Action> getActionById(String userid);


}
