package com.yzj.core.service;

import com.yzj.common.utils.Page;
import com.yzj.core.entity.po.Message;
import com.yzj.core.entity.po.OrderAd;
import com.yzj.core.entity.po.Textbook;
import com.yzj.core.entity.vo.AdmDistribution;
import com.yzj.core.entity.vo.TchApply;
import org.springframework.web.multipart.MultipartFile;

public interface AdminService {
    Page<AdmDistribution> getAdmDistributionPage(Integer page, Integer rows, String semester, Integer classId);

    int distributionSolved(Integer classId, String semester, String isbn);

    int newbookAdd(MultipartFile file, Textbook textbook);

    int addOrder(OrderAd orderAd);

    int stockAdd(MultipartFile file, Textbook textbook);

    int stockRecover(MultipartFile file, Textbook textbook);

    Page<Textbook> getStockPage(Integer page, Integer rows, String isbn, String title);

    int stockEdit(MultipartFile file, Textbook textbook);

    int stockDelete(String isbn);

    Page<OrderAd> getOrderPage(Integer page, Integer rows, Integer status, String title);

    int instock(Integer oAdId);

    int cancelOrder(Integer oAdId);
    Page<TchApply> getTchApplyPage(Integer page, Integer rows,TchApply apply);

    int deleteApplyWithStuOrder(Integer applyId);
}
