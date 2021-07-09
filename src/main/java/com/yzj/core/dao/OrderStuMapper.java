package com.yzj.core.dao;

import com.yzj.core.entity.po.OrderStu;
import org.apache.ibatis.annotations.Param;

public interface OrderStuMapper {
    int deleteByPrimaryKey(Integer oStuId);

    int insert(OrderStu record);

    int insertSelective(OrderStu record);

    OrderStu selectByPrimaryKey(Integer oStuId);

    int updateByPrimaryKeySelective(OrderStu record);

    int updateByPrimaryKey(OrderStu record);

    int countByStuIdAndApplyId(@Param("stuId") Integer stuId, @Param("applyId") Integer applyId);

    int updateStatusByClassidAndSemesterAndIsbn(@Param("classId") Integer classId, @Param("semester") String semester, @Param("isbn") String isbn);

    int updateByApplyId(Integer applyId);
}