package com.yzj.core.service;

import com.yzj.core.entity.po.Admin;
import com.yzj.core.entity.po.Message;
import com.yzj.core.entity.po.Student;
import com.yzj.core.entity.po.Teacher;

import java.util.List;

public interface UserService {
    //通过账号和密码和用户类型查询用户
    Object findUser(String usercode, String password, int usertype);

    // 获取部门职员信息
    Admin getAdminInfo(Integer admId);

    // 获取学生信息
    Student getStudentInfo(Integer stuId);

    // 获取教师信息
    Teacher getTeacherInfo(Integer tchId);

    // 修改密码
    int updatePw(String usercode, String newpassword);
}
