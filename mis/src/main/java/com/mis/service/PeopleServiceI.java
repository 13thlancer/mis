package com.mis.service;

import com.mis.entity.People;
import com.mis.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2016/9/25.
 */
public interface PeopleServiceI {


//    void AddPeople(User user);

    void AddPeople(People people,User user);

    List<User> ShowPeople();
}
