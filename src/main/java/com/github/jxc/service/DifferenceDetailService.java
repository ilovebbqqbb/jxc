package com.github.jxc.service;

import java.util.List;

import com.github.jxc.pojo.DifferenceDetail;
import com.github.jxc.pojo.DifferencePreview;

public interface DifferenceDetailService {
	
	int insertSelective(DifferenceDetail differenceDetail);
	
	List<DifferenceDetail> selectByDifferenceId(String differenceId);
	
	int deleteByDifferenceId(String differenceId);
	
	List<DifferenceDetail> selectByWarehouseIdAndDifferenceId(DifferencePreview differencePreview);
}
