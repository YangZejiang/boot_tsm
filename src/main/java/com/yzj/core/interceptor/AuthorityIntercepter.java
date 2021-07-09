//package com.yzj.core.interceptor;
//
//import com.yzj.core.po.User;
//import org.springframework.web.servlet.HandlerInterceptor;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// * 权限拦截器
// */
//public class AuthorityIntercepter implements HandlerInterceptor {
//    @Override
//    public boolean preHandle(HttpServletRequest request,
//                             HttpServletResponse response, Object handler)
//            throws Exception {
//        // 获取请求的URL
//        String url = request.getRequestURI();
//        // URL:除了登录请求外，其他的URL都进行拦截控制
//        if (url.indexOf("/mark/adminlist.action") >= 0 || url.indexOf("/mark/noticelist.action") >= 0) {
//            // 获取Session
//            HttpSession session = request.getSession();
//            User user = (User) session.getAttribute("USER_SESSION");
//            if (user.getUser_state() == 9) {
//                return true;
//            }
//            request.setAttribute("msg", "<script>alert('您的权限不够！');</script>");
//            request.getRequestDispatcher("/WEB-INF/jsp/error.jsp")
//                    .forward(request, response);
//            return false;
//        }
//        return true;
//
//    }
//
//    @Override
//    public void postHandle(HttpServletRequest request,
//                           HttpServletResponse response, Object handler,
//                           ModelAndView modelAndView) throws Exception {
//
//    }
//
//    @Override
//    public void afterCompletion(HttpServletRequest request,
//                                HttpServletResponse response, Object handler, Exception ex)
//            throws Exception {
//    }
//}
//
