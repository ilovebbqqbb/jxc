package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.Goods;

public interface GoodsDao {
	
	List<Goods> selectAll();
	
	Goods selectByPrimaryKey(Integer goodsId);
}
