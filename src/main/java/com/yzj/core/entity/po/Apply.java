package com.yzj.core.entity.po;

import java.math.BigDecimal;

public class Apply {
    private Integer applyId;

    private Integer corsId;

    private String isbn;

    private String title;

    private String author;

    private String press;

    private BigDecimal fixedPrice;

    private String imgUrl;

    private Integer status;

    public Apply(Integer applyId, Integer corsId, String isbn, String title, String author, String press, BigDecimal fixedPrice, String imgUrl, Integer status) {
        this.applyId = applyId;
        this.corsId = corsId;
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.press = press;
        this.fixedPrice = fixedPrice;
        this.imgUrl = imgUrl;
        this.status = status;
    }

    public Apply() {
        super();
    }

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public Integer getCorsId() {
        return corsId;
    }

    public void setCorsId(Integer corsId) {
        this.corsId = corsId;
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

    public BigDecimal getFixedPrice() {
        return fixedPrice;
    }

    public void setFixedPrice(BigDecimal fixedPrice) {
        this.fixedPrice = fixedPrice;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}