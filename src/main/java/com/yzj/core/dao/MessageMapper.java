package com.yzj.core.dao;

import com.yzj.core.entity.po.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer msgId);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer msgId);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKeyWithBLOBs(Message record);

    int updateByPrimaryKey(Message record);

    List<Message> selectForStu();

    List<Message> selectForTch();

    List<Message> selectInDoing();

    List<Message> selectInDone(@Param("start") Integer start, @Param("rows") Integer rows);

    List<Message> selectInDraft();

    int selectDoneListCount();

}