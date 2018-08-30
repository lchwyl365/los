package com.team.cms.pojo;

import java.util.Date;

public class CmsApply {
    /**
     * 编号
     */
    private String id;

    /**
     * 用户名
     */
    private String name;

    /**
     * 电话
     */
    private String telphone;

    /**
     * 申请信息
     */
    private String content;

    /**
     * 
     */
    private Date createtime;

    /**
     * 
     */
    private String domainName;

    /**
     * 编号
     * @return id 编号
     */
    public String getId() {
        return id;
    }

    /**
     * 编号
     * @param id 编号
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * 用户名
     * @return name 用户名
     */
    public String getName() {
        return name;
    }

    /**
     * 用户名
     * @param name 用户名
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 电话
     * @return telphone 电话
     */
    public String getTelphone() {
        return telphone;
    }

    /**
     * 电话
     * @param telphone 电话
     */
    public void setTelphone(String telphone) {
        this.telphone = telphone == null ? null : telphone.trim();
    }

    /**
     * 申请信息
     * @return content 申请信息
     */
    public String getContent() {
        return content;
    }

    /**
     * 申请信息
     * @param content 申请信息
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * 
     * @return createtime 
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * 
     * @param createtime 
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * 
     * @return domain_name 
     */
    public String getDomainName() {
        return domainName;
    }

    /**
     * 
     * @param domainName 
     */
    public void setDomainName(String domainName) {
        this.domainName = domainName == null ? null : domainName.trim();
    }
}