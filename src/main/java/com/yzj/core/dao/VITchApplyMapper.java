package com.yzj.core.dao;

import com.yzj.core.entity.vo.StuBook;
import com.yzj.core.entity.vo.TchApply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VITchApplyMapper {
    int insert(TchApply record);

    int insertSelective(TchApply record);

    List<TchApply> selectByIdAndSemester(@Param("id") Integer id, @Param("semester") String semester);

    List<TchApply> selectByTchApply(TchApply tchApply);

    int countByTchApply(TchApply tchApply);
}