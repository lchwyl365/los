package com.team.platform.pojo;

public class AuthTest {
    /**
     * ���Ա��
     */
    private String testid;

    /**
     * ����
     */
    private String groupId;

    /**
     * ��������
     */
    private String testname;

    /**
     * ������
     */
    private String testgroup;

    /**
     * 
     */
    private String deptId;

    /**
     * ���Ա��
     * @return TESTID ���Ա��
     */
    public String getTestid() {
        return testid;
    }

    /**
     * ���Ա��
     * @param testid ���Ա��
     */
    public void setTestid(String testid) {
        this.testid = testid == null ? null : testid.trim();
    }

    /**
     * ����
     * @return GROUP_ID ����
     */
    public String getGroupId() {
        return groupId;
    }

    /**
     * ����
     * @param groupId ����
     */
    public void setGroupId(String groupId) {
        this.groupId = groupId == null ? null : groupId.trim();
    }

    /**
     * ��������
     * @return TESTNAME ��������
     */
    public String getTestname() {
        return testname;
    }

    /**
     * ��������
     * @param testname ��������
     */
    public void setTestname(String testname) {
        this.testname = testname == null ? null : testname.trim();
    }

    /**
     * ������
     * @return TESTGROUP ������
     */
    public String getTestgroup() {
        return testgroup;
    }

    /**
     * ������
     * @param testgroup ������
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