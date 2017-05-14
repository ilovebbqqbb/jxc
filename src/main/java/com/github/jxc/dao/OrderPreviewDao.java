package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.OrderPreview;

public interface OrderPreviewDao {
    int deleteByPrimaryKey(String orderId);

    int insert(OrderPreview record);

    int insertSelective(OrderPreview record);

    OrderPreview selectByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(OrderPreview record);

    int updateByPrimaryKey(OrderPreview record);
    
    List<OrderPreview> selectAllEntry();
}