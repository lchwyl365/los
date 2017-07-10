package com.team.platform.pojo;

public class AuthTest {
    /**
     * 测试编号
     */
    private String testid;

    /**
     * 组编号
     */
    private String groupId;

    /**
     * 测试名称
     */
    private String testname;

    /**
     * 组名称
     */
    private String testgroup;

    /**
     * 
     */
    private String deptId;

    /**
     * 测试编号
     * @return TESTID 测试编号
     */
    public String getTestid() {
        return testid;
    }

    /**
     * 测试编号
     * @param testid 测试编号
     */
    public void setTestid(String testid) {
        this.testid = testid == null ? null : testid.trim();
    }

    /**
     * 组编号
     * @return GROUP_ID 组编号
     */
    public String getGroupId() {
        return groupId;
    }

    /**
     * 组编号
     * @param groupId 组编号
     */
    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    /**
     * 测试名称
     * @return TESTNAME 测试名称
     */
    public String getTestname() {
        return testname;
    }

    /**
     * 测试名称
     * @param testname 测试名称
     */
    public void setTestname(String testname) {
        this.testname = testname == null ? null : testname.trim();
    }

    /**
     * 组名称
     * @return TESTGROUP 组名称
     */
    public String getTestgroup() {
        return testgroup;
    }

    /**
     * 组名称
     * @param testgroup 组名称
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