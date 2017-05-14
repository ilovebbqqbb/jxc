package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.OrderDetail;

public interface OrderDetailService {
	int deleteByPrimaryKey(Integer orderDetailId);

    int insert(OrderDetail record);

    int insertSelective(OrderDetail record);

    OrderDetail selectByPrimaryKey(Integer orderDetailId);

    int updateByPrimaryKeySelective(OrderDetail record);

    int updateByPrimaryKey(OrderDetail record);
    
    int deleteByOrderId(String orderId);
    
    List<OrderDetail>  selectByOrderId(String orderId);
}
