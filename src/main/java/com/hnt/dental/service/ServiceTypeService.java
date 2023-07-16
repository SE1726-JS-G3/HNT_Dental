package com.hnt.dental.service;

import com.hnt.dental.dao.ServiceTypeDao;
import com.hnt.dental.dao.impl.ServiceTypeDaoImpl;
import com.hnt.dental.dto.response.ServiceResDto;
import com.hnt.dental.dto.response.ServiceTypeDto;
import com.hnt.dental.dto.response.ServiceTypeListDto;
import com.hnt.dental.dto.response.TypeServiceDto;
import com.hnt.dental.entities.DoctorRank;
import com.hnt.dental.entities.ServiceType;
import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.time.LocalDateTime;
import java.util.List;

public class ServiceTypeService  {

    private static final ServiceTypeDao dao;

    static {
        dao = new ServiceTypeDaoImpl();
    }

    public void createServiceType(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        dao.save(ServiceType.builder().name(name).description(description).createdAt(LocalDateTime.now()).build());
        ServletUtils.redirect(req, resp, "/management/type");
    }
    public void getAllServiceType(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String page = req.getParameter("page");
        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }
        Integer totalItem = dao.countListService();
        Integer totalPage = PagingUtils.getTotalPage(totalItem);
        List<ServiceTypeListDto> serviceTypeListDtos = dao.getAll(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("currentPage", pageNumber);
        req.setAttribute("serviceTypes", serviceTypeListDtos);
        req.setAttribute("url", "/" + "management/type");
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/service/serviceType.jsp");
    }

    public void getServiceTypeDetail(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("id");
        ServiceType serviceType = dao.getServiceTypeDetail(Long.parseLong(id));
        List<DoctorRank> listRankOfTypeAvailable = dao.listRankOfTypeAvailable(Long.parseLong(id));
        List<TypeServiceDto> getAllRankOfType = dao.getAllRankOfType(Long.parseLong(id));
        req.setAttribute("serviceType", serviceType);
        req.setAttribute("listRankOfTypeAvailable", listRankOfTypeAvailable);
        req.setAttribute("getAllRankOfType", getAllRankOfType);
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/service/detailServiceType.jsp");
    }




}
