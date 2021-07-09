package com.yzj.core.entity.po;

public class Coursedtl {
    private String cdtlId;

    private String cdtlName;

    private Integer credit;

    private Integer creditHour;

    private String attribution;

    private String nature;

    private String campusCode;

    private String college;

    private String examTime;

    private Integer status;

    public Coursedtl(String cdtlId, String cdtlName, Integer credit, Integer creditHour, String attribution, String nature, String campusCode, String college, String examTime, Integer status) {
        this.cdtlId = cdtlId;
        this.cdtlName = cdtlName;
        this.credit = credit;
        this.creditHour = creditHour;
        this.attribution = attribution;
        this.nature = nature;
        this.campusCode = campusCode;
        this.college = college;
        this.examTime = examTime;
        this.status = status;
    }

    public Coursedtl() {
        super();
    }

    public String getCdtlId() {
        return cdtlId;
    }

    public void setCdtlId(String cdtlId) {
        this.cdtlId = cdtlId == null ? null : cdtlId.trim();
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

    public String getAttribution() {
        return attribution;
    }

    public void setAttribution(String attribution) {
        this.attribution = attribution == null ? null : attribution.trim();
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

    public String getExamTime() {
        return examTime;
    }

    public void setExamTime(String examTime) {
        this.examTime = examTime == null ? null : examTime.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}