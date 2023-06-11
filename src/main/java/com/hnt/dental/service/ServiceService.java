package com.hnt.dental.service;

import com.hnt.dental.dao.DoctorDao;
import com.hnt.dental.dao.ServiceDao;
import com.hnt.dental.dao.impl.DoctorDaoImpl;
import com.hnt.dental.dao.impl.ServiceDaoImpl;
import com.hnt.dental.dto.response.DoctorSummaryRes;
import com.hnt.dental.dto.response.EmployeeResDto;
import com.hnt.dental.dto.response.ServiceResDto;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

public class ServiceService {
    private static final ServiceDao dao;

    static {
        dao = new ServiceDaoImpl();
    }
    public void getAll(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String page = req.getParameter("page");
        String search = req.getParameter("search");
        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }
        if(StringUtils.isEmpty(search)) {
            search = "";
        }
        Integer totalItem = dao.countListService(search.trim());
        Integer totalPage = PagingUtils.getTotalPage(totalItem);
        List<ServiceResDto> serviceResDtos = dao.getAllServiceDao(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE, search.trim());

        req.setAttribute("services", serviceResDtos);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("currentPage", pageNumber);
        req.setAttribute("search", search);
        req.setAttribute("url", "/" +
                "service");
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/service/index.jsp");
    }
}
