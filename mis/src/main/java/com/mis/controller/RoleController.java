package com.mis.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mis.entity.Role;
import com.mis.service.RoleServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2016/9/21.
 */
@Controller
@RequestMapping("/RoleController")
public class RoleController {

    @Autowired
    private RoleServiceI roleServiceI;

    @RequestMapping(value="/AddRole",method= RequestMethod.POST,produces="application/json;charset=UTF-8")
    @ResponseBody
    public String AddRole(Role role) {
        ObjectMapper mapper = new ObjectMapper();
        Map map = new HashMap();
        String content = null;
        roleServiceI.AddRole(role);
        map.put("info","success");
        try {
            content = mapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return content;
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
