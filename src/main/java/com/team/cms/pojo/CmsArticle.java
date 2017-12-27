package com.team.cms.pojo;

import java.util.Date;

public class CmsArticle {
    /**
     * 文章编号
     */
    private String articleId;

    /**
     * 文章标题
     */
    private String title;

    /**
     * 文章内容
     */
    private String content;

    /**
     * 栏目编号
     */
    private String channelId;

    /**
     * 缩略图
     */
    private String thumbnail;

    /**
     * 关键字
     */
    private String keywords;

    /**
     * 文章描述
     */
    private String description;

    /**
     * 发布时间
     */
    private Date createtime;

    /**
     * 用户编号
     */
    private String userid;

    /**
     * 已读数量
     */
    private Integer readCount;

    /**
     * 状态
     */
    private String status;

    /**
     * 置顶序号
     */
    private Integer topNumber;

    /**
     * 域名
     */
    private String domainName;

    /**
     * 
     */
    private Integer recommend;

    /**
     * 文章编号
     * @return article_id 文章编号
     */
    public String getArticleId() {
        return articleId;
    }

    /**
     * 文章编号
     * @param articleId 文章编号
     */
    public void setArticleId(String articleId) {
        this.articleId = articleId == null ? null : articleId.trim();
    }

    /**
     * 文章标题
     * @return title 文章标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 文章标题
     * @param title 文章标题
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * 文章内容
     * @return content 文章内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 文章内容
     * @param content 文章内容
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * 栏目编号
     * @return channel_id 栏目编号
     */
    public String getChannelId() {
        return channelId;
    }

    /**
     * 栏目编号
     * @param channelId 栏目编号
     */
    public void setChannelId(String channelId) {
        this.channelId = channelId == null ? null : channelId.trim();
    }

    /**
     * 缩略图
     * @return thumbnail 缩略图
     */
    public String getThumbnail() {
        return thumbnail;
    }

    /**
     * 缩略图
     * @param thumbnail 缩略图
     */
    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail == null ? null : thumbnail.trim();
    }

    /**
     * 关键字
     * @return keywords 关键字
     */
    public String getKeywords() {
        return keywords;
    }

    /**
     * 关键字
     * @param keywords 关键字
     */
    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    /**
     * 文章描述
     * @return description 文章描述
     */
    public String getDescription() {
        return description;
    }

    /**
     * 文章描述
     * @param description 文章描述
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    /**
     * 发布时间
     * @return createtime 发布时间
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * 发布时间
     * @param createtime 发布时间
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * 用户编号
     * @return userid 用户编号
     */
    public String getUserid() {
        return userid;
    }

    /**
     * 用户编号
     * @param userid 用户编号
     */
    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    /**
     * 已读数量
     * @return read_count 已读数量
     */
    public Integer getReadCount() {
        return readCount;
    }

    /**
     * 已读数量
     * @param readCount 已读数量
     */
    public void setReadCount(Integer readCount) {
        this.readCount = readCount;
    }

    /**
     * 状态
     * @return status 状态
     */
    public String getStatus() {
        return status;
    }

    /**
     * 状态
     * @param status 状态
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    /**
     * 置顶序号
     * @return top_number 置顶序号
     */
    public Integer getTopNumber() {
        return topNumber;
    }

    /**
     * 置顶序号
     * @param topNumber 置顶序号
     */
    public void setTopNumber(Integer topNumber) {
        this.topNumber = topNumber;
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

    /**
     * 
     * @return recommend 
     */
    public Integer getRecommend() {
        return recommend;
    }

    /**
     * 
     * @param recommend 
     */
    public void setRecommend(Integer recommend) {
        this.recommend = recommend;
    }
}