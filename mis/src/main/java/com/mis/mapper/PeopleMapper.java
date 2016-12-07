package com.mis.mapper;

import com.mis.entity.People;
import com.mis.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2016/9/25.
 */
public interface PeopleMapper {

    int addPeople(People people);

    int updatePeople(People people);

    List<User> showPeople();

    List<User> showPeopleById(String id);

    List<User> showPeopleByOrgnum(String orgnum);

    int insertPeople(People people);

    void deleteUser(String id);

    void deletePeople(String id);

    int statusoff(String id);

    int statuson(String id);

}
