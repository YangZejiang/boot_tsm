package com.yzj.core.entity.vo;

public class TchCourse {
    private Integer corsId;

    private String semester;

    private Integer tchId;

    private String cdtlId;

    private Integer status;

    private String cdtlName;

    private Integer credit;

    private Integer creditHour;

    private String nature;

    private String campusCode;

    private String college;

    private String attribution;

    public TchCourse(Integer corsId, String semester, Integer tchId, String cdtlId, Integer status, String cdtlName, Integer credit, Integer creditHour, String nature, String campusCode, String college, String attribution) {
        this.corsId = corsId;
        this.semester = semester;
        this.tchId = tchId;
        this.cdtlId = cdtlId;
        this.status = status;
        this.cdtlName = cdtlName;
        this.credit = credit;
        this.creditHour = creditHour;
        this.nature = nature;
        this.campusCode = campusCode;
        this.college = college;
        this.attribution = attribution;
    }

    public TchCourse() {
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

    public String getCdtlName() {
        return cdtlName;
    }

    public void setCdtlName(String cdtlName) {
        this.cdtlName = cdtlName == null ? null : cdtlName.trim();
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public Integer getCreditHour() {
        return creditHour;
    }

    public void setCreditHour(Integer creditHour) {
        this.creditHour = creditHour;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature == null ? null : nature.trim();
    }

    public String getCampusCode() {
        return campusCode;
    }

    public void setCampusCode(String campusCode) {
        this.campusCode = campusCode == null ? null : campusCode.trim();
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college == null ? null : college.trim();
    }

    public String getAttribution() {
        return attribution;
    }

    public void setAttribution(String attribution) {
        this.attribution = attribution == null ? null : attribution.trim();
    }
}