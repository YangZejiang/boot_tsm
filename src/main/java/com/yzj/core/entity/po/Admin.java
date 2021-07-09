package com.yzj.core.entity.po;

public class Admin {
    private Integer admId;

    private String admPassword;

    private String admName;

    private Integer status;

    private String phone;

    public Admin(Integer admId, String admPassword, String admName, Integer status, String phone) {
        this.admId = admId;
        this.admPassword = admPassword;
        this.admName = admName;
        this.status = status;
        this.phone = phone;
    }

    public Admin() {
        super();
    }

    public Integer getAdmId() {
        return admId;
    }

    public void setAdmId(Integer admId) {
        this.admId = admId;
    }

    public String getAdmPassword() {
        return admPassword;
    }

    public void setAdmPassword(String admPassword) {
        this.admPassword = admPassword == null ? null : admPassword.trim();
    }

    public String getAdmName() {
        return admName;
    }

    public void setAdmName(String admName) {
        this.admName = admName == null ? null : admName.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
}