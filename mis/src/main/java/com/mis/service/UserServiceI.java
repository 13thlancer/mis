package com.mis.service;

import com.mis.entity.User;
import com.mis.entity.UserLoin;

import java.util.List;

/**
 * Created by admin on 2016/9/22.
 */
public interface UserServiceI {
    List<User> login(UserLoin ul);
}
