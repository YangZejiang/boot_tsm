package com.yzj.core.dao;

import com.yzj.core.entity.vo.StuDistribution;
import com.yzj.core.entity.vo.StuDistributionDtl;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StuDistributionMapper {
    List<StuDistribution> selectByclassIdAndSemester(@Param("classId") Integer classId, @Param("semester") String semester);

    List<StuDistributionDtl> selectDtlByclassIdAndSemester(@Param("classId") Integer classId, @Param("semester") String semester);
}