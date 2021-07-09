package com.yzj.core.dao;

import com.yzj.common.utils.Page;
import com.yzj.core.entity.po.Textbook;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TextbookMapper {
    int deleteByPrimaryKey(String isbn);

    int insert(Textbook record);

    int insertSelective(Textbook record);

    Textbook selectByPrimaryKey(String isbn);

    int updateByPrimaryKeySelective(Textbook record);

    int updateByPrimaryKey(Textbook record);

    int countByPrimaryKey(String isbn);


    int countTextbook(Textbook textbook);

    List<Textbook> findStock(Textbook textbook);

    int addStock(@Param("isbn") String isbn, @Param("num") Integer num);
}