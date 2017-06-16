package com.team.platform.pojo;

public class AuthTest extends AuthTestKey {
    /**
     * 测试名称
     */
    private String testname;

    /**
     * 组名称
     */
    private String testgroup;

    /**
     * null
     */
    private String deptId;

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
     * null
     * @return DEPT_ID null
     */
    public String getDeptId() {
        return deptId;
    }

    /**
     * null
     * @param deptId null
     */
    public void setDeptId(String deptId) {
        this.deptId = deptId == null ? null : deptId.trim();
    }
}