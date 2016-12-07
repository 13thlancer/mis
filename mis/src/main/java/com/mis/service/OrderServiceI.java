package com.mis.service;

import com.mis.entity.Order;

import java.util.List;

/**
 * Created by admin on 2016/12/6.
 */
public interface OrderServiceI {

    List<Order> showOrder();

    List<Order> showOrderById(String id);

    void addOrder(Order order);

    void deleteOrder(String id);

    void editOrder(Order order);

    void statusOn(String id);

    void statusOff(String id);

    void push(String id);
}
