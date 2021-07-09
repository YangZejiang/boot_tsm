package com.yzj.core.dao;

import com.yzj.core.entity.vo.StuBook;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VIStuBookMapper {
    int insert(StuBook record);

    int insertSelective(StuBook record);

    List<StuBook> selectByIdAndSemester(@Param("id") Integer id, @Param("semester") String semester);
}