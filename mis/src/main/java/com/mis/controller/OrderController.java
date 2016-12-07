package com.mis.controller;

import com.mis.entity.Order;
import com.mis.service.ArticleServiceI;
import com.mis.service.OrderServiceI;
import com.mis.service.PeopleServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2016/12/6.
 */
@Controller
@RequestMapping("/OrderController")
public class OrderController {

    @Autowired
    private OrderServiceI orderServiceI;

    @Autowired
    private ArticleServiceI articleServiceI;

    @ResponseBody
    @RequestMapping(value = "ShowOrder",method= RequestMethod.POST)
    public List<Order> showOrder(){
        return orderServiceI.showOrder();
    }

    @ResponseBody
    @RequestMapping(value = "ShowOrderById",method = RequestMethod.POST)
    public Map<String,List> showOrderById(String id){
        List typeList = articleServiceI.showType(50);
        List orderList = orderServiceI.showOrderById(id);
        Map<String,List> map = new HashMap<String,List>();
        map.put("Order",orderList);
        map.put("Type",typeList);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "DeleteOrder",method = RequestMethod.POST)
    public String deleteOrder(String id){
        orderServiceI.deleteOrder(id);
        return "OK";
    }

    @ResponseBody
    @RequestMapping(value = "UpdateOrder",method = RequestMethod.POST)
    public String updateOrder(Order order){
        orderServiceI.editOrder(order);
        return "OK";
    }

    @ResponseBody
    @RequestMapping(value="StatusOn",method = RequestMethod.POST)
    public String statusOn(String id){
        orderServiceI.statusOn(id);
        return "OK";
    }

    @ResponseBody
    @RequestMapping(value="StatusOff",method = RequestMethod.POST)
    public String statusOff(String id){
        orderServiceI.statusOff(id);
        return "OK";
    }

    @ResponseBody
    @RequestMapping(value="Push",method = RequestMethod.POST)
    public String push(String id){
        orderServiceI.push(id);
        return "OK";
    }

}
