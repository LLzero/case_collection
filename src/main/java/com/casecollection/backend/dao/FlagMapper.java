package com.casecollection.backend.dao;

import com.casecollection.backend.model.Flag;

public interface FlagMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Flag record);

    int insertSelective(Flag record);

    Flag selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Flag record);

    int updateByPrimaryKey(Flag record);
}