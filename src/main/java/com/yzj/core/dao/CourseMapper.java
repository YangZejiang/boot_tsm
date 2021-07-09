package com.yzj.core.dao;

import com.yzj.core.entity.po.Course;

public interface CourseMapper {
    int deleteByPrimaryKey(Integer corsId);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(Integer corsId);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}