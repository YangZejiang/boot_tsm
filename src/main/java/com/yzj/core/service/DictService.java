package com.yzj.core.service;

import com.yzj.core.entity.po.Dict;

import java.util.List;

/**
 * 数据字典Service接口
 */
public interface DictService {
    //根据类别代码查询数据字典
    List<Dict> findDictListByTypeCode(String typecode);

    Dict findByTypeCodeAndItemCode(String typecode,String itemcode);
}
