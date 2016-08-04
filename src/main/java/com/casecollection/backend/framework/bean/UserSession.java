package com.casecollection.backend.framework.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.casecollection.backend.system.Menu;

/**
 * 保存用户session实体类
 * @Create_by Ranger
 * @Create_Date 2015年5月25日下午1:39:03
 */
public class UserSession implements Serializable {

    private static final long serialVersionUID = 4149687791200652518L;
    // 用户id
    private Long id;
    // 姓名
    private String name;
    
    private Integer dataLevel;    //权限级别 1-最高
    
    private Integer cusLevel;
    
    private Integer isHandling;//是否接收问题

    private String sCode;         //学校
    
    private Integer handNum;//在线同时服务的用户数量

    private String realName;  //真是姓名

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getDataLevel() {
        return dataLevel;
    }

    public void setDataLevel(Integer dataLevel) {
        this.dataLevel = dataLevel;
    }

    public Integer getCusLevel() {
        return cusLevel;
    }

    public void setCusLevel(Integer cusLevel) {
        this.cusLevel = cusLevel;
    }

    public Integer getIsHandling() {
        return isHandling;
    }

    public void setIsHandling(Integer isHandling) {
        this.isHandling = isHandling;
    }

    public String getsCode() {
        return sCode;
    }

    public void setsCode(String sCode) {
        this.sCode = sCode;
    }

    public Integer getHandNum() {
        return handNum;
    }

    public void setHandNum(Integer handNum) {
        this.handNum = handNum;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }
}
