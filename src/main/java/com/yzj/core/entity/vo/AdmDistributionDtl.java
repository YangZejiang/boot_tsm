package com.yzj.core.entity.vo;


public class AdmDistributionDtl {

    private String isbn;

    private String title;

    // 全校这本书订购数量
    private Integer isbnorderNum;

    private Integer classorderNum;

    // 书本领取状态
    private Integer status;

    private Integer stockQuantity;

    public Integer getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(Integer stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public Integer getIsbnorderNum() {
        return isbnorderNum;
    }

    public void setIsbnorderNum(Integer isbnorderNum) {
        this.isbnorderNum = isbnorderNum;
    }

    public Integer getClassorderNum() {
        return classorderNum;
    }

    public void setClassorderNum(Integer classorderNum) {
        this.classorderNum = classorderNum;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
