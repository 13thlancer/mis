package com.mis.controller;

import com.mis.entity.Lawyer;
import com.mis.service.LawyerServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by admin on 2016/11/1.
 */
@Controller
@RequestMapping("/LawyerController")
public class LawyerController {

    @Autowired
    private LawyerServiceI lawyerServiceI;

    @ResponseBody
    @RequestMapping(value="showLawyer", method= RequestMethod.POST)
    public List<Lawyer> showLawyer(String mtype){
        return lawyerServiceI.showLawyer(mtype);
    }

    @ResponseBody
    @RequestMapping(value="AddLawyer",method = RequestMethod.POST)
    public void addLawyer(HttpServletRequest request,@RequestParam MultipartFile[] Pic){
        Lawyer lawyer = new Lawyer();
        Date date = new Date();
        String id = UUID.randomUUID().toString();
        lawyer.setId(id);
        lawyer.setName(request.getParameter("name"));
        lawyer.setType(Integer.valueOf(request.getParameter("Type")));
        lawyer.setPhone(request.getParameter("phone"));
        lawyer.setIntroduce(request.getParameter("introduce"));
        lawyer.setCreatetime(date);
        lawyerServiceI.addLawyer(lawyer);
    }

}
