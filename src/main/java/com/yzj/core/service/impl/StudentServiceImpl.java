package com.yzj.core.service.impl;

import com.yzj.core.dao.*;
import com.yzj.core.entity.po.Apply;
import com.yzj.core.entity.po.OrderStu;
import com.yzj.core.entity.po.Textbook;
import com.yzj.core.entity.vo.StuBook;
import com.yzj.core.entity.vo.StuDistribution;
import com.yzj.core.entity.vo.StuDistributionDtl;
import com.yzj.core.entity.vo.StuOrder;
import com.yzj.core.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("studentService")
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired
    private VIStuBookMapper viStuBookMapper;
    @Autowired
    private VIStuOrderMapper viStuOrderMapper;
    @Autowired
    private OrderStuMapper orderStuMapper;
    @Autowired
    private TextbookMapper textbookMapper;
    @Autowired
    private ApplyMapper applyMapper;
    @Autowired
    private StuDistributionMapper stuDistributionMapper;

    // 通过学号和学期查询教材清单
    @Override
    public List<StuBook> getBookList(Integer id, String semester) {
        return viStuBookMapper.selectByIdAndSemester(id, semester);

    }

    // 通过学号和学期查询购书记录
    @Override
    public List<StuOrder> getOrderList(Integer id, String semester) {
        return viStuOrderMapper.selectByIdAndSemester(id, semester);
    }

    // 添加购买
    @Override
    public int add(Integer stuId, Integer applyId) {
        // 判断是否重复添加购买
        if (checkExist(stuId, applyId) == 1) {
            return -1;
        }
        OrderStu orderStu = new OrderStu();
        orderStu.setStuId(stuId);
        orderStu.setApplyId(applyId);
        return orderStuMapper.insertSelective(orderStu);
    }

    // 取消购买
    @Override
    public int delete(Integer id) {
        return orderStuMapper.deleteByPrimaryKey(id);
    }

    // 判断教材信息是否存在于教材信息表，不存在返回apply表中教材的信息
    // reason: apply表信息可能不完善
    @Override
    public Map<String, Object> findBookInfo(Integer applyId, String isbn) {
        Map<String, Object> map = new HashMap<String, Object>();
        // 判断教材信息表是否存在
        int row = textbookMapper.countByPrimaryKey(isbn);
        if (row > 0) {
            Textbook info1 = textbookMapper.selectByPrimaryKey(isbn);
            map.put("isbn", isbn);
            map.put("title", info1.getTitle());
            map.put("author", info1.getAuthor());
            map.put("press", info1.getPress());
            map.put("imgUrl", info1.getImgUrl());
            map.put("price", info1.getFixedPrice());
        } else {
            Apply info2 = applyMapper.selectByPrimaryKey(applyId);
            map.put("isbn", isbn);
            map.put("title", info2.getTitle());
            map.put("author", info2.getAuthor());
            map.put("press", info2.getPress());
            map.put("imgUrl", info2.getImgUrl());
            map.put("price", info2.getFixedPrice());
        }
        return map;
    }
    // 通过班级和学期查询班级购书情况
    @Override
    public List<StuDistribution> getDistributionList(Integer classId, String semester){
        return stuDistributionMapper.selectByclassIdAndSemester(classId,semester);

    }
    // 通过班级和学期查询班级购书情况详细表单
    @Override
    public List<StuDistributionDtl> getDistributionDtlList(Integer classId, String semester){
        return stuDistributionMapper.selectDtlByclassIdAndSemester(classId,semester);
    }

    public int checkExist(Integer stuId, Integer applyId) {
        /**
         *
         * @description: 判断是否重复添加购买, 1：重复 0：未重复
         * @param: [stuId, applyId]
         * @return: int
         * @author: YangZejiang
         * @date: 2020/4/28 18:56
         */
        int rows = orderStuMapper.countByStuIdAndApplyId(stuId, applyId);
        return rows != 0 ? 1 : 0;
    }


}
