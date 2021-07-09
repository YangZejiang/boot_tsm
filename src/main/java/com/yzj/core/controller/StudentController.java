package com.yzj.core.controller;

import com.yzj.core.entity.po.Dict;
import com.yzj.core.entity.po.Message;
import com.yzj.core.entity.po.Student;
import com.yzj.core.entity.vo.StuBook;
import com.yzj.core.entity.vo.StuDistribution;
import com.yzj.core.entity.vo.StuDistributionDtl;
import com.yzj.core.entity.vo.StuOrder;
import com.yzj.core.service.DictService;
import com.yzj.core.service.MessageService;
import com.yzj.core.service.StudentService;
import com.yzj.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 学生控制器类
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    // 依赖注入
    @Autowired
    private UserService userService;
    @Autowired
    private DictService dictService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private MessageService messageService;
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
    public String toStuProfile() {
        return "stuprofile";
    }

    /**
     * 学生"公告通知"界面列表
     */
    @RequestMapping(value = "/message.do")
    public String message(Model model) {
        List<Message> messageList = messageService.getMessageList();
        model.addAttribute("messageList", messageList);
        return "stumessage";
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
     * 学生"教材选定"界面列表
     */
    @RequestMapping(value = "/textbook.do")
    public String textbook(Model model, String semester, HttpSession session) {
        Student user = (Student) session.getAttribute("USER_SESSION");
        Integer stuId = user.getStuId();
        List<Dict> dictSemester = dictService.findDictListByTypeCode(SEMESTER_TYPE);
        // 当前学期
        String selectedSem = dictSemester.get(0).getDictItemCode();
        if (semester != null) {
            selectedSem = semester;
        }
        // 前端开放权限,00都关，10学生开教师关，01学生关教师开
        String access = dictService.findByTypeCodeAndItemCode(ACCESS_TYPE, selectedSem).getDictItemName();
        // 根据学号和学期查找列表
        List<StuBook> bookList = studentService.getBookList(stuId, selectedSem);
        List<StuOrder> orderList = studentService.getOrderList(stuId, selectedSem);

        model.addAttribute("access", access);
        model.addAttribute("bookList", bookList);
        model.addAttribute("orderList", orderList);
        model.addAttribute("dictSemester", dictSemester);
        model.addAttribute("selectedSem", selectedSem);
        return "stubook";
    }

    /**
     * 学生"教材选定"界面列表 添加购买
     */
    @RequestMapping(value = "/textbook/add.do")
    @ResponseBody
    public Map<String, Object> textbookAdd(HttpSession session, Integer applyId, String selectedSem) {
        Map<String, Object> map = new HashMap<>();
        // 判断是否有操作权限,00都关，10学生开教师关，01学生关教师开
        String access = dictService.findByTypeCodeAndItemCode(ACCESS_TYPE, selectedSem).getDictItemName();
        if ("10".equals(access)) {
            Student student = (Student) session.getAttribute("USER_SESSION");
            Integer stuId = student.getStuId();
            int rows = studentService.add(stuId, applyId);
            if (rows > 0) {
                map.put("code", "OK");
                map.put("msg", "购买成功！");
            } else if (rows == -1) {
                map.put("code", "EXIST");
                map.put("msg", "购买失败：请勿重复否买！");
            } else {
                map.put("code", "FAIL");
                map.put("msg", "购买失败!");
            }
            List<StuOrder> orderList = studentService.getOrderList(stuId, selectedSem);
            map.put("orderList", orderList);
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "系统已关闭!");
        return map;

    }

    /**
     * 学生"教材选定"界面列表 取消购买
     */
    @RequestMapping(value = "/textbook/cancel.do")
    @ResponseBody
    public Map<String, Object> textbookCancel(Integer id, HttpSession session, String selectedSem) {
        Map<String, Object> map = new HashMap<>();
        // 判断是否有操作权限,00都关，10学生开教师关，01学生关教师开
        String access = dictService.findByTypeCodeAndItemCode(ACCESS_TYPE, selectedSem).getDictItemName();
        if ("10".equals(access)) {
            Student student = (Student) session.getAttribute("USER_SESSION");
            Integer stuId = student.getStuId();
            int rows = studentService.delete(id);
            if (rows > 0) {
                map.put("code", "OK");
                map.put("msg", "取消成功！");
            } else {
                map.put("code", "FAIL");
                map.put("msg", "取消失败！");
            }
            List<StuOrder> orderList = studentService.getOrderList(stuId, selectedSem);
            map.put("orderList", orderList);
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "系统已关闭！");
        return map;
    }

    /**
     * 学生"教材选定"界面列表 查看教材详细信息
     */
    @RequestMapping(value = "/textbook/detail.do")
    @ResponseBody
    public Map<String, Object> textbookDtl(Integer applyId, String isbn) {
        Map<String, Object> map = studentService.findBookInfo(applyId, isbn);
        // map中Key为 isbn,title,author,press,price,imgUrl
        return map;
    }

    /**
     * 学生"教材领取与发放"界面列表
     */
    @RequestMapping(value = "/distribution.do")
    public String distribution(Model model, String semester, HttpSession session) {
        List<Dict> dictSemester = dictService.findDictListByTypeCode(SEMESTER_TYPE);
        // 当前学期
        String selectedSem = dictSemester.get(0).getDictItemCode();
        if (semester != null) {
            selectedSem = semester;
        }
        model.addAttribute("dictSemester", dictSemester);
        model.addAttribute("selectedSem", selectedSem);
        Student user = (Student) session.getAttribute("USER_SESSION");
        Integer classId = user.getClassId();
        List<StuDistribution> distributionList = studentService.getDistributionList(classId, selectedSem);
        model.addAttribute("distributionList", distributionList);
        return "studistribution";
    }

    /**
     * 学生"教材领取与发放"界面 查看详情
     */
    @RequestMapping(value = "/distribution/detail.do")
    public String distributionDtl(Model model, String semester, Integer classId) {
        List<StuDistributionDtl> list = studentService.getDistributionDtlList(classId, semester);
        String title = semester.substring(0, 4) + "学年第" + semester.substring(semester.length() - 1) + "学期 " + classId + "班教材订购详细表";
        model.addAttribute("title", title);
        model.addAttribute("list", list);
        return "studistributionDtl";
    }

}
