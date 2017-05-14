package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.Goods;

public interface GoodsService {

	List<Goods> selectAll();
	
    Goods selectByPrimaryKey(Integer goodsId);
    
    List<Goods> selectBySupplierId(Integer supplierid);
    
    Goods selectByGoodsIdAndSupplierId(Goods goods);
}
