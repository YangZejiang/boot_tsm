package com.yzj.core.entity.vo;

public class AdmNewOrder {
    private String isbn;
    private String title;
    private Integer stockQuantity;
    // 全校这本书订购数量
    private Integer isbnorderNum;
    // 是否已有对外订购订单
    private Integer isProcessing;

    public Integer getIsProcessing() {
        return isProcessing;
    }

    public void setIsProcessing(Integer isProcessing) {
        this.isProcessing = isProcessing;
    }

    // 缺的数量 lack = isbnorderNum - stockQuantity
    private Integer lack;

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

    public Integer getLack() {
        return lack;
    }

    public void setLack(Integer lack) {
        this.lack = lack;
    }


}
