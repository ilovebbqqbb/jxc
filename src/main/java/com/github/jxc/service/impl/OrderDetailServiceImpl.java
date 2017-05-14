package com.github.jxc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.jxc.dao.OrderDetailDao;
import com.github.jxc.pojo.OrderDetail;
import com.github.jxc.service.OrderDetailService;
@Service("OrderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService{
	
	@Resource
	private OrderDetailDao orderDetailDao;

	@Override
	public int deleteByPrimaryKey(Integer orderDetailId) {
		return this.orderDetailDao.deleteByPrimaryKey(orderDetailId);
	}

	@Override
	public int insert(OrderDetail record) {
		return this.orderDetailDao.insert(record);
	}

	@Override
	public int insertSelective(OrderDetail record) {
		return this.orderDetailDao.insertSelective(record);
	}

	@Override
	public OrderDetail selectByPrimaryKey(Integer orderDetailId) {
		return this.orderDetailDao.selectByPrimaryKey(orderDetailId);
	}

	@Override
	public int updateByPrimaryKeySelective(OrderDetail record) {
		return this.orderDetailDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(OrderDetail record) {
		return this.orderDetailDao.updateByPrimaryKey(record);
	}

	@Override
	public int deleteByOrderId(String orderId) {
		return this.orderDetailDao.deleteByOrderId(orderId);
	}

	@Override
	public List<OrderDetail> selectByOrderId(String orderId) {
		return this.orderDetailDao.selectByOrderId(orderId);
	}
}
