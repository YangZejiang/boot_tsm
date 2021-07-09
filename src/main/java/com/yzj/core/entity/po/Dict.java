package com.yzj.core.entity.po;

public class Dict {
    private String dictId;

    private String dictTypeCode;

    private String dictTypeName;

    private String dictItemName;

    private String dictItemCode;

    private Integer dictSort;

    private Boolean dictEnable;

    private String dictMemo;

    public Dict(String dictId, String dictTypeCode, String dictTypeName, String dictItemName, String dictItemCode, Integer dictSort, Boolean dictEnable, String dictMemo) {
        this.dictId = dictId;
        this.dictTypeCode = dictTypeCode;
        this.dictTypeName = dictTypeName;
        this.dictItemName = dictItemName;
        this.dictItemCode = dictItemCode;
        this.dictSort = dictSort;
        this.dictEnable = dictEnable;
        this.dictMemo = dictMemo;
    }

    public Dict() {
        super();
    }

    public String getDictId() {
        return dictId;
    }

    public void setDictId(String dictId) {
        this.dictId = dictId == null ? null : dictId.trim();
    }

    public String getDictTypeCode() {
        return dictTypeCode;
    }

    public void setDictTypeCode(String dictTypeCode) {
        this.dictTypeCode = dictTypeCode == null ? null : dictTypeCode.trim();
    }

    public String getDictTypeName() {
        return dictTypeName;
    }

    public void setDictTypeName(String dictTypeName) {
        this.dictTypeName = dictTypeName == null ? null : dictTypeName.trim();
    }

    public String getDictItemName() {
        return dictItemName;
    }

    public void setDictItemName(String dictItemName) {
        this.dictItemName = dictItemName == null ? null : dictItemName.trim();
    }

    public String getDictItemCode() {
        return dictItemCode;
    }

    public void setDictItemCode(String dictItemCode) {
        this.dictItemCode = dictItemCode == null ? null : dictItemCode.trim();
    }

    public Integer getDictSort() {
        return dictSort;
    }

    public void setDictSort(Integer dictSort) {
        this.dictSort = dictSort;
    }

    public Boolean getDictEnable() {
        return dictEnable;
    }

    public void setDictEnable(Boolean dictEnable) {
        this.dictEnable = dictEnable;
    }

    public String getDictMemo() {
        return dictMemo;
    }

    public void setDictMemo(String dictMemo) {
        this.dictMemo = dictMemo == null ? null : dictMemo.trim();
    }
}