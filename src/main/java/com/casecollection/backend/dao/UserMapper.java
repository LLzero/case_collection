package com.casecollection.backend.dao;

import com.casecollection.backend.model.User;
import com.casecollection.backend.model.vo.UserVo;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    /**
     * 根据名称查询用户
     * @param userVo
     * @return
     */
    List<User> findByName(UserVo userVo);
}