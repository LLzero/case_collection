package com.casecollection.backend.controller;

import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.model.vo.UserVo;
import com.casecollection.backend.service.UserService;
import com.casecollection.backend.util.Pagination;
import com.casecollection.common.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by zuodeng on 16/8/5.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/toList",method = RequestMethod.GET)
    public String toList(Model model,HttpServletRequest request){
        return "/backend/user/list";
    }

    /**
     * 分页查询示例
     * js参考
     * @param vo
     * @param pg
     * @return
     */
    @RequestMapping(value = "/findUser",method = RequestMethod.GET)
    @ResponseBody
    public Pagination<UserVo> findUser(UserVo vo,Pagination<UserVo> pg,HttpServletRequest request){
        vo.setPagination(pg);
        return userService.findUser(vo, pg);
    }

    @RequestMapping(value = "/manager",method = RequestMethod.GET)
    public String manager(Model model,HttpServletRequest request){
        UserSession userSession = (UserSession)request.getSession().getAttribute("user");
        model.addAttribute("user", userSession);
        return "/backend/user/manager";
    }


    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Response updateUser(UserVo vo,HttpServletRequest request){
        UserSession userSession = (UserSession)request.getSession().getAttribute("user");
        return userService.updateByPrimaryKeySelective(vo,userSession);
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public Response deleteUser(String ids,HttpServletRequest request){
        return userService.deleteByIds(ids);
    }

    @RequestMapping(value = "/toResetPassword",method = RequestMethod.GET)
    public String toResetPassword(Model model,HttpServletRequest request){
        return "/backend/user/resetPassword";
    }

    @RequestMapping(value = "/resetPassword",method = RequestMethod.POST,produces = "application/json")
    @ResponseBody
    public Response resetPassword(String oldPassword,String newPassword,HttpServletRequest request){
        UserSession userSession = (UserSession)request.getSession().getAttribute("user");
        Response result = userService.resetPassword(userSession,newPassword,oldPassword);
        if(result.getRetCode() == Response.OK_CODE){
            request.getSession().setAttribute("user",userSession);
        }
        return  result;
    }

    @RequestMapping(value = "/initPassword",method = RequestMethod.POST)
    @ResponseBody
    public Response initPassword(Long id,HttpServletRequest request){
        UserSession userSession = (UserSession)request.getSession().getAttribute("user");
        return userService.initPassword(userSession, id);
    }

}
