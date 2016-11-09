package com.mis.serviceImpl;

import com.mis.entity.User;
import com.mis.entity.UserLoin;
import com.mis.mapper.UserMapper;
import com.mis.service.UserServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2016/9/22.
 */
@Service("UserService")
public class UserServiceImpl implements UserServiceI{

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> login(UserLoin ul) {
        return userMapper.showPeople(ul);
    }
}
