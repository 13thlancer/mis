package com.mis.controller;

import com.mis.entity.Org;
import com.mis.entity.Role;
import com.mis.service.OrgServiceI;
import com.mis.service.RoleServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/9/25.
 */
@Controller
@RequestMapping("/OrgController")
public class OrgController {

    @Autowired
    private OrgServiceI orgServiceI;

    @RequestMapping(value="/AddOrg",method= RequestMethod.POST)
    @ResponseBody
    public void AddOrg(Org org) {
        orgServiceI.addOrg(org);
    }

    @RequestMapping(value="/UpdateOrg",method= RequestMethod.POST)
    @ResponseBody
    public void UpdateOrg(Org org) {
        orgServiceI.update(org);
    }

    @RequestMapping(value="/ShowOrg",method= RequestMethod.POST)
    @ResponseBody
    public List ShowOrg(){
        return orgServiceI.showOrg();
    }

    @RequestMapping(value="/ShowOrgType",method = RequestMethod.POST)
    @ResponseBody
    public List ShowOrgType(){
        return orgServiceI.showOrgType();
    }

    @RequestMapping(value = "/ShowOrgById",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,List> ShowOrgById(String id){
        return orgServiceI.showOrgById(id);
    }
}
