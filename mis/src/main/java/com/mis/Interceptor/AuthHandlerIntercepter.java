package com.mis.Interceptor;

import com.mis.service.ActionServiceI;
import com.mis.service.RoleServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2016/11/6.
 */
public class AuthHandlerIntercepter implements HandlerInterceptor {

    @Autowired
    private ActionServiceI actionServiceI;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
//        String requestUrl = httpServletRequest.getRequestURI();
//        HttpSession session = httpServletRequest.getSession();
//        String userid = (String) session.getAttribute("userid");
//        List list = actionServiceI.getActionById(userid);
//        for(int i = 0;i<list.size();i++){
//            System.out.print(list.get(i));
//        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
