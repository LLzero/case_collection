package com.casecollection.backend.framework.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.casecollection.backend.model.User;
import com.casecollection.backend.system.Menu;

/**
 * 保存用户session实体类
 * @Create_by Ranger
 * @Create_Date 2015年5月25日下午1:39:03
 */
public class UserSession extends User implements Serializable {

    private Integer accountType ;     //0-管理员  1-填报账号  2-查询账号

    public Integer getAccountType() {
        return accountType;
    }

    public void setAccountType(Integer accountType) {
        this.accountType = accountType;
    }

}
