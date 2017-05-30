package com.github.jxc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.jxc.pojo.OrderPreview;

public interface OrderPreviewDao {
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
    
    List<OrderPreview> selectByWarehouseIdAndSupplierId(@Param("warehouseId") Integer warehouseId,@Param("supplierId") Integer supplierId );
    
}