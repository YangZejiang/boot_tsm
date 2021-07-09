package com.yzj.core.service.impl;

import com.yzj.common.utils.AliyunOSSClientUtil;
import com.yzj.core.dao.ApplyMapper;
import com.yzj.core.dao.VITchApplyMapper;
import com.yzj.core.dao.VITchCourseMapper;
import com.yzj.core.entity.po.Apply;
import com.yzj.core.entity.vo.TchApply;
import com.yzj.core.entity.vo.TchCourse;
import com.yzj.core.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service("teacherService")
@Transactional
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private VITchCourseMapper viTchCourseMapper;
    @Autowired
    private VITchApplyMapper viTchApplyMapper;
    @Autowired
    private ApplyMapper applyMapper;


    // 通过教工号和学期查询课程
    @Override
    public List<TchCourse> getCourseList(Integer id, String semester) {
        return viTchCourseMapper.selectByIdAndSemester(id, semester);
    }

    // 通过教工号和学期查询已申报书目
    @Override
    public List<TchApply> getApplyList(Integer id, String semester) {
        return viTchApplyMapper.selectByIdAndSemester(id, semester);
    }

    // 提交申报
    @Override
    public int add(MultipartFile file, Apply apply) {
        // 判断是否重复申报
        if (checkExist(apply.getCorsId(), apply.getIsbn()) == 1) {
            return -1;
        }
        String fileType = file.getContentType();
        //限制只能上传jpeg,jpg,png格式的图片
        if (file.getSize() != 0 && ("image/jpeg".equals(fileType) || "image/png".equals(fileType))) {
            // 完整原文件名 如：photo.jpeg
            String fileName = file.getOriginalFilename();
            // 原文件名 如：photo
            String prefix = fileName.substring(0, fileName.indexOf("."));
            // 原文件名后缀 如：.jpeg
            String suffix = fileName.substring(fileName.lastIndexOf("."));
            // 上传到OSS的命名：cdtlId+isbn+suffix
            String ossfileName = apply.getCorsId() + "_" + apply.getIsbn() + suffix;
            AliyunOSSClientUtil clientUtil = new AliyunOSSClientUtil();
            String ossUrl = null;
            try {
                ossUrl = clientUtil.uploadFile(ossfileName.trim(), file);
                apply.setImgUrl(ossUrl);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            if (!"".equals(apply.getImgUrl())) {
                String oldUrl = apply.getImgUrl();
                String oldFileName = oldUrl.substring(oldUrl.lastIndexOf("/") + 1, oldUrl.length());
                String suffix = oldFileName.substring(oldFileName.lastIndexOf("."));
                String ossFileName = apply.getCorsId() + "_" + apply.getIsbn() + suffix;
                AliyunOSSClientUtil clientUtil = new AliyunOSSClientUtil();
                String ossUrl = clientUtil.copyFile(oldFileName.trim(), ossFileName.trim());
                apply.setImgUrl(ossUrl);
            }
        }
        return applyMapper.insertSelective(apply);
    }

    // 通过id获取被修改的信息
    @Override
    public Apply getInfoById(Integer id) {
        return applyMapper.selectByPrimaryKey(id);
    }

    // 修改
    @Override
    public int edit(MultipartFile file, Apply apply) {
        String fileType = file.getContentType();
        //限制只能上传jpeg,jpg,png格式的图片
        if (file.getSize() != 0 && ("image/jpeg".equals(fileType) || "image/png".equals(fileType))) {
            // 完整原文件名 如：photo.jpeg
            String fileName = file.getOriginalFilename();
            // 原文件名 如：photo
            String prefix = fileName.substring(0, fileName.indexOf("."));
            // 原文件名后缀 如：.jpeg
            String suffix = fileName.substring(fileName.lastIndexOf("."));
            // 上传到OSS的命名：cdtlId+isbn+suffix
            String ossfileName = apply.getCorsId() + "_" + apply.getIsbn() + suffix;
            AliyunOSSClientUtil clientUtil = new AliyunOSSClientUtil();
            String ossUrl = null;
            try {
                ossUrl = clientUtil.uploadFile(ossfileName.trim(), file);
                apply.setImgUrl(ossUrl);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return applyMapper.updateByPrimaryKeySelective(apply);
    }

    // 取消购买
    @Override
    public int delete(Integer id) {
        return applyMapper.deleteByPrimaryKey(id);
    }

    public int checkExist(Integer corsId, String isbn) {
        /**
         *
         * @description: 判断是否重复添加购买, 1：重复 0：未重复
         * @param: [corsId, isbn]
         * @return: int
         * @author: YangZejiang
         * @date: 2020/5/2 11:59
         */
        int rows = applyMapper.countByCorsidAndIsbn(corsId, isbn);
        return rows != 0 ? 1 : 0;
    }


}
