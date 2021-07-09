package com.yzj.core.dao;

import com.yzj.core.entity.po.OrderAd;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface OrderAdMapper {
    int deleteByPrimaryKey(Integer oAdId);

    int insert(OrderAd record);

    int insertSelective(OrderAd record);

    OrderAd selectByPrimaryKey(Integer oAdId);

    int updateByPrimaryKeySelective(OrderAd record);

    int updateByPrimaryKey(OrderAd record);

    BigDecimal selectMinPrice(String isbn);

    BigDecimal selectLastPrice(String isbn);

    int countLP(String isbn);

    List<OrderAd> orderAdLeftJoinTitle(OrderAd orderAd);

    int countOrderAd(OrderAd orderAd);

}