package com.yzj.core.entity.vo;

public class StuOrder {
    private Integer oStuId;

    private Integer stuId;

    private String semester;

    private String isbn;

    private String title;

    private String cdtlName;

    private Integer status;

    public StuOrder(Integer oStuId, Integer stuId, String semester, String isbn, String title, String cdtlName, Integer status) {
        this.oStuId = oStuId;
        this.stuId = stuId;
        this.semester = semester;
        this.isbn = isbn;
        this.title = title;
        this.cdtlName = cdtlName;
        this.status = status;
    }

    public StuOrder() {
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

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester == null ? null : semester.trim();
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

    public String getCdtlName() {
        return cdtlName;
    }

    public void setCdtlName(String cdtlName) {
        this.cdtlName = cdtlName == null ? null : cdtlName.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}