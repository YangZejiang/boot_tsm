package com.yzj.core.service.impl;

import com.yzj.core.dao.DictMapper;
import com.yzj.core.entity.po.Dict;
import com.yzj.core.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 数据字典Service接口实现类
 */
@Service("dictService")
@Transactional
public class DictServiceImpl implements DictService {
    @Autowired
    private DictMapper dictMapper;

    /**
     * 根据类别代码查询数据字典
     */
    @Override
    public List<Dict> findDictListByTypeCode(String typecode) {
        return dictMapper.selectByTypeCode(typecode);
    }

    @Override
    public Dict findByTypeCodeAndItemCode(String typecode, String itemcode) {
        return dictMapper.selectByTypeCodeAndItemCode(typecode,itemcode);
    }


}
