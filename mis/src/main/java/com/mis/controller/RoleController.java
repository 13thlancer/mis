package com.mis.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mis.entity.Org;
import com.mis.entity.Role;
import com.mis.service.OrgServiceI;
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

    @Autowired
    private OrgServiceI orgServiceI;

    @RequestMapping(value="/AddRole",method= RequestMethod.POST,produces="application/json;charset=UTF-8")
    @ResponseBody
    public String AddRole(Role role) {
        ObjectMapper mapper = new ObjectMapper();
        Map map = new HashMap();
        String content = null;
        roleServiceI.addRole(role);
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
    public Map<String,List> ShowRole(){
        List roleList = roleServiceI.showRole();
        List orgList = orgServiceI.showOrg();
        Map<String,List> map = new HashMap();
        map.put("role",roleList);
        map.put("org",orgList);
        return map;
    }

    @ResponseBody
    @RequestMapping(value="/ShowAllRole",method = RequestMethod.POST)
    public List<Org> ShowAllRole(){
        return roleServiceI.showAllRole();
    }

    @RequestMapping(value="/StatusOn",method= RequestMethod.POST)
    @ResponseBody
    public String StatusOn(String id) {
        roleServiceI.statusOn(id);
        return "OK";
    }

    @RequestMapping(value="/StatusOff", method = RequestMethod.POST)
    @ResponseBody
    public String StatusOff(String id){
        roleServiceI.statusOff(id);
        return "OK";
    }

    @RequestMapping(value="/EditAction", method = RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String EditAction(String rolenum,String actionnum){
        roleServiceI.editAction(rolenum,actionnum);
        return "OK";
    }

}
