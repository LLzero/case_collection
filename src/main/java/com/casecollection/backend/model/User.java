package com.casecollection.backend.model;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
    private Long id;

    private String name;

    private String password;

    private String contact;

    private String contactMeans;

    private Integer dataLevel;    //权限  0-管理员 1-超级用户  2-普通用户

    private Integer status;

    private Date createTime;

    private Date updateTime;

    private String createBy;

    private String updateBy;

    private String reportAccount;

    private String queryAccount;

    private Long loginTimes;

    private Integer createType;

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getContactMeans() {
        return contactMeans;
    }

    public void setContactMeans(String contactMeans) {
        this.contactMeans = contactMeans;
    }

    public Integer getDataLevel() {
        return dataLevel;
    }

    public void setDataLevel(Integer dataLevel) {
        this.dataLevel = dataLevel;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getReportAccount() {
        return reportAccount;
    }

    public void setReportAccount(String reportAccount) {
        this.reportAccount = reportAccount;
    }

    public String getQueryAccount() {
        return queryAccount;
    }

    public void setQueryAccount(String queryAccount) {
        this.queryAccount = queryAccount;
    }

    public Long getLoginTimes() {
        return loginTimes;
    }

    public void setLoginTimes(Long loginTimes) {
        this.loginTimes = loginTimes;
    }

    public Integer getCreateType() {
        return createType;
    }

    public void setCreateType(Integer createType) {
        this.createType = createType;
    }
}