package com.mis.mapper;

import com.mis.entity.User;
import com.mis.entity.UserLoin;

import java.util.List;

/**
 * Created by admin on 2016/11/4.
 */
public interface UserMapper {
    List<User> showPeople(UserLoin ul);
}
