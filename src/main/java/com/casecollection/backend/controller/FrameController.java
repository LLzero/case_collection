package com.casecollection.backend.controller;

import com.casecollection.backend.constants.MenuConstants;
import com.casecollection.backend.constants.enums.DataLevelEnum;
import com.casecollection.backend.framework.bean.UserSession;
import com.casecollection.backend.model.vo.UserVo;
import com.casecollection.backend.service.UserService;
import com.casecollection.backend.system.Menu;
import com.casecollection.backend.util.DateUtil;
import com.casecollection.common.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Desc 首页Controller
 * @author rocklee
 *
 */
@Controller
public class FrameController {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String index() {
        return "redirect:/index";
    }

    /**
     * 后台首页
     */
    @RequestMapping("/index")
    public String toIndex() {
        return "/index";
    }
    
    /**
     * 登录
     * @throws IOException 
     */
    @RequestMapping("/loginForm")
    @ResponseBody
    public Response loginForm(UserVo userVo, HttpServletRequest request,HttpServletResponse response) throws IOException {
        UserSession userSession = new UserSession();
        Response result = userService.login(userVo,userSession);
        if(result.getRetCode() == Response.OK_CODE){
            request.getSession().setAttribute("user",userSession);
        }
        return result;
    }

    /**
     * @Desc 获取用户拥有的菜单
     * @return String
     * @Create_by Ranger
     * @Create_Date 2015年5月21日上午1:15:45
     */
    @RequestMapping("/loadMenu")
    @ResponseBody
    public List<Menu> loadMenu(HttpServletRequest request) {
        UserSession user = (UserSession) request.getSession().getAttribute("user");
        if(user != null && user.getDataLevel() == DataLevelEnum.ADMIN.getValue()) {
            return MenuConstants.getAdminMenus();
        }
        return MenuConstants.getCommonMenus();
    }
	/**
	 * 跳转无权限页面
	 */
	@RequestMapping("/noPermisson")
	public String noPermission() {
		return "noPermission";
	}
	/**
	 * 跳转ajax无权限页面
	 */
	@RequestMapping("/ajax_noPermission")
    @ResponseBody
	public Map<String, String> ajaxNoPermission() {
        Map<String, String> noPermissionMessage = new HashMap<>();
        noPermissionMessage.put("error", "您没有访问权限，请申请开通");
        return noPermissionMessage;
	}
	/**
	 * frame 首页
	 */
	@RequestMapping("/frame")
	public String frame(HttpServletRequest request, Model model) {
		model.addAttribute("currentDate", DateUtil.getDate(new Date(), DateUtil.default_pattern_d));
		model.addAttribute("day", DateUtil.getWeek(new Date()));
		UserSession user = (UserSession) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
		return "/frame";
	}

    @RequestMapping("/welcome")
    public String welcome(HttpServletRequest request, Model model) {
        return "/welcome";
    }

    @RequestMapping("/toResetPassword")
    public String toResetPassword(HttpServletRequest request, HttpServletResponse response) {
        //跳转到注册页面
        return "/resetPassword";
    }

    /**
     * 注册
     * @throws IOException
     */
    @RequestMapping("/register")
    @ResponseBody
    public Response register(UserVo userVo, HttpServletRequest request,HttpServletResponse response) throws IOException {
        return userService.insertSelective(userVo, null);
    }
	
	@RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute("user");
        //跳转到登录页面
        return "redirect:/index";
    }
	/**
	 * 侧边栏
	 */
	@RequestMapping("/sidebar")
	public String sidebar() {
		return "../layouts/sidebar";
	}
    
    @RequestMapping("/ue")
    public String ue(String action, String noCache, Model model) {
        model.addAttribute("action", action);
        model.addAttribute("noCache", noCache);
        return "redirect:/static/ueditor/jsp/controller.jsp";
    }
    
}