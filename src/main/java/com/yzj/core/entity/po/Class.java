package com.yzj.core.entity.po;

public class Class {
    private Integer classId;

    private String college;

    private String department;

    private String major;

    public Class(Integer classId, String college, String department, String major) {
        this.classId = classId;
        this.college = college;
        this.department = department;
        this.major = major;
    }

    public Class() {
        super();
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college == null ? null : college.trim();
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department == null ? null : department.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }
}