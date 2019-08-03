package com.xx.edu.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "IdentityFilter")
public class IdentityFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        // 获取uri地址
        HttpServletRequest request = (HttpServletRequest)req;
        String uri = request.getRequestURI();
        String ctx=request.getContextPath();
        uri = uri.substring(ctx.length());

//        if(uri.startsWith("/userMain")) {
//            if(request.getSession().getAttribute("currentUser")==null) {
//                request.getRequestDispatcher("/LoginOrRegister").forward(req,resp);
//                return;
//            }
//        }

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
