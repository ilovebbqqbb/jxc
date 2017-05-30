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
    
    List<OrderPreview> selectEntryManage();
    
    List<OrderPreview> selectAllLoss();
    
    List<OrderPreview> selectAllReturn();
    
    List<OrderPreview> selectAllAllot();
    
    List<OrderPreview> selectAllWaitReturn();
    
    OrderPreview selectByBeLossOrderId(String beLossOrderId);
    
    List<OrderPreview> selectByWarehouseIdAndSupplierId(Integer warehouseId,Integer supplierId);
    
}
