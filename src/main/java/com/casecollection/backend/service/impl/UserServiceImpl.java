package com.casecollection.backend.service.impl;

import com.casecollection.backend.constants.enums.CreateTypeEnum;
import com.casecollection.backend.constants.enums.DataLevelEnum;
import com.casecollection.backend.constants.enums.StatusEnum;
import com.casecollection.backend.dao.FlagMapper;
import com.casecollection.backend.dao.UserMapper;
import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.model.Flag;
import com.casecollection.backend.model.User;
import com.casecollection.backend.model.vo.UserVo;
import com.casecollection.backend.service.UserService;
import com.casecollection.backend.util.MD5Util;
import com.casecollection.backend.util.Pagination;
import com.casecollection.common.Response;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by zuodeng on 16/8/4.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private FlagMapper flagMapper;

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
                user.setCreateType(CreateTypeEnum.RESET.getValue());
                user.setPassword("000000");   //初始密码
            }
            user.setUpdateTime(new Date());
            user.setCreateTime(new Date());
            //获取查询账号
            this.getAccountFlag(user);
            //账号类型
            userMapper.insertSelective(user);
            return Response.getResponseOK(Boolean.TRUE);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE, "系统错误");
        }
    }

    private void getAccountFlag (User user) throws Exception{
        boolean result = false;
        int k = 0;    //三次不成功 抛异常
        while (!result){
            Flag flag = flagMapper.selectByPrimaryKey(1l);
            String str = flag.getFlag().toString().length() < 3 ? "0"+flag.getFlag():flag.getFlag().toString();
            user.setReportAccount("I" + str);
            user.setQueryAccount("Q" + str);
            flag.setFlag(flag.getFlag()+1);
            if(++k == 3){
                throw new RuntimeException("超过重试次数");
            }
            int i = flagMapper.updateByPrimaryKey(flag);
            if(i == 1){
                result = true;
            }
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
            if (StringUtils.isEmpty(userVo.getAccount()) || StringUtils.isEmpty(userVo.getPassword())) {
                return Response.getResponseError(Boolean.FALSE,"请填写用户名或密码");
            }
            List<User> users = userMapper.findByAccount(userVo);
            if (CollectionUtils.isEmpty(users) ||
                    !userVo.getPassword().equals(users.get(0).getPassword())) {
                return Response.getResponseError(Boolean.FALSE,"用户名或密码错误");
            }
            User user = users.get(0);
            if (user.getStatus() == StatusEnum.DISABLE.getValue()) {
                return Response.getResponseError(Boolean.FALSE,"用户已被禁用，请联系管理员");
            }
            BeanUtils.copyProperties(user,userSession);
            if(user.getDataLevel() == DataLevelEnum.ADMIN.getValue()){
                userSession.setAccountType(0);
            }else{
                if(userVo.getAccount().equals(user.getReportAccount())){
                    userSession.setAccountType(1);    //填报账号
                }
                if(userVo.getAccount().equals(user.getQueryAccount())){
                    userSession.setAccountType(2);    //查询账号
                }
            }
            return  Response.getResponseOK(Boolean.TRUE);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE,"系统错误");
        }
    }

    /**
     * 修改密码
     *
     * @param userSession
     * @param newPassword
     * @param oldPassword
     * @return
     */
    @Override
    public Response<Boolean> resetPassword(UserSession userSession, String newPassword, String oldPassword) {
        try {
            User user = userMapper.selectByPrimaryKey(userSession.getId());
            if(!oldPassword.equals(user.getPassword())){
                return Response.getResponseError(Boolean.FALSE,"原始密码输入不正确");
            }
            User updateUser = new User();
            //密码更新次数
            updateUser.setId(userSession.getId());
            updateUser.setLoginTimes(user.getLoginTimes() + 1);
            updateUser.setPassword(newPassword);
            updateUser.setUpdateTime(new Date());
            updateUser.setUpdateBy(userSession.getName());
            userMapper.updateByPrimaryKeySelective(updateUser);
            //重置session
            userSession.setLoginTimes(user.getLoginTimes() + 1);
            userSession.setPassword(newPassword);
            return Response.getResponseOK(Boolean.TRUE);
        }catch (Exception e){
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE,"系统错误");
        }
    }

    /**
     * 删除用户
     *
     * @param ids
     * @return
     */
    @Override
    public Response<Boolean> deleteByIds(String ids) {
        try {
            List<Long> idList = new ArrayList<>();
            String[] strs = ids.split(",");
            for(String str : strs){
                idList.add(Long.parseLong(str));
            }
            userMapper.deleteByIds(idList);
            return Response.getResponseOK(Boolean.TRUE);
        }catch (Exception e){
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE,"系统错误");
        }
    }

    /**
     * 分页查询用户列表
     *
     * @param userVo
     * @param pg
     * @return
     */
    @Override
    public Pagination<UserVo> findUser(UserVo userVo, Pagination<UserVo> pg) {
        try {
            int count = userMapper.findUserCount(userVo);
            if(count <= 0){
                return pg;
            }
            List<UserVo> userVoList = new ArrayList<>();
            List<User> userList = userMapper.findUser(userVo);
            for(User user : userList){
                UserVo sysUserVo = new UserVo();
                BeanUtils.copyProperties(user, sysUserVo);
                userVoList.add(sysUserVo);
            }
            pg.setData(userVoList);
            pg.setTotalRows(count);
        }catch (Exception e){
            e.printStackTrace();
        }
        return pg;
    }

    /**
     * 初始化用户密码
     *
     * @param userSession
     * @param id
     * @return
     */
    @Override
    public Response<Boolean> initPassword(UserSession userSession, Long id) {
        try {
            User updateUser = new User();
            //密码更新次数
            updateUser.setId(id);
            updateUser.setPassword("000000");
            updateUser.setLoginTimes(0l);
            updateUser.setCreateType(CreateTypeEnum.RESET.getValue());
            updateUser.setUpdateTime(new Date());
            updateUser.setUpdateBy(userSession.getName());
            userMapper.updateByPrimaryKeySelective(updateUser);
            return Response.getResponseOK(Boolean.TRUE);
        }catch (Exception e){
            e.printStackTrace();
            return Response.getResponseError(Boolean.FALSE,"系统错误");
        }
    }

}
