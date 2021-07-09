package com.yzj.core.service.impl;

import com.yzj.core.dao.AdminMapper;
import com.yzj.core.dao.MessageMapper;
import com.yzj.core.dao.StudentMapper;
import com.yzj.core.dao.TeacherMapper;
import com.yzj.core.entity.po.Admin;
import com.yzj.core.entity.po.Message;
import com.yzj.core.entity.po.Student;
import com.yzj.core.entity.po.Teacher;
import com.yzj.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户基本操作Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private MessageMapper messageMapper;
    @Autowired
    private HttpSession session;

    // 通过账号和密码和用户类型查询用户
    @Override
    public Object findUser(String usercode, String password, int usertype) {
        // usertype：0为部门 1为学生 2为老师
        if (usertype == 0) {
            Admin admin = this.adminMapper.findUser(usercode, password);
            return admin;
        } else if (usertype == 1) {
            Student student = this.studentMapper.findUser(usercode, password);
            return student;
        } else if (usertype == 2) {
            Teacher teacher = this.teacherMapper.findUser(usercode, password);
            return teacher;
        }
        return null;
    }

    // 获取部门职员信息
    @Override
    public Admin getAdminInfo(Integer admId) {
        Admin admin = adminMapper.selectByPrimaryKey(admId);
        return admin;
    }

    // 获取学生信息
    @Override
    public Student getStudentInfo(Integer stuId) {
        Student student = studentMapper.selectByPrimaryKey(stuId);
        return student;
    }

    // 获取教师信息
    @Override
    public Teacher getTeacherInfo(Integer tchId) {
        Teacher teacher = teacherMapper.selectByPrimaryKey(tchId);
        return teacher;
    }

    // 修改密码
    @Override
    public int updatePw(String usercode, String newpassword) {
        // 0为部门 1为学生 2为教师
        int usertype = (int) session.getAttribute("USER_TYPE");
        if (usertype == 0)
            return adminMapper.updatePw(usercode, newpassword);
        else if (usertype == 1)
            return studentMapper.updatePw(usercode, newpassword);
        else if (usertype == 2)
            return teacherMapper.updatePw(usercode, newpassword);
        return 0;
    }

}
