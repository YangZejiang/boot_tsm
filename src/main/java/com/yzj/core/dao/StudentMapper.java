package com.yzj.core.dao;

import com.yzj.core.entity.po.Student;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {
    int deleteByPrimaryKey(Integer stuId);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer stuId);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

    // 通过账号和密码查询用户
    Student findUser(@Param("usercode") String usercode,
                     @Param("password") String password);

    // 修改密码
    int updatePw(@Param("usercode") String usercode,
                 @Param("newpassword") String newpassword);
}