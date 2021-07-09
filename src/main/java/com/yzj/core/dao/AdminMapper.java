package com.yzj.core.dao;

import com.yzj.core.entity.po.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer admId);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer admId);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    // 通过账号和密码查询用户
    Admin findUser(@Param("usercode") String usercode,
                   @Param("password") String password);

    // 修改密码
    int updatePw(@Param("usercode") String usercode,
                 @Param("newpassword") String newpassword);
}