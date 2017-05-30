package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.OrderPreviewDao;
import com.github.jxc.pojo.OrderPreview;
import com.github.jxc.service.OrderPreviewService;
@Service("OrderPreviewService")
public class OrderPreviewServiceImpl implements OrderPreviewService{

	@Resource
	private OrderPreviewDao orderPreviewDao;
	
	@Override
	public int deleteByPrimaryKey(String orderId) {
		return this.orderPreviewDao.deleteByPrimaryKey(orderId);
	}

	@Override
	public int insert(OrderPreview record) {
		return this.orderPreviewDao.insert(record);
	}

	@Override
	public int insertSelective(OrderPreview record) {
		return this.orderPreviewDao.insertSelective(record);
	}

	@Override
	public OrderPreview selectByPrimaryKey(String orderId) {
		return this.orderPreviewDao.selectByPrimaryKey(orderId);
	}

	@Override
	public int updateByPrimaryKeySelective(OrderPreview record) {
		return this.orderPreviewDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(OrderPreview record) {
		return this.orderPreviewDao.updateByPrimaryKey(record);
	}

	@Override
	public List<OrderPreview> selectAllEntry() {
		return this.orderPreviewDao.selectAllEntry();
	}

	@Override
	public List<OrderPreview> selectAllLoss() {
		return this.orderPreviewDao.selectAllLoss();
	}

	@Override
	public OrderPreview selectByBeLossOrderId(String beLossOrderId) {
		return this.orderPreviewDao.selectByBeLossOrderId(beLossOrderId);
	}

	@Override
	public List<OrderPreview> selectAllReturn() {
		return this.orderPreviewDao.selectAllReturn();
	}

	@Override
	public List<OrderPreview> selectEntryManage() {
		return this.orderPreviewDao.selectEntryManage();
	}

	@Override
	public List<OrderPreview> selectByWarehouseIdAndSupplierId(
			Integer warehouseId,Integer supplierId) {
		return this.orderPreviewDao.selectByWarehouseIdAndSupplierId(warehouseId, supplierId);
	}

	@Override
	public List<OrderPreview> selectAllAllot() {
		return this.orderPreviewDao.selectAllAllot();
	}

	@Override
	public List<OrderPreview> selectAllWaitReturn() {
		return this.orderPreviewDao.selectAllWaitReturn();
	}


}
