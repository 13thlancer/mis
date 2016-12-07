package com.mis.controller;

import com.mis.entity.User;
import com.mis.entity.UserLoin;
import com.mis.service.UserServiceI;
import com.sun.net.httpserver.Authenticator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by admin on 2016/11/4.
 */
@Controller
@RequestMapping("/LoginController")
public class LoginController {

    @Autowired
    private UserServiceI userServiceI;

    @ResponseBody
    @RequestMapping(value="Login", method = RequestMethod.POST)
    public String login(String username,String password,HttpSession httpSession){

        UserLoin ul = new UserLoin();
        ul.setUsername(username);
        ul.setPassword(password);


        List<User> list = userServiceI.login(ul);

        if(list.size() != 0) {
            httpSession.setAttribute("picpath",list.get(0).getPeople().get(0).getPicpath());
            httpSession.setAttribute("name",list.get(0).getPeople().get(0).getUsername());
            httpSession.setAttribute("userid",list.get(0).getUserid());
            return "OK";
        }
        return "登录失败！";
    }
}
