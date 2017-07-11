package com.team.cms.pojo;

public class CmsMember {
    /**
     * 编号
     */
    private String id;

    /**
     * 会员编号
     */
    private String memberId;

    /**
     * 会员名称
     */
    private String memberName;

    /**
     * 会员性别
     */
    private String sex;

    /**
     * 入会时间
     */
    private String createtime;

    /**
     * 级位段位
     */
    private String dan;

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
     * 会员编号
     * @return member_id 会员编号
     */
    public String getMemberId() {
        return memberId;
    }

    /**
     * 会员编号
     * @param memberId 会员编号
     */
    public void setMemberId(String memberId) {
        this.memberId = memberId == null ? null : memberId.trim();
    }

    /**
     * 会员名称
     * @return member_name 会员名称
     */
    public String getMemberName() {
        return memberName;
    }

    /**
     * 会员名称
     * @param memberName 会员名称
     */
    public void setMemberName(String memberName) {
        this.memberName = memberName == null ? null : memberName.trim();
    }

    /**
     * 会员性别
     * @return sex 会员性别
     */
    public String getSex() {
        return sex;
    }

    /**
     * 会员性别
     * @param sex 会员性别
     */
    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    /**
     * 入会时间
     * @return createtime 入会时间
     */
    public String getCreatetime() {
        return createtime;
    }

    /**
     * 入会时间
     * @param createtime 入会时间
     */
    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    /**
     * 级位段位
     * @return dan 级位段位
     */
    public String getDan() {
        return dan;
    }

    /**
     * 级位段位
     * @param dan 级位段位
     */
    public void setDan(String dan) {
        this.dan = dan == null ? null : dan.trim();
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