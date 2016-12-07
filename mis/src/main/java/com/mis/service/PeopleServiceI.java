package com.mis.service;

import com.mis.entity.People;
import com.mis.entity.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/9/25.
 */
public interface PeopleServiceI {


//    void AddPeople(User user);

    void addPeople(People people,User user);

    void updatePeople(People people);

    List<User> showPeople();

    List<User> showPeopleById(String id);

    List<User> showPeopleByOrgnum(String orgnum);

    void delete(String id);

    void statusOn(String id);

    void statusOff(String id);

}
