package com.team.cms.pojo;

import java.util.Date;

public class CrmVideo {
    /**
     * 视频编号
     */
    private String videoId;

    /**
     * 视频标题
     */
    private String videoTitle;

    /**
     * 视频图片
     */
    private String videoImage;

    /**
     * 视频描述
     */
    private String videoDesc;

    /**
     * 发布时间
     */
    private Date createtime;

    /**
     * 顶部显示
     */
    private String istop;

    /**
     * 序号
     */
    private Integer ordernum;

    /**
     * 点击次数
     */
    private Integer clicks;

    /**
     * 优酷编号
     */
    private String youkuid;

    /**
     * 视频地址
     */
    private String address;

    /**
     * 视频编号
     * @return video_id 视频编号
     */
    public String getVideoId() {
        return videoId;
    }

    /**
     * 视频编号
     * @param videoId 视频编号
     */
    public void setVideoId(String videoId) {
        this.videoId = videoId == null ? null : videoId.trim();
    }

    /**
     * 视频标题
     * @return video_title 视频标题
     */
    public String getVideoTitle() {
        return videoTitle;
    }

    /**
     * 视频标题
     * @param videoTitle 视频标题
     */
    public void setVideoTitle(String videoTitle) {
        this.videoTitle = videoTitle == null ? null : videoTitle.trim();
    }

    /**
     * 视频图片
     * @return video_image 视频图片
     */
    public String getVideoImage() {
        return videoImage;
    }

    /**
     * 视频图片
     * @param videoImage 视频图片
     */
    public void setVideoImage(String videoImage) {
        this.videoImage = videoImage == null ? null : videoImage.trim();
    }

    /**
     * 视频描述
     * @return video_desc 视频描述
     */
    public String getVideoDesc() {
        return videoDesc;
    }

    /**
     * 视频描述
     * @param videoDesc 视频描述
     */
    public void setVideoDesc(String videoDesc) {
        this.videoDesc = videoDesc == null ? null : videoDesc.trim();
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
     * 顶部显示
     * @return istop 顶部显示
     */
    public String getIstop() {
        return istop;
    }

    /**
     * 顶部显示
     * @param istop 顶部显示
     */
    public void setIstop(String istop) {
        this.istop = istop == null ? null : istop.trim();
    }

    /**
     * 序号
     * @return ordernum 序号
     */
    public Integer getOrdernum() {
        return ordernum;
    }

    /**
     * 序号
     * @param ordernum 序号
     */
    public void setOrdernum(Integer ordernum) {
        this.ordernum = ordernum;
    }

    /**
     * 点击次数
     * @return clicks 点击次数
     */
    public Integer getClicks() {
        return clicks;
    }

    /**
     * 点击次数
     * @param clicks 点击次数
     */
    public void setClicks(Integer clicks) {
        this.clicks = clicks;
    }

    /**
     * 优酷编号
     * @return youkuid 优酷编号
     */
    public String getYoukuid() {
        return youkuid;
    }

    /**
     * 优酷编号
     * @param youkuid 优酷编号
     */
    public void setYoukuid(String youkuid) {
        this.youkuid = youkuid == null ? null : youkuid.trim();
    }

    /**
     * 视频地址
     * @return address 视频地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 视频地址
     * @param address 视频地址
     */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }
}