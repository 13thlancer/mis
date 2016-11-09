package com.mis.mapper;

import com.mis.entity.People;
import com.mis.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2016/9/25.
 */
public interface PeopleMapper {

    int addPeople(People people);

    List<User> showPeople();

    int insertPeople(People people);
}
