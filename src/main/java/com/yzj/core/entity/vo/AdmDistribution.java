package com.yzj.core.entity.vo;

public class AdmDistribution implements Comparable<AdmDistribution> {
    private Integer classId;
    private String stuName;
    private String phone;
    private Integer doneNum;

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getDoneNum() {
        return doneNum;
    }

    public void setDoneNum(Integer doneNum) {
        this.doneNum = doneNum;
    }

    // 重写Comparable接口的compareTo方法
    // 根据doneNum降序排列，升序修改相减顺序即可
    @Override
    public int compareTo(AdmDistribution admDistribution) {
        return admDistribution.getDoneNum() - this.doneNum;
    }
}
