package com.mis.serviceImpl;

import com.mis.entity.Order;
import com.mis.mapper.OrderMapper;
import com.mis.service.OrderServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by admin on 2016/12/6.
 */
@Service("OrderService")
public class OrderServiceImpl implements OrderServiceI {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> showOrder() {
        return orderMapper.showOrder();
    }

    @Override
    public List<Order> showOrderById(String id) {
        return orderMapper.showOrderById(id);
    }

    @Override
    public void addOrder(Order order) {
        orderMapper.addOrder(order);
    }

    @Override
    public void deleteOrder(String id) {
        orderMapper.deleteOrder(id);
    }

    @Override
    public void editOrder(Order order) {
        orderMapper.editOrder(order);
    }

    @Override
    public void statusOn(String id) {
        orderMapper.statusOn(id);
    }

    @Override
    public void statusOff(String id) {
        orderMapper.statusOff(id);
    }

    @Override
    public void push(String id) {
        orderMapper.push(id);
    }
}
