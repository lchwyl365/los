package com.team.cms.pojo;

import java.util.Date;

public class CmsChannel {
    /**
     * 栏目编号
     */
    private String channelId;

    /**
     * 栏目名称
     */
    private String channelName;

    /**
     * 排列顺序
     */
    private Integer channelSort;

    /**
     * 顶级栏目
     */
    private String istop;

    /**
     * 栏目类型
     */
    private String channelType;

    /**
     * 上级栏目编号
     */
    private String pid;

    /**
     * 发布时间
     */
    private Date createtime;

    /**
     * 链接地址
     */
    private String url;

    /**
     * 状态
     */
    private String status;

    /**
     * 栏目内容
     */
    private String content;

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
     * 栏目名称
     * @return channel_name 栏目名称
     */
    public String getChannelName() {
        return channelName;
    }

    /**
     * 栏目名称
     * @param channelName 栏目名称
     */
    public void setChannelName(String channelName) {
        this.channelName = channelName == null ? null : channelName.trim();
    }

    /**
     * 排列顺序
     * @return channel_sort 排列顺序
     */
    public Integer getChannelSort() {
        return channelSort;
    }

    /**
     * 排列顺序
     * @param channelSort 排列顺序
     */
    public void setChannelSort(Integer channelSort) {
        this.channelSort = channelSort;
    }

    /**
     * 顶级栏目
     * @return istop 顶级栏目
     */
    public String getIstop() {
        return istop;
    }

    /**
     * 顶级栏目
     * @param istop 顶级栏目
     */
    public void setIstop(String istop) {
        this.istop = istop == null ? null : istop.trim();
    }

    /**
     * 栏目类型
     * @return channel_type 栏目类型
     */
    public String getChannelType() {
        return channelType;
    }

    /**
     * 栏目类型
     * @param channelType 栏目类型
     */
    public void setChannelType(String channelType) {
        this.channelType = channelType == null ? null : channelType.trim();
    }

    /**
     * 上级栏目编号
     * @return pid 上级栏目编号
     */
    public String getPid() {
        return pid;
    }

    /**
     * 上级栏目编号
     * @param pid 上级栏目编号
     */
    public void setPid(String pid) {
        this.pid = pid == null ? null : pid.trim();
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
     * 链接地址
     * @return url 链接地址
     */
    public String getUrl() {
        return url;
    }

    /**
     * 链接地址
     * @param url 链接地址
     */
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
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
     * 栏目内容
     * @return content 栏目内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 栏目内容
     * @param content 栏目内容
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}