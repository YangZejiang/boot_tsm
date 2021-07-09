package com.yzj.core.entity.po;

public class Course {
    private Integer corsId;

    private String semester;

    private Integer tchId;

    private String cdtlId;

    private Integer status;

    public Course(Integer corsId, String semester, Integer tchId, String cdtlId, Integer status) {
        this.corsId = corsId;
        this.semester = semester;
        this.tchId = tchId;
        this.cdtlId = cdtlId;
        this.status = status;
    }

    public Course() {
        super();
    }

    public Integer getCorsId() {
        return corsId;
    }

    public void setCorsId(Integer corsId) {
        this.corsId = corsId;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester == null ? null : semester.trim();
    }

    public Integer getTchId() {
        return tchId;
    }

    public void setTchId(Integer tchId) {
        this.tchId = tchId;
    }

    public String getCdtlId() {
        return cdtlId;
    }

    public void setCdtlId(String cdtlId) {
        this.cdtlId = cdtlId == null ? null : cdtlId.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}