package com.mis.controller;

import com.mis.entity.Role;
import com.mis.service.RoleServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by admin on 2016/9/21.
 */
@Controller
@RequestMapping("/RoleController")
public class RoleController {

    @Autowired
    private RoleServiceI roleServiceI;

    @RequestMapping(value="/AddRole",method= RequestMethod.POST)
    @ResponseBody
    public void AddRole(Role role) {
        roleServiceI.AddRole(role);
    }

    @RequestMapping(value="/ShowRole",method= RequestMethod.POST)
    @ResponseBody
    public List ShowRole(){
        return roleServiceI.ShowRole();
    }

    @RequestMapping(value="/StatusOn",method= RequestMethod.POST)
    @ResponseBody
    public String StatusOn(String id) {
        roleServiceI.StatusOn(id);
        return "OK";
    }

    @RequestMapping(value="/StatusOff", method = RequestMethod.POST)
    @ResponseBody
    public String StatusOff(String id){
        roleServiceI.StatusOff(id);
        return "OK";
    }

    @RequestMapping(value="/EditAction", method = RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String EditAction(String rolenum,String actionnum){
        roleServiceI.EditAction(rolenum,actionnum);
        return "OK";
    }

}
