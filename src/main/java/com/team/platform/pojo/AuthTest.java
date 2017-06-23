package com.team.platform.pojo;

public class AuthTest {
    /**
     * ²âÊÔ±àºÅ
     */
    private String testid;

    /**
     * ×é±àºÅ
     */
    private String groupId;

    /**
     * ²âÊÔÃû³Æ
     */
    private String testname;

    /**
     * ×éÃû³Æ
     */
    private String testgroup;

    /**
     * 
     */
    private String deptId;

    /**
     * ²âÊÔ±àºÅ
     * @return TESTID ²âÊÔ±àºÅ
     */
    public String getTestid() {
        return testid;
    }

    /**
     * ²âÊÔ±àºÅ
     * @param testid ²âÊÔ±àºÅ
     */
    public void setTestid(String testid) {
        this.testid = testid == null ? null : testid.trim();
    }

    /**
     * ×é±àºÅ
     * @return GROUP_ID ×é±àºÅ
     */
    public String getGroupId() {
        return groupId;
    }

    /**
     * ×é±àºÅ
     * @param groupId ×é±àºÅ
     */
    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    /**
     * ²âÊÔÃû³Æ
     * @return TESTNAME ²âÊÔÃû³Æ
     */
    public String getTestname() {
        return testname;
    }

    /**
     * ²âÊÔÃû³Æ
     * @param testname ²âÊÔÃû³Æ
     */
    public void setTestname(String testname) {
        this.testname = testname == null ? null : testname.trim();
    }

    /**
     * ×éÃû³Æ
     * @return TESTGROUP ×éÃû³Æ
     */
    public String getTestgroup() {
        return testgroup;
    }

    /**
     * ×éÃû³Æ
     * @param testgroup ×éÃû³Æ
     */
    public void setTestgroup(String testgroup) {
        this.testgroup = testgroup == null ? null : testgroup.trim();
    }

    /**
     * 
     * @return DEPT_ID 
     */
    public String getDeptId() {
        return deptId;
    }

    /**
     * 
     * @param deptId 
     */
    public void setDeptId(String deptId) {
        this.deptId = deptId == null ? null : deptId.trim();
    }
}