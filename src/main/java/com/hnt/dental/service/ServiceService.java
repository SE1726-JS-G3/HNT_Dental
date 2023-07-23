package com.hnt.dental.service;

import com.hnt.dental.dao.DoctorDao;
import com.hnt.dental.dao.FeedbackDao;
import com.hnt.dental.dao.ServiceDao;
import com.hnt.dental.dao.impl.DoctorDaoImpl;
import com.hnt.dental.dao.impl.FeedbackDaoImpl;
import com.hnt.dental.dao.impl.ServiceDaoImpl;
import com.hnt.dental.dto.response.*;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.entities.Service;
import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public class ServiceService {
    private static final ServiceDao dao;
    private static final FeedbackDao feedbackDao;


    static {
        dao = new ServiceDaoImpl();
        feedbackDao = new FeedbackDaoImpl();
    }

    public void getAll(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String page = req.getParameter("page");
        String search = req.getParameter("search");
        String typeID = req.getParameter("typeId");
        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }
        if (StringUtils.isEmpty(search)) {
            search = "";
        }

        if (StringUtils.isEmpty(typeID)) {
            typeID = "";
        }

        Integer totalItem = dao.countListService(search.trim());
        Integer totalPage = PagingUtils.getTotalPage(totalItem);
        List<ServiceResDto> serviceResDtos = dao.getAllServiceDao(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE, search.trim(), typeID);
        List<ServiceTypeDto> serviceTypeDtos = dao.getALlType();
        req.setAttribute("search", search);
        req.setAttribute("typeId", typeID);
        req.setAttribute("types", serviceTypeDtos);
        req.setAttribute("services", serviceResDtos);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("currentPage", pageNumber);
        req.setAttribute("url", "/" +
                "service");
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/service/index.jsp");
    }
    public void getAllServiceManagement(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String page = req.getParameter("page");
        String search = req.getParameter("search");
        String typeID = req.getParameter("typeId");
        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }
        if (StringUtils.isEmpty(search)) {
            search = "";
        }

        if (StringUtils.isEmpty(typeID)) {
            typeID = "";
        }

        Integer totalItem = dao.countListService(search.trim());
        Integer totalPage = PagingUtils.getTotalPage(totalItem);

        List<ServiceManagementDto> serviceManagementDtos = dao.getAllServiceManagement(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE, search.trim());
        List<ServiceTypeDto> getALlType = dao.getALlType();
        req.setAttribute("serviceManagementDtos", serviceManagementDtos);
        req.setAttribute("getALlType", getALlType);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("currentPage", pageNumber);
        req.setAttribute("search", search);
        req.setAttribute("typeId", typeID);

        req.setAttribute("url", "/" +
                "service");
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/service/index.jsp");
    }


    

