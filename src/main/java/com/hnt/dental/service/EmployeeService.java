package com.hnt.dental.service;


import com.hnt.dental.constant.RoleEnum;
import com.hnt.dental.dao.AccountDao;
import com.hnt.dental.dao.EmployeeDao;
import com.hnt.dental.dao.impl.AccountDaoImpl;
import com.hnt.dental.dao.impl.EmployeeDaoImpl;
import com.hnt.dental.dto.response.EmployeeResDto;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.exception.SystemRuntimeException;
import com.hnt.dental.util.AesUtils;
import com.hnt.dental.util.CaptchaUtils;
import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class EmployeeService {
    private static final EmployeeDao employeeDao;
    private static final AccountDao accountDao;

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
        String fullName = req.getParameter("full_name");
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
                        .fullName(fullName)
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

    public void update(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Long id = Long.valueOf(req.getParameter("id"));
        String fullname = req.getParameter("full_name");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String salary = req.getParameter("salary");
        String address = req.getParameter("address");
        String position = req.getParameter("position");
        String description = req.getParameter("description");
        RoleEnum role = position.equals("marketing") ? RoleEnum.ROLE_MARKETING : RoleEnum.ROLE_STAFF;
        String error = null;
        try{
            Account account = accountDao.findByEmail(email);

            if(account != null && !Objects.equals(account.getId(), id)){
                throw new SystemRuntimeException(StringUtils.join("Email ", email, " already exists"));
            }

            account = accountDao.get(id.intValue()).isPresent() ? accountDao.get(id.intValue()).get() : null;
            account.setEmail(email);
            account.setRole(role.ordinal());
            account.setUpdatedAt(LocalDateTime.now());
            accountDao.update(account);

            employeeDao.update(
                    Employee.builder()
                            .account(Account.builder().id(id).build())
                            .fullName(fullname)
                            .dob(LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd")))
                            .gender(Objects.equals(gender, "Nam"))
                            .phone(phone)
                            .salary(Double.valueOf(salary))
                            .address(address)
                            .description(description)
                            .build()
            );
        } catch (Exception e){
            error = e.getMessage();
        }

        if(StringUtils.isNotEmpty(error)){
            ServletUtils.redirect(req, resp, "/management/employee/update?id=" + id + "&error=" + error);
        } else {
            ServletUtils.redirect(req, resp, "/management/employee/update?id=" + id);
        }
    }

    public void updateRender(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));
        String error = req.getParameter("error");
        Employee employee = employeeDao.get(id).isPresent()
                ? employeeDao.get(Integer.parseInt(req.getParameter("id"))).get() : null;

        Account account = accountDao.get(id).isPresent()
                ? accountDao.get(id).get() : null;
        assert employee != null;
        employee.setAccount(account);
        req.setAttribute("employee", employee);
        req.setAttribute("error", error);
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/employee/update.jsp");
    }
}


