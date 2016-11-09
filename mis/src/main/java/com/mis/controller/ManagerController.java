package com.mis.controller;

import com.mis.entity.Manager;
import com.mis.service.ManagerServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by admin on 2016/9/22.
 */
@Controller
@RequestMapping("/ManagerController")
public class ManagerController {

    @Autowired
    private ManagerServiceI managerServiceI;

    @RequestMapping(value = "AddManager",method= RequestMethod.POST)
    @ResponseBody
    public void AddManager(Manager manager){
        managerServiceI.AddManager(manager);
    }

    @RequestMapping(value = "ShowManager",method= RequestMethod.POST)
    @ResponseBody
    public List<Manager> ShowManager(){
        return managerServiceI.ShowManager();
    }
}







