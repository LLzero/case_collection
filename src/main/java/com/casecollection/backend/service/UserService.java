package com.casecollection.backend.service;

import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.model.vo.UserVo;
import com.casecollection.common.Response;
import com.fasterxml.jackson.databind.node.BooleanNode;
import com.sun.org.apache.xpath.internal.operations.Bool;

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

}
