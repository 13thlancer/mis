package com.mis.service;

import com.mis.entity.Action;

import java.util.List;

/**
 * Created by Administrator on 2016/11/6.
 */
public interface ActionServiceI {
    List<Action> getActionById(String id);

}
