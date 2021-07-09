package com.yzj.core.dao;

import com.yzj.core.entity.vo.StuOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VIStuOrderMapper {
    int insert(StuOrder record);

    int insertSelective(StuOrder record);

    List<StuOrder> selectByIdAndSemester(@Param("id") Integer id, @Param("semester") String semester);
}