package com.yzj.core.service.impl;

import com.yzj.common.utils.AliyunOSSClientUtil;
import com.yzj.common.utils.Page;
import com.yzj.core.dao.*;
import com.yzj.core.entity.po.*;
import com.yzj.core.entity.vo.AdmDistribution;
import com.yzj.core.entity.vo.TchApply;
import com.yzj.core.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.xml.soap.Text;
import java.io.IOException;
import java.util.*;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private AdminServiceMapper adminServiceMapper;
    @Autowired
    private OrderStuMapper orderStuMapper;
    @Autowired
    private TextbookMapper textbookMapper;
    @Autowired
    private MessageMapper messageMapper;
    @Autowired
    private OrderAdMapper orderAdMapper;
    @Autowired
    private HttpSession session;
    @Autowired
    private VITchApplyMapper viTchApplyMapper;
    @Autowired
    private ApplyMapper applyMapper;

    @Override
    public Page<AdmDistribution> getAdmDistributionPage(Integer page, Integer rows, String semester, Integer classId) {
        // 查询列表（所有）
        List<AdmDistribution> distributionList = adminServiceMapper.selectDistributionBySemester(semester, classId);
        // 列表总记录数
        Integer count = distributionList.size();

        // 计算doneNum并排序
        List<Map<String, Object>> doneNumDTOMapList = new ArrayList<Map<String, Object>>();
        for (int i = 0; i < count; i++) {
            AdmDistribution distribution = distributionList.get(i);
            // 赋初值
            distribution.setDoneNum(0);
            doneNumDTOMapList = adminServiceMapper.selectDoneNumDTOByClassidAndSemester(distribution.getClassId(), semester);
            for (int j = 0; j < doneNumDTOMapList.size(); j++) {
                Map<String, Object> doneNumDTOMap = doneNumDTOMapList.get(j);
                if (Integer.parseInt(doneNumDTOMap.get("status").toString()) == 0 &&
                        Integer.parseInt(doneNumDTOMap.get("stockQuantity").toString()) >= Integer.parseInt(doneNumDTOMap.get("isbnorderNum").toString())) {
                    distribution.setDoneNum(distribution.getDoneNum() + 1);

                }
            }
        }
        // 按doneNum降序排序
        Collections.sort(distributionList);
        // 分页切割列表
        List<AdmDistribution> newdistributionList;
        if (page * rows >= count) {
            newdistributionList = distributionList.subList((page - 1) * rows, count);
        } else {
            newdistributionList = distributionList.subList((page - 1) * rows, page * rows);
        }
        // 创建Page返回对象
        Page<AdmDistribution> result = new Page<>();
        result.setPage(page);
        result.setRows(newdistributionList);
        result.setSize(rows);
        result.setTotal(count);
        System.out.println("count:" + count);
        return result;
    }

    // 确认领取后的更改订单状态操作
    @Override
    public int distributionSolved(Integer classId, String semester, String isbn) {
        return orderStuMapper.updateStatusByClassidAndSemesterAndIsbn(classId, semester, isbn);
    }

    // 教材未录入信息添加词条
    @Override
    public int newbookAdd(MultipartFile file, Textbook textbook) {
        AliyunOSSClientUtil clientUtil = new AliyunOSSClientUtil();
        String ossUrl = null;
        if (file.getSize() != 0) {
            String fileName = file.getOriginalFilename();
            String prefix = fileName.substring(0, fileName.indexOf("."));
            String suffix = fileName.substring(fileName.lastIndexOf("."));
            String ossFileName = "ISBN" + textbook.getIsbn() + suffix;
            try {
                ossUrl = clientUtil.uploadFile(ossFileName.trim(), file);
                textbook.setImgUrl(ossUrl);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (!"".equals(textbook.getImgUrl())) {
            String oldUrl = textbook.getImgUrl();
            String oldFileName = oldUrl.substring(oldUrl.lastIndexOf("/") + 1, oldUrl.length());
            String suffix = oldFileName.substring(oldFileName.lastIndexOf("."));
            String ossFileName = "ISBN" + textbook.getIsbn() + suffix;
            ossUrl = clientUtil.copyFile(oldFileName.trim(), ossFileName.trim());
            textbook.setImgUrl(ossUrl);
        }
        return textbookMapper.insertSelective(textbook);
    }

    // 下单
    @Override
    public int addOrder(OrderAd orderAd) {
        Admin admin = (Admin) session.getAttribute("USER_SESSION");
        Integer createBy = admin.getAdmId();
        orderAd.setCreateBy(createBy);
        orderAd.setIsActive(1);
        return orderAdMapper.insertSelective(orderAd);
    }

    // 教材库添加
    @Override
    public int stockAdd(MultipartFile file, Textbook textbook) {
        String fileType = file.getContentType();
        //限制只能上传jpeg,jpg,png格式的图片
        if (file.getSize() != 0 && ("image/jpeg".equals(fileType) || "image/png".equals(fileType))) {
            // 完整原文件名 如：photo.jpeg
            String fileName = file.getOriginalFilename();
            // 原文件名 如：photo
            String prefix = fileName.substring(0, fileName.indexOf("."));
            // 原文件名后缀 如：.jpeg
            String suffix = fileName.substring(fileName.lastIndexOf("."));
            // 上传到OSS的命名： ISBN+isbn+suffix
            String ossfileName = "ISBN" + textbook.getIsbn() + suffix;
            AliyunOSSClientUtil clientUtil = new AliyunOSSClientUtil();
            String ossUrl = null;
            try {
                ossUrl = clientUtil.uploadFile(ossfileName.trim(), file);
                textbook.setImgUrl(ossUrl);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        Admin admin = (Admin) session.getAttribute("USER_SESSION");
        Integer createBy = admin.getAdmId();
        textbook.setCreateBy(createBy);
        textbook.setStatus(1);
        return textbookMapper.insertSelective(textbook);
    }

    // 教材库存在 恢复并覆盖原信息
    @Override
    public int stockRecover(MultipartFile file, Textbook textbook) {
        String fileType = file.getContentType();
        //限制只能上传jpeg,jpg,png格式的图片
        if (file.getSize() != 0 && ("image/jpeg".equals(fileType) || "image/png".equals(fileType))) {
            // 完整原文件名 如：photo.jpeg
            String fileName = file.getOriginalFilename();
            // 原文件名 如：photo
            String prefix = fileName.substring(0, fileName.indexOf("."));
            // 原文件名后缀 如：.jpeg
            String suffix = fileName.substring(fileName.lastIndexOf("."));
            // 上传到OSS的命名： ISBN+isbn+suffix
            String ossfileName = "ISBN" + textbook.getIsbn() + suffix;
            AliyunOSSClientUtil clientUtil = new AliyunOSSClientUtil();
            String ossUrl = null;
            try {
                ossUrl = clientUtil.uploadFile(ossfileName.trim(), file);
                textbook.setImgUrl(ossUrl);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        Admin admin = (Admin) session.getAttribute("USER_SESSION");
        Integer createBy = admin.getAdmId();
        textbook.setCreateBy(createBy);
        textbook.setUpdateBy(createBy);
        textbook.setStatus(1);
        return textbookMapper.updateByPrimaryKeySelective(textbook);
    }

    // 获取教材库界面
    @Override
    public Page<Textbook> getStockPage(Integer page, Integer rows, String isbn, String title) {
        // 创建对象
        Textbook tb = new Textbook();
        if (isbn != null && isbn != "") {
            tb.setIsbn(isbn.trim());
        }
        if (title != null && title != "") {
            tb.setTitle(title.trim());
        }
        // 当前页
        tb.setStart((page - 1) * rows);
        tb.setRows(rows);
        // 查询列表（status =1 ）
        List<Textbook> textbookList = textbookMapper.findStock(tb);
        // 列表总记录数
        Integer count = textbookMapper.countTextbook(tb);

        // 创建Page返回对象
        Page<Textbook> result = new Page<>();
        result.setPage(page);
        result.setRows(textbookList);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    // 库存教材信息修改
    @Override
    public int stockEdit(MultipartFile file, Textbook textbook) {
        String fileType = file.getContentType();
        //限制只能上传jpeg,jpg,png格式的图片
        if (file.getSize() != 0 && ("image/jpeg".equals(fileType) || "image/png".equals(fileType))) {
            // 完整原文件名 如：photo.jpeg
            String fileName = file.getOriginalFilename();
            // 原文件名 如：photo
            String prefix = fileName.substring(0, fileName.indexOf("."));
            // 原文件名后缀 如：.jpeg
            String suffix = fileName.substring(fileName.lastIndexOf("."));
            // 上传到OSS的命名： ISBN+isbn+suffix
            String ossfileName = "ISBN" + textbook.getIsbn() + suffix;
            AliyunOSSClientUtil clientUtil = new AliyunOSSClientUtil();
            String ossUrl = null;
            try {
                ossUrl = clientUtil.uploadFile(ossfileName.trim(), file);
                textbook.setImgUrl(ossUrl);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        Admin admin = (Admin) session.getAttribute("USER_SESSION");
        Integer updateBy = admin.getAdmId();
        textbook.setUpdateBy(updateBy);
        return textbookMapper.updateByPrimaryKeySelective(textbook);
    }

    @Override
    public int stockDelete(String isbn) {
        Textbook tb = new Textbook();
        tb.setIsbn(isbn);
        tb.setStatus(0);
        tb.setStockQuantity(0);
        return textbookMapper.updateByPrimaryKeySelective(tb);
    }

    // 对外订单界面查询
    @Override
    public Page<OrderAd> getOrderPage(Integer page, Integer rows, Integer status, String title) {
        OrderAd orderAd = new OrderAd();
        if (title != null && title != "") {
            orderAd.setTitle(title.trim());
        }
        if (status != 2) {
            orderAd.setStatus(status);
        }

        orderAd.setStart((page - 1) * rows);
        orderAd.setRows(rows);

        List<OrderAd> orderAdList = orderAdMapper.orderAdLeftJoinTitle(orderAd);
        // 列表总记录数
        Integer count = orderAdMapper.countOrderAd(orderAd);

        // 创建Page返回对象
        Page<OrderAd> result = new Page<>();
        result.setPage(page);
        result.setRows(orderAdList);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    // 入库
    @Override
    public int instock(Integer oAdId) {
        OrderAd orderAd = orderAdMapper.selectByPrimaryKey(oAdId);
        String isbn = orderAd.getIsbn();
        Integer num = orderAd.getQuantity();
        // 执行添加操作
        if (num == 0) {
            return orderAdMapper.updateByPrimaryKeySelective(orderAd);
        }
        int rows = textbookMapper.addStock(isbn, num);
        if (rows > 0) {
            orderAd.setStatus(1);
            Admin admin = (Admin) session.getAttribute("USER_SESSION");
            Integer updateBy = admin.getAdmId();
            orderAd.setUpdateBy(updateBy);
            return orderAdMapper.updateByPrimaryKeySelective(orderAd);
        }
        return -1;
    }

    // 取消订单
    @Override
    public int cancelOrder(Integer oAdId) {
        OrderAd orderAd = new OrderAd();
        orderAd.setoAdId(oAdId);
        orderAd.setStatus(-1);
        Admin admin = (Admin) session.getAttribute("USER_SESSION");
        Integer updateBy = admin.getAdmId();
        orderAd.setUpdateBy(updateBy);
        return orderAdMapper.updateByPrimaryKeySelective(orderAd);
    }

    // 获取教师教材填报管理界面
    @Override
    public Page<TchApply> getTchApplyPage(Integer page, Integer rows, TchApply tchApply) {

        tchApply.setStart((page - 1) * rows);
        tchApply.setRows(rows);

        List<TchApply> tchApplyList = viTchApplyMapper.selectByTchApply(tchApply);
        // 列表总记录数
        Integer count = viTchApplyMapper.countByTchApply(tchApply);

        // 创建Page返回对象
        Page<TchApply> result = new Page<>();
        result.setPage(page);
        result.setRows(tchApplyList);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    @Override
    public int deleteApplyWithStuOrder(Integer applyId) {
        int rows = applyMapper.deleteByPrimaryKey(applyId);
        if (rows > 0) {
            orderStuMapper.updateByApplyId(applyId);
            return 1;
        }
        return -1;
    }
}
