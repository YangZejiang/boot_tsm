package com.yzj.core.dao;

import com.yzj.core.entity.vo.StuBook;
import com.yzj.core.entity.vo.TchCourse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VITchCourseMapper {
    int insert(TchCourse record);

    int insertSelective(TchCourse record);

    List<TchCourse> selectByIdAndSemester(@Param("id") Integer id, @Param("semester") String semester);
}