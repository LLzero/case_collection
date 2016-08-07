package com.casecollection.backend.constants;

import java.util.ArrayList;
import java.util.List;

import com.casecollection.backend.system.Menu;

public class MenuConstants {

    private static List<Menu> commonMenus = new ArrayList<>();
    private static List<Menu> adminMenus = new ArrayList<>();
    
    static {
        //一级菜单
        int commonLevel1Count = 0;
        int adminLevel1Count = 0;
        adminMenus.add(new Menu("用户管理", null, "glyphicon glyphicon-user", 0L, 1, adminLevel1Count++));
        adminMenus.add(new Menu("数据填报", null, "fa fa-list", 0L, 1, adminLevel1Count++));
        commonMenus.add(new Menu("用户管理", null, "glyphicon glyphicon-user", 0L, 1, commonLevel1Count++));
        commonMenus.add(new Menu("数据填报", null, "fa fa-list", 0L, 1, commonLevel1Count++));

        //二级菜单
        commonLevel1Count = 0;
        adminLevel1Count = 0;
        int commonLevel2Count = 0;
        int adminLevel2Count = 0;
        adminMenus.get(adminLevel1Count).getChildMenu().add(new Menu("用户管理", "/user/toList", "", 0L, 2, adminLevel2Count++));
        adminMenus.get(adminLevel1Count).getChildMenu().add(new Menu("个人信息", "/user/toManager", "", 0L, 2, adminLevel2Count++));
        adminMenus.get(adminLevel1Count).getChildMenu().add(new Menu("密码修改", "/user/toResetPassword", "", 0L, 2, adminLevel2Count++));
        commonMenus.get(commonLevel1Count).getChildMenu().add(new Menu("信息修改", "/user/toManager", "", 0L, 2, commonLevel2Count++));
        commonMenus.get(commonLevel1Count).getChildMenu().add(new Menu("密码修改", "/user/toResetPassword", "", 0L, 2, commonLevel2Count++));

        commonLevel1Count++;
        adminLevel1Count++;
        commonLevel2Count = 0;
        adminLevel2Count = 0;
        adminMenus.get(adminLevel1Count).getChildMenu().add(new Menu("病例信息", "/diseaseCase/manage", "", 0L, 2, adminLevel2Count++));
        commonMenus.get(commonLevel1Count).getChildMenu().add(new Menu("病例信息", "/diseaseCase/manage", "", 0L, 2, commonLevel2Count++));

    }

    public static List<Menu> getCommonMenus() {
        return commonMenus;
    }

    public static List<Menu> getAdminMenus() {
        return adminMenus;
    }

}
