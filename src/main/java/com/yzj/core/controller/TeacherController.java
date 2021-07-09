package com.yzj.core.controller;

import com.alibaba.fastjson.JSON;
import com.yzj.common.utils.AliyunOSSClientUtil;
import com.yzj.core.dao.ApplyMapper;
import com.yzj.core.entity.po.*;
import com.yzj.core.entity.vo.StuOrder;
import com.yzj.core.entity.vo.TchApply;
import com.yzj.core.entity.vo.TchCourse;
import com.yzj.core.service.DictService;
import com.yzj.core.service.MessageService;
import com.yzj.core.service.TeacherService;
import com.yzj.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 教师控制器类
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {
    // 依赖注入
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private UserService userService;
    @Autowired
    private DictService dictService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private ApplyMapper applyMapper;

    // 数据字典-学期
    @Value("001")
    private String SEMESTER_TYPE;
    // 数据字典-前端权限
    @Value("100")
    private String ACCESS_TYPE;

    /**
     * 向个人信息页面跳转
     */
    @RequestMapping(value = "/profile.do")
    public String toTchProfile() {
        return "tchprofile";
    }

    /**
     * 教师"公告通知"界面列表
     */
    @RequestMapping(value = "/message.do")
    public String message(Model model) {
        List<Message> messageList = messageService.getMessageList();
        model.addAttribute("messageList", messageList);
        return "tchmessage";
    }

    /**
     * 通过id查询公告内容
     */
    @RequestMapping(value = "/message/getMessageDtl.do")
    @ResponseBody
    public Message getMessageDtl(Integer id) {
        Message message = messageService.getMessageDtl(id);
        return message;
    }

    /**
     * 教师"教材填报"界面列表
     */
    @RequestMapping(value = "/apply.do")
    public String apply(Model model, String semester, HttpSession session) {

        Teacher user = (Teacher) session.getAttribute("USER_SESSION");
        Integer tchId = user.getTchId();
        List<Dict> dictSemester = dictService.findDictListByTypeCode(SEMESTER_TYPE);
        // 当前学期
        String selectedSem = dictSemester.get(0).getDictItemCode();
        if (semester != null) {
            selectedSem = semester;
        }
        // 存入当前操作的学期
        session.setAttribute("SEMESTER", selectedSem);
        // 前端开放权限,00都关，10学生开教师关，01学生关教师开
        String access = dictService.findByTypeCodeAndItemCode(ACCESS_TYPE, selectedSem).getDictItemName();
        // 根据教工号和学期查找列表
        List<TchCourse> courseList = teacherService.getCourseList(tchId, selectedSem);
        List<TchApply> applyList = teacherService.getApplyList(tchId, selectedSem);

        model.addAttribute("access", access);
        model.addAttribute("courseList", courseList);
        model.addAttribute("applyList", applyList);
        model.addAttribute("dictSemester", dictSemester);
        model.addAttribute("selectedSem", selectedSem);
        return "tchapply";
    }

    /**
     * 教师"教材填报"界面列表 快速填写信息获取
     */
    @RequestMapping(value = "/apply/getQuickFillInInfo.do")
    @ResponseBody
    public Map<String, Object> getQuickFillInInfo(String cdtlId, HttpSession session) {
        System.out.println(cdtlId);
        Map<String, Object> map = new HashMap<>();
        Teacher teacher = (Teacher) session.getAttribute("USER_SESSION");
        Integer tchId = teacher.getTchId();
        map = applyMapper.findSelfQuickFillInInfo(cdtlId, tchId);
        if (map == null) {
            map = new HashMap<>();
            map = applyMapper.findAllQuickFillInInfo(cdtlId);
            if (map == null) {
                map = new HashMap<>();
                map.put("code", "NULL");
            } else {
                map.put("code", "HAVE");
            }
        } else {
            map.put("code", "HAVE");
        }
        return map;
    }

    /**
     * 教师"教材选定"界面列表 提交填报
     */
    @RequestMapping(value = "apply/add.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> applyAdd(@RequestParam("imgFile") MultipartFile file, Apply apply, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        String selectedSem = (String) session.getAttribute("SEMESTER");
        // 判断是否有操作权限,00都关，10学生开教师关，01学生关教师开
        String access = dictService.findByTypeCodeAndItemCode(ACCESS_TYPE, selectedSem).getDictItemName();
        if ("01".equals(access)) {
            int rows = teacherService.add(file, apply);
            if (rows > 0) {
                map.put("code", "OK");
                map.put("msg", "教材填报成功！");
            } else if (rows == -1) {
                map.put("code", "EXIST");
                map.put("msg", "填报失败：请勿重复填报同一教材！");
            } else {
                map.put("code", "FAIL");
                map.put("msg", "教材填报失败失败!");
            }
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "系统已关闭！");
        return map;
    }

    /**
     * 通过id获取被修改信息
     */
    @RequestMapping("/apply/getInfo.do")
    @ResponseBody
    public Apply getInfo(Integer id) {
        Apply apply = teacherService.getInfoById(id);
        return apply;
    }

    /**
     * 教师"教材选定"界面列表 修改
     */
    @RequestMapping(value = "apply/edit.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> applyEdit(@RequestParam("imgFile") MultipartFile file, Apply apply, HttpSession session) {

        Map<String, Object> map = new HashMap<>();
        String selectedSem = (String) session.getAttribute("SEMESTER");
        // 判断是否有操作权限,00都关，10学生开教师关，01学生关教师开
        String access = dictService.findByTypeCodeAndItemCode(ACCESS_TYPE, selectedSem).getDictItemName();
        if ("01".equals(access)) {
            int rows = teacherService.edit(file, apply);
            if (rows > 0) {
                map.put("code", "OK");
                map.put("msg", "教材信息修改成功！");
            } else {
                map.put("code", "FAIL");
                map.put("msg", "教材填报失败!");
            }
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "系统已关闭！");
        return map;
    }

    /**
     * 教师"教材选定"界面列表 取消
     */
    @RequestMapping(value = "/apply/cancel.do")
    @ResponseBody
    public Map<String, Object> applyCancel(Integer id, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        String selectedSem = (String) session.getAttribute("SEMESTER");
        // 判断是否有操作权限,00都关，10学生开教师关，01学生关教师开
        String access = dictService.findByTypeCodeAndItemCode(ACCESS_TYPE, selectedSem).getDictItemName();
        if ("01".equals(access)) {
            int rows = teacherService.delete(id);
            if (rows > 0) {
                map.put("code", "OK");
                map.put("msg", "删除成功！");
                return map;
            }
        }
        map.put("code", "FAIL");
        map.put("msg", "系统已关闭！");
        return map;
    }
}
