package com.casecollection.backend.dao;

import com.casecollection.backend.model.User;
import com.casecollection.backend.model.vo.UserVo;

import java.util.List;

public interface UserMapper {
    int deleteByIds(List<Long> list);

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

    /**
     * 查询用户数量
     * @param userVo
     * @return
     */
    int findUserCount(UserVo userVo);

    /**
     * 查询用户列表
     * @param userVo
     * @return
     */
    List<User> findUser(UserVo userVo);

    /**
     * 根据账号查询用户
     * @param userVo
     * @return
     */
    List<User> findByAccount(UserVo userVo);
}