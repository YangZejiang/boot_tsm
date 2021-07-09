package com.yzj.core.dao;

import com.yzj.core.entity.po.Dict;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DictMapper {
    int deleteByPrimaryKey(String dictId);

    int insert(Dict record);

    int insertSelective(Dict record);

    Dict selectByPrimaryKey(String dictId);

    Dict selectByTypeCodeAndItemCode(@Param("dictTypeCode") String dictTypeCode, @Param("dictItemCode") String dictItemCode);

    List<Dict> selectByTypeCode(String dictTypeCode);

    int updateByPrimaryKeySelective(Dict record);

    int updateByPrimaryKey(Dict record);


}