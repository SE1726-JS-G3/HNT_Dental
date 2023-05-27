package com.hnt.dental.service;


import com.hnt.dental.dao.EmployeeDao;
import com.hnt.dental.dao.impl.EmployeeDaoImpl;
import com.hnt.dental.dto.response.EmployeeResDto;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

public class EmployeeService {
    private static final EmployeeDao employeeDao;

    static {
        employeeDao = new EmployeeDaoImpl();
    }

    public void getAll(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String page = req.getParameter("page");
        String search = req.getParameter("search");
        int pageNumber = 1;

        if(StringUtils.isNotEmpty(page)){
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
}
