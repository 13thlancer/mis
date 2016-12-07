package com.mis.controller;

import com.mis.entity.Manager;
import com.mis.entity.User;
import com.mis.service.ManagerServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
    public String AddManager(Manager manager){
       String password  = manager.getPassword();
        String repassword = manager.getRepassword();
        if(password.equals(repassword)) {
            managerServiceI.addManager(manager);
            return "OK";
        }else{
            return "error!";
        }
    }

    @RequestMapping(value = "ShowManager",method= RequestMethod.POST)
    @ResponseBody
    public List<Manager> ShowManager(){
        return managerServiceI.showManager();
    }

    @ResponseBody
    @RequestMapping()
    public String editManager(Manager manager){
        managerServiceI.edit(manager);
        return "OK";
    }

    @ResponseBody
    @RequestMapping(value="StatusOn",method = RequestMethod.POST)
    public String statusOn(String id){
        managerServiceI.statusOn(id);
        return "OK";
    }

    @ResponseBody
    @RequestMapping(value="StatusOff",method = RequestMethod.POST)
    public String statusOff(String id){
        managerServiceI.statusOff(id);
        return "OK";
    }

    @ResponseBody
    @RequestMapping(value="Delete",method = RequestMethod.POST)
    public String delete(String id){
        managerServiceI.delete(id);
        return "OK";
    }
}







