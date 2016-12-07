package com.mis.serviceImpl;

import com.mis.entity.People;
import com.mis.entity.User;
import com.mis.mapper.ManagerMapper;
import com.mis.mapper.PeopleMapper;
import com.mis.service.PeopleServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by Administrator on 2016/9/25.
 */
@Service("PeopleService")
public class PeopleServiceImpl implements PeopleServiceI {

    @Autowired
    private PeopleMapper peopleMapper;

    @Autowired
    private ManagerMapper managerMapper;

//    @Override
//    public void AddPeople(User user) {
//        Date date = new Date();
//        String userid = UUID.randomUUID().toString();
//        String peopleid = UUID.randomUUID().toString();
//        user.setUserid(userid);
//        user.setPeopleid(peopleid);
//        user.setRegdate(date);
//        peopleMapper.addPeople(user);
//    }
//
//    @Override
//    public void AddPeople(People people) {
//        peopleMapper.insertPeople(people);
//    }

    @Override
    public void addPeople(People people, User user) {
        peopleMapper.addPeople(people);
        managerMapper.addUser(user);
    }

    @Override
    public void updatePeople(People people) {
        peopleMapper.updatePeople(people);
    }

    @Override
    public List<User> showPeople() {
        return peopleMapper.showPeople();
    }

    @Override
    public List<User> showPeopleById(String id) {

        return peopleMapper.showPeopleById(id);
    }

    @Override
    public List<User> showPeopleByOrgnum(String orgnum) {
        return peopleMapper.showPeopleByOrgnum(orgnum);
    }

    @Override
    public void delete(String id) {
        peopleMapper.deletePeople(id);
        peopleMapper.deleteUser(id);
    }

    @Override
    public void statusOn(String id) {
        peopleMapper.statuson(id);
    }

    @Override
    public void statusOff(String id) {
        peopleMapper.statusoff(id);
    }
}
