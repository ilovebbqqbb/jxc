package com.github.jxc.service;

import com.github.jxc.pojo.ConsumeDetail;

public interface ConsumeDetailService {
    int deleteByPrimaryKey(Integer consumeDetailId);

    int insert(ConsumeDetail record);

    int insertSelective(ConsumeDetail record);

    ConsumeDetail selectByPrimaryKey(Integer consumeDetailId);

    int updateByPrimaryKeySelective(ConsumeDetail record);

    int updateByPrimaryKey(ConsumeDetail record);
}
