package com.yzj.core.dao;

import com.yzj.core.entity.po.Coursedtl;

public interface CoursedtlMapper {
    int deleteByPrimaryKey(String cdtlId);

    int insert(Coursedtl record);

    int insertSelective(Coursedtl record);

    Coursedtl selectByPrimaryKey(String cdtlId);

    int updateByPrimaryKeySelective(Coursedtl record);

    int updateByPrimaryKey(Coursedtl record);
}