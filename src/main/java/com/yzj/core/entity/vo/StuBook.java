package com.yzj.core.entity.vo;

public class StuBook {
    private Integer stuId;

    private String cdtlName;

    private String semester;

    private Integer applyId;

    private String tchName;

    private String title;

    private String isbn;

    private String nature;

    public StuBook(Integer stuId, String cdtlName, String semester, Integer applyId, String tchName, String title, String isbn, String nature) {
        this.stuId = stuId;
        this.cdtlName = cdtlName;
        this.semester = semester;
        this.applyId = applyId;
        this.tchName = tchName;
        this.title = title;
        this.isbn = isbn;
        this.nature = nature;
    }

    public StuBook() {
        super();
    }

    public Integer getStuId() {
        return stuId;
    }

    public void setStuId(Integer stuId) {
        this.stuId = stuId;
    }

    public String getCdtlName() {
        return cdtlName;
    }

    public void setCdtlName(String cdtlName) {
        this.cdtlName = cdtlName == null ? null : cdtlName.trim();
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester == null ? null : semester.trim();
    }

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public String getTchName() {
        return tchName;
    }

    public void setTchName(String tchName) {
        this.tchName = tchName == null ? null : tchName.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature == null ? null : nature.trim();
    }
}