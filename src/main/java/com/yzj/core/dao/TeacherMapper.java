package com.yzj.core.dao;

import com.yzj.core.entity.po.Teacher;
import org.apache.ibatis.annotations.Param;

public interface TeacherMapper {
    int deleteByPrimaryKey(Integer tchId);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(Integer tchId);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);

    // 通过账号和密码查询用户
    Teacher findUser(@Param("usercode") String usercode,
                     @Param("password") String password);

    // 修改密码
    int updatePw(@Param("usercode") String usercode,
                 @Param("newpassword") String newpassword);
}