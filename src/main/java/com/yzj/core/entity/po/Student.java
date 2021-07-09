package com.yzj.core.entity.po;

public class Student {
    private Integer stuId;

    private String stuPassword;

    private String stuName;

    private Integer grade;

    private Integer classId;

    private String phone;

    private Boolean isMonitor;

    private Integer status;

    public Student(Integer stuId, String stuPassword, String stuName, Integer grade, Integer classId, String phone, Boolean isMonitor, Integer status) {
        this.stuId = stuId;
        this.stuPassword = stuPassword;
        this.stuName = stuName;
        this.grade = grade;
        this.classId = classId;
        this.phone = phone;
        this.isMonitor = isMonitor;
        this.status = status;
    }

    public Student() {
        super();
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getStuPassword() {
        return stuPassword;
    }

    public void setStuPassword(String stuPassword) {
        this.stuPassword = stuPassword == null ? null : stuPassword.trim();
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Boolean getIsMonitor() {
        return isMonitor;
    }

    public void setIsMonitor(Boolean isMonitor) {
        this.isMonitor = isMonitor;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}