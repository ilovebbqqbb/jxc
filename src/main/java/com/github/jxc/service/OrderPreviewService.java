package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.OrderPreview;

public interface OrderPreviewService {
	int deleteByPrimaryKey(String orderId);

    int insert(OrderPreview record);

    int insertSelective(OrderPreview record);

    OrderPreview selectByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(OrderPreview record);

    int updateByPrimaryKey(OrderPreview record);
    
    List<OrderPreview> selectAllEntry();
}
