package com.yzj.core.dao;

import com.yzj.core.entity.po.OrderAd;
import com.yzj.core.entity.po.Textbook;
import com.yzj.core.entity.vo.AdmDistribution;
import com.yzj.core.entity.vo.AdmDistributionDtl;
import com.yzj.core.entity.vo.AdmNewBook;
import com.yzj.core.entity.vo.AdmNewOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AdminServiceMapper {
    List<AdmNewBook> selectNewBook();

    List<AdmNewOrder> selectNewOrder();

    // 获取教材信息未录入条数
    int countBadge1();

    // 获取教材待订购条数
    int countBadge2();

    // 获取教材待分发条数
    int countBadge3();

    // 通过学期查询有订单的班级列表
    List<AdmDistribution> selectDistributionBySemester(@Param("semester") String semester, @Param("classId") Integer classId);

    // 获取用来计算班级任务完成数
    List<Map<String, Object>> selectDoneNumDTOByClassidAndSemester(@Param("classId") Integer classId, @Param("semester") String semester);

    List<AdmDistributionDtl> selectDistributionDtlByClassidAndSemester(@Param("classId") Integer classId, @Param("semester") String semester);

}
