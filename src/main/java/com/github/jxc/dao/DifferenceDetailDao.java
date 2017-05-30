package com.github.jxc.dao;

import java.util.List;

import com.github.jxc.pojo.DifferenceDetail;
import com.github.jxc.pojo.DifferencePreview;

public interface DifferenceDetailDao {
	
	int insertSelective(DifferenceDetail differenceDetail);
	
	List<DifferenceDetail> selectByDifferenceId(String differenceId);
	
	int deleteByDifferenceId(String differenceId);
	
	List<DifferenceDetail> selectByWarehouseIdAndDifferenceId(DifferencePreview differencePreview);
}
