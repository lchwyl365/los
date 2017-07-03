package com.team.cms.pojo;

import java.util.Date;

public class CmsBanner {
    /**
     * 编号
     */
    private String bannerId;

    /**
     * 标题
     */
    private String bannerTitle;

    /**
     * 类型
     */
    private String type;

    /**
     * 图片
     */
    private String img;

    /**
     * 创建时间
     */
    private Date createtime;

    /**
     * 序号
     */
    private Integer orderNum;

    /**
     * 域名
     */
    private String domainName;

    /**
     * 编号
     * @return banner_id 编号
     */
    public String getBannerId() {
        return bannerId;
    }

    /**
     * 编号
     * @param bannerId 编号
     */
    public void setBannerId(String bannerId) {
        this.bannerId = bannerId == null ? null : bannerId.trim();
    }

    /**
     * 标题
     * @return banner_title 标题
     */
    public String getBannerTitle() {
        return bannerTitle;
    }

    /**
     * 标题
     * @param bannerTitle 标题
     */
    public void setBannerTitle(String bannerTitle) {
        this.bannerTitle = bannerTitle == null ? null : bannerTitle.trim();
    }

    /**
     * 类型
     * @return type 类型
     */
    public String getType() {
        return type;
    }

    /**
     * 类型
     * @param type 类型
     */
    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    /**
     * 图片
     * @return img 图片
     */
    public String getImg() {
        return img;
    }

    /**
     * 图片
     * @param img 图片
     */
    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
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

    /**
     * 序号
     * @return order_num 序号
     */
    public Integer getOrderNum() {
        return orderNum;
    }

    /**
     * 序号
     * @param orderNum 序号
     */
    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    /**
     * 域名
     * @return domain_name 域名
     */
    public String getDomainName() {
        return domainName;
    }

    /**
     * 域名
     * @param domainName 域名
     */
    public void setDomainName(String domainName) {
        this.domainName = domainName == null ? null : domainName.trim();
    }
}