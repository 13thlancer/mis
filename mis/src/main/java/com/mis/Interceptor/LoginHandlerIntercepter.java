//package com.mis.Interceptor;
//
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.mis.entity.Action;
//import com.mis.service.ActionServiceI;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.servlet.HandlerInterceptor;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.web.servlet.ModelAndView;
//
//import java.io.PrintWriter;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
///**
// * Created by Administrator on 2016/11/6.
// */
//public class LoginHandlerIntercepter implements HandlerInterceptor {
//
//    @Autowired
//    private ActionServiceI actionServiceI;
//
//    @Override
//    public void afterCompletion(HttpServletRequest request,
//                                HttpServletResponse response, Object arg2, Exception arg3)
//            throws Exception {
//    }
//
//    @Override
//    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
//                           Object arg2, ModelAndView arg3) throws Exception {
//
//    }
//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object arg2) throws Exception {
////        String requestURI = request.getRequestURI();
////        ObjectMapper mapper = new ObjectMapper();
////        Map map = new HashMap();
////        String content = null;
////        map.put("type","nosignin");
////        map.put("msg","无权限！");
////
////        if(requestURI.indexOf("Login")<0){
////            HttpSession session = request.getSession();
////            String username = (String) session.getAttribute("name");
////            String userid = (String) session.getAttribute("userid");
////
////            System.out.println(requestURI);
////            if(username == null) {
////                request.getRequestDispatcher("WebContent/PlatForm/login.jsp").forward(request, response);
////                return false;
////            }else{
////                List<Action> list = actionServiceI.getActionById(userid);
////                for(int i = 0;i<list.size();i++){
////                    String url = list.get(i).getActionname();
////                    if(requestURI.endsWith(url)){
////                        return true;
////                    }
////                }
////                PrintWriter out = response.getWriter();
////
////                content = mapper.writeValueAsString(map);
//////                out.write(content);
////                out.append(content);
//////                out.write("{\"type\":\"nosignin\",\"msg\":\"无权限！\"}");
////                out.flush();
////                out.close();
////                return false;
//
////            }
////        }
////        System.out.print(requestURI);
//        return true;
//    }
//}
