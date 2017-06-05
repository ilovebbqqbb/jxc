package com.github.jxc.dao;

import com.github.jxc.pojo.ConsumePreview;

public interface ConsumePreviewDao {
    int deleteByPrimaryKey(String consumeId);

    int insert(ConsumePreview record);

    int insertSelective(ConsumePreview record);

    ConsumePreview selectByPrimaryKey(String consumeId);

    int updateByPrimaryKeySelective(ConsumePreview record);

    int updateByPrimaryKey(ConsumePreview record);
}