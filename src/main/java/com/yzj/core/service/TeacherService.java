package com.yzj.core.service;

import com.yzj.core.entity.po.Apply;
import com.yzj.core.entity.vo.TchApply;
import com.yzj.core.entity.vo.TchCourse;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface TeacherService {
    List<TchCourse> getCourseList(Integer id, String semester);

    List<TchApply> getApplyList(Integer id, String semester);

    int delete(Integer id);

    int add(MultipartFile file, Apply apply);

    int edit(MultipartFile file, Apply apply);

    Apply getInfoById(Integer id);

}
