package com.yzj.core.service;

import com.yzj.core.entity.vo.StuBook;
import com.yzj.core.entity.vo.StuDistribution;
import com.yzj.core.entity.vo.StuDistributionDtl;
import com.yzj.core.entity.vo.StuOrder;

import java.util.List;
import java.util.Map;

public interface StudentService {
    List<StuBook> getBookList(Integer id, String semester);

    List<StuOrder> getOrderList(Integer id, String semester);

    int add(Integer stuId, Integer applyId);

    int delete(Integer id);

    Map<String, Object> findBookInfo(Integer applyId, String isbn);

    List<StuDistribution> getDistributionList(Integer classId, String semester);

    List<StuDistributionDtl> getDistributionDtlList(Integer classId, String semester);
}
