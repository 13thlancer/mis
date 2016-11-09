package com.mis.serviceImpl;

import com.mis.entity.People;
import com.mis.entity.User;
import com.mis.mapper.ManagerMapper;
import com.mis.mapper.PeopleMapper;
import com.mis.service.PeopleServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

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
    public void AddPeople(People people, User user) {
        peopleMapper.addPeople(people);
        managerMapper.addUser(user);
    }

    @Override
    public List<User> ShowPeople() {
        return peopleMapper.showPeople();
    }
}
