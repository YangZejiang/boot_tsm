package com.yzj.core.entity.po;

public class ScheduleStu {
    private Integer schStuId;

    private Integer stuId;

    private Integer corsId;

    public ScheduleStu(Integer schStuId, Integer stuId, Integer corsId) {
        this.schStuId = schStuId;
        this.stuId = stuId;
        this.corsId = corsId;
    }

    public ScheduleStu() {
        super();
    }

    public Integer getSchStuId() {
        return schStuId;
    }

    public void setSchStuId(Integer schStuId) {
        this.schStuId = schStuId;
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public Integer getCorsId() {
        return corsId;
    }

    public void setCorsId(Integer corsId) {
        this.corsId = corsId;
    }
}