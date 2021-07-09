package com.yzj.core.service;

import com.yzj.core.entity.po.Message;

import java.util.List;

public interface MessageService {
    int online(Integer id);

    int offline(Integer id);

    int toDraft(Message msg);

    int toOnline(Message msg);

    int edit(Message msg);

    Message getMessageDtl(Integer id);

    // 获取公告列表
    List<Message> getMessageList();

    int delete(Integer id);
}

