package com.github.jxc.dao;

import java.util.List;
import com.github.jxc.pojo.SellPreview;

public interface SellPreviewDao {

	int insertSelective(SellPreview sellPreview);
	
	int deleteByPrimartKey(String sellId);
	
	int updateByPrimaryKeySelective(SellPreview sellPreview);
	
	List<SellPreview> selectAll();
	
	List<SellPreview> selectByStatus(String sellStatus);
	
	List<SellPreview> selectByTwoStatus(String sellStatus1,String SellStatus2);
	
	SellPreview selectByPrimaryKey(String sellId);	
	
}
