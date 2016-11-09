package com.mis.controller;

import com.mis.Utils.UploadUtil;
import com.mis.entity.Article;
import com.mis.entity.MessageType;
import com.mis.service.ArticleServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Created by admin on 2016/10/12.+
 */
@Controller
@RequestMapping("/ArticleController")
public class ArticleController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ArticleServiceI articleServiceI;


    @ResponseBody
    @RequestMapping(value = "AddArticle",method= RequestMethod.POST)
    public void addArticle(@RequestParam MultipartFile[] TitlePicpath,Integer type,String Title,String content,String name) throws IOException {
        String dir = UploadUtil.getFolder();
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        String picdir = request.getSession().getServletContext().getRealPath("") + "\\img";
        String picpath = null;

        System.out.println(name);

        for(MultipartFile myfile : TitlePicpath){
            if(myfile.isEmpty()){
                System.out.print("文件未上传");
            }else{
                //上传文件 返回路径
                picpath = UploadUtil.writeFile(myfile.getOriginalFilename(), dir, myfile.getInputStream(),picdir);
            }
        }
        String pp =basePath+picpath;
        articleServiceI.addArticle(pp,Title,content,type);
    }

    @ResponseBody
    @RequestMapping(value = "ShowArticle",method= RequestMethod.POST)
    public List<Article> showArticle(String mtype){
        return articleServiceI.showArticle(mtype);
    }

    @ResponseBody
    @RequestMapping(value = "ShowArticleById",method = RequestMethod.POST)
    public Article showArticleById(String id){
        return articleServiceI.showArticleById(id);
    }

    @ResponseBody
    @RequestMapping(value="UpdateArticle",method=RequestMethod.POST)
    public void updateArticle(@RequestParam MultipartFile[] TitlePicpath,Integer type,String Title,String content,String id,Integer Seq) throws IOException {
        String dir = UploadUtil.getFolder();
        String path = null;
        String basePath = null;
        String picdir = null;
        String picpath = null;

        System.out.println(request.getParameter("Title"));
        for(MultipartFile myfile : TitlePicpath){
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
        articleServiceI.updateArticle(id, Title, content, type, Seq, pp);
    }

    @RequestMapping(value="StatusOn",method= RequestMethod.POST)
    @ResponseBody
    public String StatusOn(String id) {
        articleServiceI.StatusOn(id);
        return "OK";
    }

    @RequestMapping(value="StatusOff", method = RequestMethod.POST)
    @ResponseBody
    public String StatusOff(String id){
        articleServiceI.StatusOff(id);
        return "OK";
    }

    @ResponseBody
    @RequestMapping(value="ShowType", method = RequestMethod.POST)
    public List<MessageType> showType(int pnum){
      return articleServiceI.showType(pnum);
    }

}
