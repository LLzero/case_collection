package com.casecollection.backend.service;

import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.model.User;
import com.casecollection.backend.model.vo.UserVo;
import com.casecollection.backend.util.Pagination;
import com.casecollection.common.Response;
import com.fasterxml.jackson.databind.node.BooleanNode;
import com.sun.org.apache.xpath.internal.operations.Bool;

import java.util.List;

/**
 * Created by zuodeng on 16/8/4.
 */
public interface UserService {

    /**
     * 修改用户信息
     * @param userVo
     * @return
     */
    Response<Boolean> updateByPrimaryKeySelective(UserVo userVo,UserSession userSession);

    /**
     * 新增用户信息
     * @param userVo
     * @return
     */
    Response<Boolean> insertSelective(UserVo userVo,UserSession userSession);

    /**
     * 登录
     * @param userVo
     * @param userSession
     * @return
     */
    Response<Boolean> login(UserVo userVo,UserSession userSession);

    /**
     * 修改密码
     * @param userSession
     * @param newPassword
     * @return
     */
    Response<Boolean> resetPassword(UserSession userSession,String newPassword,String oldPassword);

    /**
     * 删除用户
     * @param ids
     * @return
     */
    Response<Boolean> deleteByIds(String ids);

    /**
     * 分页查询用户列表
     * @param userVo
     * @param pg
     * @return
     */
    Pagination<UserVo> findUser(UserVo userVo,Pagination<UserVo> pg);

    /**
     * 初始化用户密码
     * @param userSession
     * @param id
     * @return
     */
    Response<Boolean> initPassword(UserSession userSession,Long id);

    /**
     * 查询用户单位列表
     * @return
     */
    List<User> findAllUser();

}
