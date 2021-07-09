package com.yzj.core.entity.vo;

public class TchApply {
    private Integer applyId;

    private String isbn;

    private String title;

    private String semester;

    private Integer tchId;

    private String cdtlId;

    private String cdtlName;
    private Integer start;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    private Integer status;

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    private Integer rows;

    public TchApply(Integer applyId, String isbn, String title, String semester, Integer tchId, String cdtlId, String cdtlName) {
        this.applyId = applyId;
        this.isbn = isbn;
        this.title = title;
        this.semester = semester;
        this.tchId = tchId;
        this.cdtlId = cdtlId;
        this.cdtlName = cdtlName;
    }

    public TchApply() {
        super();
    }

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
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

    public String getCdtlName() {
        return cdtlName;
    }

    public void setCdtlName(String cdtlName) {
        this.cdtlName = cdtlName == null ? null : cdtlName.trim();
    }
}