package com.yzj.core.dao;

import com.yzj.core.entity.po.ScheduleStu;

public interface ScheduleStuMapper {
    int deleteByPrimaryKey(Integer schStuId);

    int insert(ScheduleStu record);

    int insertSelective(ScheduleStu record);

    ScheduleStu selectByPrimaryKey(Integer schStuId);

    int updateByPrimaryKeySelective(ScheduleStu record);

    int updateByPrimaryKey(ScheduleStu record);
}