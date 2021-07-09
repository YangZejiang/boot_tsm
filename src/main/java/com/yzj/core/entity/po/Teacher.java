package com.yzj.core.entity.po;

public class Teacher {
    private Integer tchId;

    private String tchPassword;

    private String tchName;

    private String phone;

    private Integer status;

    private String faculty;

    public Teacher(Integer tchId, String tchPassword, String tchName, String phone, Integer status, String faculty) {
        this.tchId = tchId;
        this.tchPassword = tchPassword;
        this.tchName = tchName;
        this.phone = phone;
        this.status = status;
        this.faculty = faculty;
    }

    public Teacher() {
        super();
    }

    public Integer getTchId() {
        return tchId;
    }

    public void setTchId(Integer tchId) {
        this.tchId = tchId;
    }

    public String getTchPassword() {
        return tchPassword;
    }

    public void setTchPassword(String tchPassword) {
        this.tchPassword = tchPassword == null ? null : tchPassword.trim();
    }

    public String getTchName() {
        return tchName;
    }

    public void setTchName(String tchName) {
        this.tchName = tchName == null ? null : tchName.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty == null ? null : faculty.trim();
    }
}