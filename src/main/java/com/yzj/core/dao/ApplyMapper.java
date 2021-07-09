package com.yzj.core.dao;

import com.yzj.core.entity.po.Apply;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.Map;

public interface ApplyMapper {
    int deleteByPrimaryKey(Integer applyId);

    int insert(Apply record);

    int insertSelective(Apply record);

    Apply selectByPrimaryKey(Integer applyId);

    int updateByPrimaryKeySelective(Apply record);

    int updateByPrimaryKey(Apply record);

    int countByCorsidAndIsbn(@Param("corsId") Integer corsId, @Param("isbn") String isbn);

    Map<String, Object> findSelfQuickFillInInfo(@Param("cdtlId") String cdtlId, @Param("tchId") Integer tchId);

    Map<String, Object> findAllQuickFillInInfo(@Param("cdtlId") String cdtlId);

    int updateStatusByClassidAndSemesterAndIsbn(@Param("classId") Integer classId, @Param("semester") String selectedSem, @Param("isbn") String isbn);
}