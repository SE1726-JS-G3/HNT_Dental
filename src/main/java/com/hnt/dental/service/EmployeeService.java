package com.hnt.dental.service;


import com.hnt.dental.constant.RoleEnum;
import com.hnt.dental.dao.AccountDao;
import com.hnt.dental.dao.EmployeeDao;
import com.hnt.dental.dao.impl.AccountDaoImpl;
import com.hnt.dental.dao.impl.EmployeeDaoImpl;
import com.hnt.dental.dto.response.EmployeeResDto;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.util.AesUtils;
import com.hnt.dental.util.CaptchaUtils;
import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;

public class EmployeeService {
    private static final EmployeeDao employeeDao;
    private  static  final AccountDao accountDao;

    static {
        employeeDao = new EmployeeDaoImpl();
        accountDao = new AccountDaoImpl();
    }

    public void getAll(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String page = req.getParameter("page");
        String search = req.getParameter("search");
        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }

        Integer totalItem = employeeDao.count();
        Integer totalPage = PagingUtils.getTotalPage(totalItem);

        List<Employee> employees = employeeDao.getAll(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE);

        req.setAttribute("employees", EmployeeResDto.convert(employees));
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("currentPage", pageNumber);
        req.setAttribute("search", search);
        req.setAttribute("url", "/management/employee");
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/employee/index.jsp");
    }

    public void create(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String full_name = req.getParameter("full_name");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String salary = req.getParameter("salary");
        String address = req.getParameter("address");
        String position = req.getParameter("position");
        String description = req.getParameter("description");

        String password = AesUtils.encrypt(CaptchaUtils.getCaptcha(8));

        RoleEnum role = position.equals("marketing") ? RoleEnum.ROLE_MARKETING : RoleEnum.ROLE_STAFF;

        Long id = accountDao.save(
                Account.builder()
                        .email(email)
                        .password(password)
                        .role(role.ordinal())
                        .isVerified(true)
                        .build()
        );

        employeeDao.save(
                Employee.builder()
                        .account(Account.builder().id(id).build())
                        .fullName(full_name)
                        .dob(LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd")))
                        .gender(Objects.equals(gender, "Nam"))
                        .phone(phone)
                        .salary(Double.valueOf(salary))
                        .address(address)
                        .description(description)
                        .build()
        );

        ServletUtils.redirect(req, resp, "/management/employee");
    }

}
