package com.yzj.core.controller;

import com.yzj.common.utils.Page;
import com.yzj.core.dao.*;
import com.yzj.core.entity.po.*;
import com.yzj.core.entity.vo.*;
import com.yzj.core.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.xml.soap.Text;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 部门控制器类
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    // 依赖注入
    @Autowired
    private AdminService adminService;
    @Autowired
    private AdminServiceMapper adminServiceMapper;
    @Autowired
    private DictService dictService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private MessageMapper messageMapper;
    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private TextbookMapper textbookMapper;
    @Autowired
    private OrderAdMapper orderAdMapper;
    @Autowired
    private DictMapper dictMapper;
    @Autowired
    private ApplyMapper applyMapper;
    // 数据字典-学期
    @Value("001")
    private String SEMESTER_TYPE;
    // 数据字典-前端权限
    @Value("100")
    private String ACCESS_TYPE;

    /**
     * 向个人信息页面跳转-部门
     */
    @RequestMapping(value = "/profile.do")
    public String toAdmProfile(Model model) {
        // 获取3个badge数据
        Map<String, Object> badgeMap = getBadgeMap();
        model.addAttribute("badgeMap", badgeMap);
        return "admprofile";
    }

    /**
     * 部门"教材信息未录入"界面
     */
    @RequestMapping(value = "/newbook.do")
    public String newBook(Model model) {
        List<AdmNewBook> list = adminServiceMapper.selectNewBook();
        model.addAttribute("list", list);
        // 获取3个badge数据
        Map<String, Object> badgeMap = getBadgeMap();
        model.addAttribute("badgeMap", badgeMap);
        return "admnewbook";
    }

    /**
     * 部门"教材信息未录入"界面 根据applyId 查找信息
     */
    @RequestMapping(value = "/newbook/getInfo.do")
    @ResponseBody
    public Apply newBookgetInfo(Integer id) {
        Apply apply = teacherService.getInfoById(id);
        return apply;
    }


    /**
     * 部门"教材信息未录入"界面 新建词条
     */
    @RequestMapping(value = "/newbook/add.do")
    @ResponseBody
    public Map<String, Object> newBookAdd(@RequestParam("imgFile") MultipartFile file, Textbook textbook,
                                          HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        Textbook tb = textbookMapper.selectByPrimaryKey(textbook.getIsbn());
        if (tb != null) {
            // 存在直接恢复覆盖信息
            if (tb.getStatus() == 0) {
                int rows1 = adminService.stockRecover(file, textbook);
                if (rows1 > 0) {
                    map.put("code", "OK");
                    map.put("msg", "创建成功！");
                    return map;
                } else {
                    map.put("code", "FAIL");
                    map.put("msg", "创建失败！");
                    return map;
                }
            }
        }
        Admin admin = (Admin) session.getAttribute("USER_SESSION");
        Integer createBy = admin.getAdmId();
        textbook.setCreateBy(createBy);
        int rows = adminService.newbookAdd(file, textbook);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "创建成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "创建失败！");
        return map;
    }

    /**
     * 部门"教材待订购"界面
     */
    @RequestMapping(value = "/neworder.do")
    public String newOrder(Model model) {
        List<AdmNewOrder> list = adminServiceMapper.selectNewOrder();
        model.addAttribute("list", list);
        // 获取3个badge数据
        Map<String, Object> badgeMap = getBadgeMap();
        model.addAttribute("badgeMap", badgeMap);
        return "admneworder";
    }

    /**
     * 部门"教材待订购"界面 获取书本信息和历史价格与最低价格
     */
    @RequestMapping(value = "/neworder/getOrderInfo.do")
    @ResponseBody
    public Map<String, Object> newOrderGetOrderInfo(String isbn) {
        Map<String, Object> map = new HashMap<>();
        Textbook textbook = textbookMapper.selectByPrimaryKey(isbn);
        map.put("tb", textbook);
        int rows = orderAdMapper.countLP(isbn);
        String lp = "0";
        if (rows > 0) {
            lp = orderAdMapper.selectLastPrice(isbn).toString();
        }
        String mp = orderAdMapper.selectMinPrice(isbn).toString();
        map.put("minPrice", mp);
        if ("0.00".equals(mp)) {
            map.put("minPrice", 0);
        }
        map.put("lastPrice", lp);

        return map;
    }

    /**
     * 部门"教材待订购"界面 下单
     */
    @RequestMapping(value = "/order/add.do")
    @ResponseBody
    public Map<String, Object> addOrder(Model model, HttpSession session, OrderAd orderAd) {
        Map<String, Object> map = new HashMap<>();
        int rows = adminService.addOrder(orderAd);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "订单创建成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "创建订单失败！");

        return map;
    }

    /**
     * 部门"教材待分发"界面
     */
    @RequestMapping(value = "/distribution.do")
    public String distribution(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                               String semester, Integer classId, Model model, HttpSession session) {

        List<Dict> dictSemester = dictService.findDictListByTypeCode(SEMESTER_TYPE);
        // 当前学期
        String selectedSem = dictSemester.get(0).getDictItemCode();
        if (semester != null) {
            selectedSem = semester;
        }
        model.addAttribute("dictSemester", dictSemester);
        model.addAttribute("selectedSem", selectedSem);
        // 存入当前操作的学期
        session.setAttribute("SEMESTER", selectedSem);

        // 按学期查询
        Page<AdmDistribution> distributionPage = adminService.getAdmDistributionPage(page, rows, selectedSem, classId);
        model.addAttribute("page", distributionPage);

        model.addAttribute("classId", classId);
        // 获取3个badge数据
        Map<String, Object> badgeMap = getBadgeMap();
        model.addAttribute("badgeMap", badgeMap);
        return "admdistribution";
    }

    /**
     * 部门"教材待分发"界面 查看班级详情
     */
    @RequestMapping(value = "/distribution/detail.do")
    @ResponseBody
    public List<AdmDistributionDtl> distributionDtl(Integer classId, HttpSession session) {
        // 当前学期
        String selectedSem = (String) session.getAttribute("SEMESTER");
        List<AdmDistributionDtl> list = adminServiceMapper.selectDistributionDtlByClassidAndSemester(classId, selectedSem);
        return list;
    }

    /**
     * 部门"教材待分发"界面 确认领取
     */
    @RequestMapping(value = "/distribution/solved.do")
    @ResponseBody
    public Map<String, Object> distributionSolved(Integer classId, String isbn, HttpSession session) {
        // 当前学期
        String selectedSem = (String) session.getAttribute("SEMESTER");
        Map<String, Object> map = new HashMap<>();
        if (!"".equals(classId) && !"".equals(isbn) && !"".equals(selectedSem)) {
            int rows = adminService.distributionSolved(classId, selectedSem, isbn);
            if (rows > 0) {
                // 确认领取之后将教师申请的apply状态改为已完成 status=2；这将影响管理员还能否修改apply数据
                applyMapper.updateStatusByClassidAndSemesterAndIsbn(classId, selectedSem, isbn);
                map.put("code", "OK");
                map.put("msg", "确认领取成功！");
                return map;
            }
        }
        map.put("code", "FAIL");
        map.put("msg", "确认领取失败！");
        return map;
    }


    /**
     * 部门"教材库存与信息管理"界面
     */
    @RequestMapping(value = "/stock.do")
    public String stock(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                        String isbn, String title, Model model) {
        model.addAttribute("isbn", isbn);
        model.addAttribute("title", title);
        Page<Textbook> textbookPage = adminService.getStockPage(page, rows, isbn, title);
        model.addAttribute("page", textbookPage);
        // 获取3个badge数据
        Map<String, Object> badgeMap = getBadgeMap();
        model.addAttribute("badgeMap", badgeMap);
        return "admstock";
    }

    // 获取教材详细信息
    @RequestMapping(value = "/stock/detail.do")
    @ResponseBody
    public Textbook stockDtl(String isbn) {
        Textbook textbook = textbookMapper.selectByPrimaryKey(isbn);
        return textbook;
    }

    /**
     * 部门"教材库存与信息管理"界面 添加
     */
    @RequestMapping(value = "/stock/add")
    @ResponseBody
    public Map<String, Object> stockAdd(@RequestParam("imgFile") MultipartFile file, Textbook textbook) {
        Map<String, Object> map = new HashMap<>();
        Textbook tb = textbookMapper.selectByPrimaryKey(textbook.getIsbn());
        if (tb != null) {
            // 存在直接恢复覆盖信息
            if (tb.getStatus() == 0) {
                int rows1 = adminService.stockRecover(file, textbook);
                if (rows1 > 0) {
                    map.put("code", "OK");
                    map.put("msg", "创建成功！");
                    return map;
                } else {
                    map.put("code", "FAIL");
                    map.put("msg", "创建失败！");
                    return map;
                }
            }
            map.put("code", "FAIL");
            map.put("msg", "教材已存在！");
            return map;
        }
        int rows2 = adminService.stockAdd(file, textbook);
        if (rows2 > 0) {
            map.put("code", "OK");
            map.put("msg", "创建成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "创建失败！");
        return map;
    }

    /**
     * 部门"教材库存与信息管理"界面 修改
     */
    @RequestMapping(value = "/stock/edit.do")
    @ResponseBody
    public Map<String, Object> stockEdit(@RequestParam("imgFile") MultipartFile file, Textbook textbook) {
        Map<String, Object> map = new HashMap<>();
        int rows = adminService.stockEdit(file, textbook);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "修改成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "修改失败！");
        return map;
    }

    /**
     * 部门"教材库存与信息管理"界面 删除
     */
    @RequestMapping(value = "/stock/delete.do")
    @ResponseBody
    public Map<String, Object> stockDelete(String isbn) {
        Map<String, Object> map = new HashMap<>();
        int rows = adminService.stockDelete(isbn);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "删除成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "删除失败！");
        return map;
    }

    /**
     * 部门"对外购书订单管理"界面
     */
    @RequestMapping(value = "/order.do")
    public String order(Model model, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
                        @RequestParam(defaultValue = "2") Integer status, String title) {
        Page<OrderAd> orderAdPage = adminService.getOrderPage(page, rows, status, title);
        model.addAttribute("page", orderAdPage);
        model.addAttribute("title", title);
        model.addAttribute("status", status);

        // 获取3个badge数据
        Map<String, Object> badgeMap = getBadgeMap();
        model.addAttribute("badgeMap", badgeMap);
        return "admorder";
    }

    /**
     * 部门"对外购书订单管理"界面 入库
     */
    @RequestMapping(value = "/order/detail.do")
    @ResponseBody
    public Map<String, Object> orderDtl(Integer oAdId, String isbn) {
        Map<String, Object> map = new HashMap<>();
        OrderAd orderAd = orderAdMapper.selectByPrimaryKey(oAdId);
        Textbook textbook = textbookMapper.selectByPrimaryKey(isbn);

        map.put("tb", textbook);
        map.put("or", orderAd);
        return map;
    }

    /**
     * 部门"对外购书订单管理"界面 入库
     */
    @RequestMapping(value = "/order/instock.do")
    @ResponseBody
    public Map<String, Object> instock(Integer oAdId) {
        Map<String, Object> map = new HashMap<>();
        int rows = adminService.instock(oAdId);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "入库成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "入库失败！");
        return map;
    }

    /**
     * 部门"对外购书订单管理"界面 取消订单
     */
    @RequestMapping(value = "/order/cancel.do")
    @ResponseBody
    public Map<String, Object> cancelOrder(Integer oAdId) {
        Map<String, Object> map = new HashMap<>();
        int rows = adminService.cancelOrder(oAdId);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "入库成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "入库失败！");
        return map;
    }


    /**
     * 部门"公告通知管理"界面
     */
    @RequestMapping(value = "/message.do")
    public String message(Model model, @RequestParam(defaultValue = "1") Integer
            page, @RequestParam(defaultValue = "10") Integer rows) {
        List<Message> doingList = messageMapper.selectInDoing();
        List<Message> draftList = messageMapper.selectInDraft();

        // 当前页
        int start = ((page - 1) * rows);
        // 查询
        List<Message> doneList = messageMapper.selectInDone(start, rows);
        // 查询列表总记录数
        Integer count = messageMapper.selectDoneListCount();
        // 创建Page返回对象
        Page<Message> donePage = new Page<>();
        donePage.setPage(page);
        donePage.setRows(doneList);
        donePage.setSize(rows);
        donePage.setTotal(count);

        model.addAttribute("doingList", doingList);
        model.addAttribute("draftList", draftList);
        model.addAttribute("page", donePage);
        // 获取3个badge数据
        Map<String, Object> badgeMap = getBadgeMap();
        model.addAttribute("badgeMap", badgeMap);
        return "admmsg";
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
     * 部门"公告通知管理"界面 上线操作
     */
    @RequestMapping(value = "message/online.do")
    @ResponseBody
    public Map<String, Object> msgOnline(Integer id) {
        Map<String, Object> map = new HashMap<>();
        int rows = messageService.online(id);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "上线成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "上线失败！");
        return map;
    }

    /**
     * 部门"公告通知管理"界面 下线操作
     */
    @RequestMapping(value = "message/offline.do")
    @ResponseBody
    public Map<String, Object> msgOffline(Integer id) {
        Map<String, Object> map = new HashMap<>();
        int rows = messageService.offline(id);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "下线成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "下线失败！");
        return map;
    }

    /**
     * 部门"公告通知管理"界面 保存入草稿箱
     */
    @RequestMapping(value = "message/toDraft.do")
    @ResponseBody
    public Map<String, Object> msgToDraft(Message msg) {
        Map<String, Object> map = new HashMap<>();
        int rows = messageService.toDraft(msg);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "存入草稿箱成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "存入草稿箱失败！");
        return map;
    }

    /**
     * 部门"公告通知管理"界面 保存并上线
     */
    @RequestMapping(value = "message/toOnline.do")
    @ResponseBody
    public Map<String, Object> msgToOnline(Message msg) {
        Map<String, Object> map = new HashMap<>();
        int rows = messageService.toOnline(msg);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "上线成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "上线失败！");
        return map;
    }

    /**
     * 部门"公告通知管理"界面 修改通知
     */
    @RequestMapping(value = "message/edit.do")
    @ResponseBody
    public Map<String, Object> msgEdit(Message msg) {
        Map<String, Object> map = new HashMap<>();
        int rows = messageService.edit(msg);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "修改成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "修改失败！");
        return map;
    }

    /**
     * 部门"公告通知管理"界面 删除通知
     */
    @RequestMapping(value = "message/delete.do")
    @ResponseBody
    public Map<String, Object> msgDelete(Integer id) {
        Map<String, Object> map = new HashMap<>();
        int rows = messageService.delete(id);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "删除成功！");
            return map;
        }
        map.put("code", "FAIL");
        map.put("msg", "删除失败！");
        return map;
    }

    /**
     * 部门"系统管理"界面
     */
    @RequestMapping(value = "/system.do")
    public String system(Model model) {

        List<Dict> frontCtrlList = dictMapper.selectByTypeCode(ACCESS_TYPE);
        model.addAttribute("list", frontCtrlList);
        // 获取3个badge数据
        Map<String, Object> badgeMap = getBadgeMap();
        model.addAttribute("badgeMap", badgeMap);
        return "admsys";
    }

    /**
     * 部门"系统管理"界面 前端开放控制
     */
    @RequestMapping(value = "/system/frontCtrl.do")
    @ResponseBody
    public Map<String, Object> frontCtrl(String p) {
        Map<String, Object> map = new HashMap();
        map = getBadgeMap();
        Integer badge1 = (Integer) map.get("badge1");
        String type = p.substring(0, 1);
        String semester = p.substring(1, 6);
        String status = p.substring(6);
        Dict dict = new Dict();
        dict = dictMapper.selectByTypeCodeAndItemCode(ACCESS_TYPE, semester);
        String curStatus = dict.getDictItemName();
        String re = "";
        map.put("code", "FAIL");
        map.put("msg", "操作失败！");
        if ("00".equals(curStatus)) {
            if ("T".equals(type)) {
                dict.setDictItemName("01");
                int rows = dictMapper.updateByPrimaryKeySelective(dict);
                if (rows > 0) {
                    map.put("code", "OK");
                    map.put("msg", "教师端开放成功！");
                    re = "T" + semester + "01";
                    map.put("re", re);
                }
            } else {
                if (badge1 == 0) {
                    dict.setDictItemName("10");
                    int rows = dictMapper.updateByPrimaryKeySelective(dict);
                    if (rows > 0) {
                        map.put("code", "OK");
                        map.put("msg", "学生端开放成功！");
                        re = "S" + semester + "10";
                        map.put("re", re);
                    }
                } else {
                    map.put("code", "FAIL");
                    map.put("msg", "存在未录入教材，请先处理！");
                }
            }
        } else if ("01".equals(curStatus)) {
            if ("T".equals(type)) {
                dict.setDictItemName("00");
                int rows = dictMapper.updateByPrimaryKeySelective(dict);
                if (rows > 0) {
                    map.put("code", "OK");
                    map.put("msg", "教师端关闭成功！");
                    re = "T" + semester + "00";
                    map.put("re", re);
                }
            } else {
                map.put("code", "FAIL");
                map.put("msg", "请先关闭教师端！");
            }
        } else if ("10".equals(curStatus)) {
            if ("T".equals(type)) {
                map.put("code", "FAIL");
                map.put("msg", "请先关闭学生端！");
            } else {
                dict.setDictItemName("00");
                int rows = dictMapper.updateByPrimaryKeySelective(dict);
                if (rows > 0) {
                    map.put("code", "OK");
                    map.put("msg", "学生端关闭成功！");
                    re = "S" + semester + "00";
                    map.put("re", re);
                }
            }
        }
        return map;
    }

    /**
     * 部门"教师教材填报管理"界面
     */
    @RequestMapping(value = "/tchapply.do")
    public String tchapply(Model model, @RequestParam(defaultValue = "1") Integer
            page, @RequestParam(defaultValue = "5") Integer rows, TchApply tchApply) {
        List<Dict> dictSemester = dictService.findDictListByTypeCode(SEMESTER_TYPE);
        // 当前学期
        String selectedSem = dictSemester.get(0).getDictItemCode();
        if (tchApply.getSemester() != null) {
            selectedSem = tchApply.getSemester();
        } else {
            tchApply.setSemester(selectedSem);
        }
        model.addAttribute("dictSemester", dictSemester);
        model.addAttribute("selectedSem", selectedSem);

        Page<TchApply> tchApplyPage = adminService.getTchApplyPage(page, rows, tchApply);
        model.addAttribute("page", tchApplyPage);

        model.addAttribute("tchId", tchApply.getTchId());
        model.addAttribute("cdtlId", tchApply.getCdtlId());
        model.addAttribute("cdtlName", tchApply.getCdtlName());
        // 获取3个badge数据
        Map<String, Object> badgeMap = getBadgeMap();
        model.addAttribute("badgeMap", badgeMap);
        return "admtchapply";
    }

    /**
     * 部门"教师教材填报管理"界面 修改isbn
     */
    @RequestMapping(value = "tchapply/updateISBN.do")
    @ResponseBody
    public Map<String, Object> updateISBN(Integer applyId, String isbn) {
        Map<String, Object> map = new HashMap<>();
        Apply apply = new Apply();
        apply.setApplyId(applyId);
        apply.setIsbn(isbn);
        int rows = applyMapper.updateByPrimaryKeySelective(apply);
        if (rows > 0) {
            map.put("code", "OK");
            map.put("msg", "修改成功！");
        } else {
            map.put("code", "FAIL");
            map.put("msg", "修改失败！");
        }
        return map;
    }

    /**
     * 部门"教师教材填报管理"界面 根据applyId删除
     */
    @RequestMapping(value = "tchapply/delete.do")
    @ResponseBody
    public Map<String, Object> tchapplyDelete(Integer applyId) {
        Map<String, Object> map = new HashMap<>();
        int flag = adminService.deleteApplyWithStuOrder(applyId);
        if (flag == 1) {
            map.put("code", "OK");
            map.put("msg", "修改成功！");
        } else {
            map.put("code", "FAIL");
            map.put("msg", "修改失败！");
        }
        return map;
    }

    // 获取3个badge数据
    public Map<String, Object> getBadgeMap() {
        Map<String, Object> map = new HashMap();
        int badge1 = adminServiceMapper.countBadge1();
        int badge2 = adminServiceMapper.countBadge2();
        int badge3 = adminServiceMapper.countBadge3();
        map.put("badge1", badge1);
        map.put("badge2", badge2);
        map.put("badge3", badge3);
        return map;
    }

}
