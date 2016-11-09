package com.mis.serviceImpl;

import com.mis.entity.Action;
import com.mis.mapper.ActionMapper;
import com.mis.service.ActionServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/11/6.
 */
@Service("ActionService")
public class ActionServiceImpl implements ActionServiceI {

    @Autowired
    private ActionMapper actionMapper;

    @Override
    public List<Action> getActionById(String userid) {
        return actionMapper.getActionById(userid);
    }
}
