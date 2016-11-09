package com.mis.controller;

import com.mis.Utils.UploadUtil;
import com.mis.entity.People;
import com.mis.entity.Picture;
import com.mis.entity.User;
import com.mis.service.PeopleServiceI;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2016/9/25.
 */
@Controller
@RequestMapping("/PeopleController")
public class PeopleController {

    private static final Logger log = LoggerFactory.getLogger(PeopleController.class);

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpServletResponse response;

    @Autowired
    private PeopleServiceI peopleServiceI;

    @RequestMapping(value = "ShowPeople",method= RequestMethod.POST)
    @ResponseBody
    public List ShowPeople(){
        return peopleServiceI.ShowPeople();
    }

    @ResponseBody
    @RequestMapping(value="upload",method=RequestMethod.POST)
    public void uploadImage(@RequestParam MultipartFile[] upload) throws IOException {
        log.info("上传图片");
        Picture pic = new Picture();
        List<String> paths = new ArrayList<String>();
        String dir = UploadUtil.getFolder();
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        String picdir = request.getSession().getServletContext().getRealPath("") + "\\img";
        System.out.println(picdir);
        for(MultipartFile myfile : upload){
            if(myfile.isEmpty()){
                System.out.print("文件未上传");
            }else{
                System.out.println("文件长度: " + myfile.getSize());
                System.out.println("文件类型: " + myfile.getContentType());
                System.out.println("文件名称: " + myfile.getName());
                System.out.println("文件原名: " + myfile.getOriginalFilename());
                System.out.println("========================================");
                //上传文件 返回路径
                String picpath = UploadUtil.writeFile(myfile.getOriginalFilename(), dir, myfile.getInputStream(),picdir);
                paths.add(picpath);
                response.getWriter().write(basePath+picpath);
                System.out.println(basePath);
            }
        }
        pic.setPaths(paths);
    }

    @ResponseBody
    @RequestMapping(value="AddPeople",method=RequestMethod.POST)
    public void addPeople(HttpServletRequest request,@RequestParam MultipartFile[] Pic) throws IOException {

        String username = request.getParameter("username");
        String orgname = request.getParameter("orgname");
        String telphone = request.getParameter("telphone");
        String email = request.getParameter("email");

        String userorigo = request.getParameter("userorigo");
        String userlevel = request.getParameter("userlevel");
        String Intro = request.getParameter("Intro");
        Date date = new Date();
        String picpath = null;
        People people = new People();
        User user = new User();

        log.info("上传图片");
        Picture pic = new Picture();
        List<String> paths = new ArrayList<String>();
        String dir = UploadUtil.getFolder();
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        String picdir = request.getSession().getServletContext().getRealPath("") + "\\img";
        System.out.println(picdir);
        for(MultipartFile myfile : Pic){
            if(myfile.isEmpty()){
                System.out.print("文件未上传");
            }else{
                picpath = UploadUtil.writeFile(myfile.getOriginalFilename(), dir, myfile.getInputStream(),picdir);
            }
        }
        String pp =basePath+picpath;
        String peopleid = UUID.randomUUID().toString();
        String id = UUID.randomUUID().toString();
        user.setUserid(id);
        user.setPeopleid(peopleid);
        user.setEmail(email);
        user.setTelphone(telphone);


        people.setPicpath(pp);
        people.setId(peopleid);
        people.setName(username);
        people.setIntroduce(Intro);
        people.setPosition(userlevel);
        people.setOrgid(orgname);
        people.setNativeplace(userorigo);
        people.setCreatetime(date);

        peopleServiceI.AddPeople(people,user);
    }
}
