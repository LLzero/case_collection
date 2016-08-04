package com.casecollection.backend.service.impl;

import com.casecollection.backend.constants.enums.StatusEnum;
import com.casecollection.backend.dao.UserMapper;
import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.model.User;
import com.casecollection.backend.model.vo.UserVo;
import com.casecollection.backend.service.UserService;
import com.casecollection.backend.util.MD5Util;
import com.casecollection.common.Response;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * Created by zuodeng on 16/8/4.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 修改用户信息
     *
     * @param userVo
     * @return
     */
    @Override
    public Response<Boolean> updateByPrimaryKeySelective(UserVo userVo, UserSession userSession) {
        try {
            //校验名称是否重复
            List<User> userList = userMapper.findByName(userVo);
            if (!CollectionUtils.isEmpty(userList)) {
                return Response.getResponseError(Boolean.FALSE, "该用户名已经存在");
            }
            User user = new User();
            BeanUtils.copyProperties(userVo, user);
            user.setUpdateBy(userSession.getName());
            user.setUpdateTime(new Date());
            userMapper.updateByPrimaryKeySelective(user);
            return Response.getResponseOK(Boolean.TRUE);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE, "系统错误");
        }
    }

    /**
     * 新增用户信息
     *
     * @param userVo
     * @return
     */
    @Override
    public Response<Boolean> insertSelective(UserVo userVo, UserSession userSession) {
        try {
            //校验名称是否重复
            List<User> userList = userMapper.findByName(userVo);
            if (!CollectionUtils.isEmpty(userList)) {
                return Response.getResponseError(Boolean.FALSE, "该用户名已经存在");
            }
            User user = new User();
            BeanUtils.copyProperties(userVo, user);
            if (userSession != null) {
                user.setUpdateBy(userSession.getName());
                user.setCreateBy(userSession.getName());
            }
            user.setPassword(MD5Util.EncoderByMd5(userVo.getPassword()));
            user.setUpdateTime(new Date());
            user.setCreateTime(new Date());
            userMapper.insertSelective(user);
            return Response.getResponseOK(Boolean.TRUE);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE, "系统错误");
        }
    }

    /**
     * 登录
     *
     * @param userVo
     * @param userSession
     * @return
     */
    @Override
    public Response<Boolean> login(UserVo userVo, UserSession userSession) {
        try {
            if (StringUtils.isEmpty(userVo.getName()) || StringUtils.isEmpty(userVo.getPassword())) {
                return Response.getResponseError(Boolean.FALSE,"请填写用户名或密码");
            }
            List<User> users = userMapper.findByName(userVo);
            if (CollectionUtils.isEmpty(users) ||
                    !MD5Util.EncoderByMd5(userVo.getPassword()).equals(users.get(0).getPassword())) {
                return Response.getResponseError(Boolean.FALSE,"用户名或密码错误");
            }
            User user = users.get(0);
            if (user.getStatus() == StatusEnum.DISABLE.getValue()) {
                return Response.getResponseError(Boolean.FALSE,"用户已被禁用，请联系管理员");
            }
            BeanUtils.copyProperties(user,userSession);
            return  Response.getResponseOK(Boolean.TRUE);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE,"系统错误");
        }
    }

}
