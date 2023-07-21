package com.hnt.dental.filter.management;

import com.hnt.dental.constant.RoleEnum;
import com.hnt.dental.entities.Account;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(filterName = "MDoctorFilter", urlPatterns = "/management/doctor/*")

public class MDoctorFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String action = req.getServletPath();
        Account account = (Account) req.getSession().getAttribute("account");
        if (account != null) {
            if (action.contains("/management/doctor/myPatientOfDoctor")) {
                if (account.getRole() == RoleEnum.ROLE_DOCTOR.ordinal()) {
                    chain.doFilter(request, response);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/403");
                }
            } else {
                if (account.getRole() == RoleEnum.ROLE_ADMIN.ordinal() || account.getRole() == RoleEnum.ROLE_MARKETING.ordinal()) {
                    chain.doFilter(request, response);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/403");
                }
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/auth/login");
        }

    }
}