package com.team.cms.pojo;

public class CmsWebsite {
    /**
     * 编号
     */
    private String id;

    /**
     * 域名
     */
    private String domainName;

    /**
     * 公司地址
     */
    private String address;

    /**
     * 联系电话
     */
    private String telphone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 主营产品
     */
    private String mainProduct;

    /**
     * 首页关键字
     */
    private String keywords;

    /**
     * 网站描述
     */
    private String description;

    /**
     * 
     */
    private String name;

    /**
     * 
     */
    private String copyright;

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
     * 域名
     * @return DOMAIN_NAME 域名
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

    /**
     * 公司地址
     * @return address 公司地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 公司地址
     * @param address 公司地址
     */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    /**
     * 联系电话
     * @return telphone 联系电话
     */
    public String getTelphone() {
        return telphone;
    }

    /**
     * 联系电话
     * @param telphone 联系电话
     */
    public void setTelphone(String telphone) {
        this.telphone = telphone == null ? null : telphone.trim();
    }

    /**
     * 邮箱
     * @return email 邮箱
     */
    public String getEmail() {
        return email;
    }

    /**
     * 邮箱
     * @param email 邮箱
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * 主营产品
     * @return main_product 主营产品
     */
    public String getMainProduct() {
        return mainProduct;
    }

    /**
     * 主营产品
     * @param mainProduct 主营产品
     */
    public void setMainProduct(String mainProduct) {
        this.mainProduct = mainProduct == null ? null : mainProduct.trim();
    }

    /**
     * 首页关键字
     * @return keywords 首页关键字
     */
    public String getKeywords() {
        return keywords;
    }

    /**
     * 首页关键字
     * @param keywords 首页关键字
     */
    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    /**
     * 网站描述
     * @return description 网站描述
     */
    public String getDescription() {
        return description;
    }

    /**
     * 网站描述
     * @param description 网站描述
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    /**
     * 
     * @return name 
     */
    public String getName() {
        return name;
    }

    /**
     * 
     * @param name 
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 
     * @return copyright 
     */
    public String getCopyright() {
        return copyright;
    }

    /**
     * 
     * @param copyright 
     */
    public void setCopyright(String copyright) {
        this.copyright = copyright == null ? null : copyright.trim();
    }
}