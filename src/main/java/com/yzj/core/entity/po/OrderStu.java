package com.yzj.core.entity.po;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class OrderStu {
    private Integer oStuId;

    private Integer stuId;

    private Integer applyId;

    private Integer status;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    public OrderStu(Integer oStuId, Integer stuId, Integer applyId, Integer status, Date createTime) {
        this.oStuId = oStuId;
        this.stuId = stuId;
        this.applyId = applyId;
        this.status = status;
        this.createTime = createTime;
    }

    public OrderStu() {
        super();
    }

    public Integer getoStuId() {
        return oStuId;
    }

    public void setoStuId(Integer oStuId) {
        this.oStuId = oStuId;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}