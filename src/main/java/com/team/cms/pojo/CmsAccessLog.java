package com.team.cms.pojo;

import java.util.Date;

public class CmsAccessLog {
    /**
     * 日志编号
     */
    private String logId;

    /**
     * 创建时间
     */
    private Date createtime;

    /**
     * 文章编号
     */
    private String articleId;

    /**
     * ip地址
     */
    private String ip;

    /**
     * 日志编号
     * @return log_id 日志编号
     */
    public String getLogId() {
        return logId;
    }

    /**
     * 日志编号
     * @param logId 日志编号
     */
    public void setLogId(String logId) {
        this.logId = logId == null ? null : logId.trim();
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
     * ip地址
     * @return ip ip地址
     */
    public String getIp() {
        return ip;
    }

    /**
     * ip地址
     * @param ip ip地址
     */
    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }
}