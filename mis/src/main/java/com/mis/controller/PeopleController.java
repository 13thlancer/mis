package com.mis.controller;

import com.mis.Utils.UploadUtil;
import com.mis.entity.Article;
import com.mis.entity.People;
import com.mis.entity.Picture;
import com.mis.entity.User;
import com.mis.service.ArticleServiceI;
import com.mis.service.OrgServiceI;
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
import java.util.*;

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

    @Autowired
    private OrgServiceI orgServiceI;

    @Autowired
    private ArticleServiceI articleServiceI;

    @RequestMapping(value = "ShowPeople",method= RequestMethod.POST)
    @ResponseBody
    public List ShowPeople(){
        return peopleServiceI.showPeople();
    }

    @ResponseBody
    @RequestMapping(value="ShowPeopleByOrgnum",method = RequestMethod.POST)
    public List<User> showPeopleByOrgnum(String orgnum){
        return peopleServiceI.showPeopleByOrgnum(orgnum);
    }

    @RequestMapping(value = "ShowType",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,List> ShowType(){
        List orgList = orgServiceI.showOrg();
        List typeList = articleServiceI.showType(50);
        Map<String,List> map = new HashMap<String,List>();
        map.put("Org",orgList);
        map.put("Type",typeList);
        return map;
    }


    @RequestMapping(value = "ShowPeoplById",method= RequestMethod.POST)
    @ResponseBody
    public Map<String,List> ShowPeoplById(String id){
        List orgList = orgServiceI.showOrg();
        List typeList = articleServiceI.showType(50);
        List userList = peopleServiceI.showPeopleById(id);
        Map<String,List> map = new HashMap<String,List>();
        map.put("Org",orgList);
        map.put("Type",typeList);
        map.put("User",userList);
        return map;
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

        String seq = request.getParameter("seq");
        String nativeplace = request.getParameter("nativeplace");
        String company = request.getParameter("company");
        String companytype = request.getParameter("companytype");
        String Intro = request.getParameter("introduce");
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
        user.setIsenabledMis(true);
        user.setEmail(email);
        user.setTelphone(telphone);

        people.setPicpath(pp);
        people.setId(peopleid);
        people.setUsername(username);
        people.setIntroduce(Intro);
        people.setCompany(company);
        people.setOrgid(orgname);
        people.setNativeplace(nativeplace);
        people.setCompanytype(Integer.parseInt(companytype));
        people.setCompanytype(Integer.parseInt(seq));
        people.setCreatetime(date);

        peopleServiceI.addPeople(people, user);
    }

    @ResponseBody
    @RequestMapping(value="UpdatePeople",method=RequestMethod.POST)
    public void updatePeople(HttpServletRequest request,@RequestParam MultipartFile[] Pic,People people) throws IOException {
        String dir = UploadUtil.getFolder();
        String path = null;
        String basePath = null;
        String picdir = null;
        String picpath = null;

        System.out.println(request.getParameter("Title"));
        for(MultipartFile myfile : Pic){
            if(myfile.isEmpty()){
                System.out.println("文件未上传");
            }else{
                //上传文件 返回路径
                path =  request.getContextPath();
                basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
                picdir = request.getSession().getServletContext().getRealPath("") + "\\img";
                picpath = UploadUtil.writeFile(myfile.getOriginalFilename(), dir, myfile.getInputStream(),picdir);
            }
        }
        String pp =basePath+picpath;

        people.setPicpath(pp);
        peopleServiceI.updatePeople(people);
    }

    @ResponseBody
    @RequestMapping(value="Delete",method=RequestMethod.POST)
    public String delete(String id){
        peopleServiceI.delete(id);
        return "OK";
    }

    @RequestMapping(value="StatusOn",method= RequestMethod.POST)
    @ResponseBody
    public String statusOn(String id) {
        peopleServiceI.statusOn(id);
        return "OK";
    }

    @RequestMapping(value="StatusOff", method = RequestMethod.POST)
    @ResponseBody
    public String statusOff(String id){
        peopleServiceI.statusOff(id);
        return "OK";
    }
}
