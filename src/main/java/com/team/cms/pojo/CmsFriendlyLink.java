package com.team.cms.pojo;

import java.util.Date;

public class CmsFriendlyLink {
    /**
     * 编号
     */
    private String id;

    /**
     * 网址
     */
    private String url;

    /**
     * 网址名称
     */
    private String name;

    /**
     * 排列位置
     */
    private Integer orderNum;

    /**
     * 网站logo
     */
    private String logo;

    /**
     * 操作员域名
     */
    private String domain;

    /**
     * 创建时间
     */
    private Date createtime;

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
     * 网址
     * @return url 网址
     */
    public String getUrl() {
        return url;
    }

    /**
     * 网址
     * @param url 网址
     */
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    /**
     * 网址名称
     * @return name 网址名称
     */
    public String getName() {
        return name;
    }

    /**
     * 网址名称
     * @param name 网址名称
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 排列位置
     * @return order_num 排列位置
     */
    public Integer getOrderNum() {
        return orderNum;
    }

    /**
     * 排列位置
     * @param orderNum 排列位置
     */
    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    /**
     * 网站logo
     * @return logo 网站logo
     */
    public String getLogo() {
        return logo;
    }

    /**
     * 网站logo
     * @param logo 网站logo
     */
    public void setLogo(String logo) {
        this.logo = logo == null ? null : logo.trim();
    }

    /**
     * 操作员域名
     * @return domain 操作员域名
     */
    public String getDomain() {
        return domain;
    }

    /**
     * 操作员域名
     * @param domain 操作员域名
     */
    public void setDomain(String domain) {
        this.domain = domain == null ? null : domain.trim();
    }

    /**
     * 创建时间
     * @return createtime 创建时间
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * 创建时间
     * @param createtime 创建时间
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}