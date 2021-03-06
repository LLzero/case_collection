package com.casecollection.backend.model.vo;

import com.casecollection.backend.model.User;
import com.casecollection.backend.util.Pagination;

/**
 * Created by zuodeng on 16/8/4.
 */
public class UserVo extends User{

    private Pagination<UserVo> pagination;

    private String account;    //登陆 账号

    public Pagination<UserVo> getPagination() {
        return pagination;
    }

    public void setPagination(Pagination<UserVo> pagination) {
        this.pagination = pagination;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }
}
