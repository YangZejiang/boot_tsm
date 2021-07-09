package com.yzj.core.service.impl;

import com.yzj.core.dao.MessageMapper;
import com.yzj.core.entity.po.Admin;
import com.yzj.core.entity.po.Message;
import com.yzj.core.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service("messageService")
@Transactional
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper messageMapper;
    @Autowired
    private HttpSession session;

    // 通知上线
    @Override
    public int online(Integer id) {
        Admin admin = (Admin) session.getAttribute("USER_SESSION");
        Integer updateBy = admin.getAdmId();
        Message msg = new Message();
        msg.setUpdateBy(updateBy);
        msg.setMsgId(id);
        msg.setIsDisplay(true);
        msg.setIsActive(true);
        return messageMapper.updateByPrimaryKeySelective(msg);
    }

    // 通知下线
    @Override
    public int offline(Integer id) {
        Admin admin = (Admin) session.getAttribute("USER_SESSION");
        Integer updateBy = admin.getAdmId();
        Message msg = new Message();
        msg.setUpdateBy(updateBy);
        msg.setMsgId(id);
        msg.setIsDisplay(false);
        msg.setIsActive(false);
        return messageMapper.updateByPrimaryKeySelective(msg);
    }

    // 存入草稿箱
    @Override
    public int toDraft(Message msg) {
        Admin admin = (Admin) session.getAttribute("USER_SESSION");
        Integer createBy = admin.getAdmId();
        msg.setCreateBy(createBy);
        msg.setIsActive(true);
        msg.setIsDisplay(false);
        return messageMapper.insertSelective(msg);
    }

    // 保存后立即上线
    @Override
    public int toOnline(Message msg) {
        Admin admin = (Admin) session.getAttribute("USER_SESSION");
        Integer createBy = admin.getAdmId();
        msg.setCreateBy(createBy);
        msg.setIsDisplay(true);
        msg.setIsActive(true);
        return messageMapper.insertSelective(msg);
    }

    // 保存修改
    @Override
    public int edit(Message msg) {
        Admin admin = (Admin) session.getAttribute("USER_SESSION");
        Integer updateBy = admin.getAdmId();
        msg.setUpdateBy(updateBy);
        return messageMapper.updateByPrimaryKeySelective(msg);
    }

    // 删除通知
    @Override
    public int delete(Integer id){
        return messageMapper.deleteByPrimaryKey(id);
    }

    // 通过id获取消息详
    @Override
    public Message getMessageDtl(Integer id) {
        return messageMapper.selectByPrimaryKey(id);
    }

    // 教师学生分别获取公告列表
    @Override
    public List<Message> getMessageList() {
        // 1为学生 2为教师
        int usertype = (int) session.getAttribute("USER_TYPE");
        if (usertype == 1)
            return messageMapper.selectForStu();
        else if (usertype == 2)
            return messageMapper.selectForTch();
        return null;
    }
}
