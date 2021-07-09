package com.yzj.core.entity.vo;

public class StuDistribution {
    private String semester;
    private String isbn;
    private String title;
    private String author;
    private String press;
    private Integer classId;
    private int num;
    private Integer status;

    public StuDistribution(String semester, String isbn, String title, String author, String press, Integer classId, Integer num, Integer status) {
        this.semester = semester;
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.press = press;
        this.classId = classId;
        this.num = num;
        this.status = status;
    }

    public StuDistribution() {
        super();
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press == null ? null : press.trim();
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
