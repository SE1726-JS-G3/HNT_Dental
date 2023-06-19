package com.hnt.dental.service;

import com.hnt.dental.dao.DoctorDao;
import com.hnt.dental.dao.FeedbackDao;
import com.hnt.dental.dao.ServiceDao;
import com.hnt.dental.dao.impl.DoctorDaoImpl;
import com.hnt.dental.dao.impl.FeedbackDaoImpl;
import com.hnt.dental.dao.impl.ServiceDaoImpl;
import com.hnt.dental.dto.response.*;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

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
        req.setAttribute("services", serviceResDtos);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("currentPage", pageNumber);
        req.setAttribute("search", search);
        req.setAttribute("typeId", typeID);
        req.setAttribute("types", serviceTypeDtos);
        req.setAttribute("url", "/" +
                "service");
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/service/index.jsp");
    }

    public void getServiceById(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("id");
        String typeId = req.getParameter("typeId");
        // lấy ra loại type theo id , nếu ko có type nào thì coi như id đó ko tồn tại
        List<ServiceTypeDto> getType = dao.getTypeByServiceId(Long.valueOf(id));
        if (getType.isEmpty()) {
            ServletUtils.redirect(req, resp, "/service");
        } else {
            typeId = (typeId == null ? getType.get(0).getIdType() : Long.valueOf(typeId)).toString();
            // nếu typeId == null thì lấy ra type đầu tiên :  typeId == null ? getType.get(0).getIdType() : Long.valueOf(typeId)
            ServiceDetailDto serviceResDtos = dao.getServiceDetailByServiceId(Long.valueOf(id), Long.valueOf(typeId));

            List<DoctorByServiceIdDto> doctorByServiceIdDtos = dao.getDoctorByServiceIdAndServiceType(Long.valueOf(id), Long.valueOf(typeId));

            List<FeedbackDto> feedbacks = feedbackDao.getFeedbackService(Long.valueOf(id));

            req.setAttribute("services", serviceResDtos);
            req.setAttribute("types", getType);
            req.setAttribute("doctors", doctorByServiceIdDtos);
            req.setAttribute("feedbacks", feedbacks);
            req.setAttribute("typeId", typeId);
            req.setAttribute("id", id);
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/service/detail.jsp");

            // bh làm cách nào để chỉnh type ở detail nó call lại vào đây là oke
        }
    }
    public List<ServiceSearchHomeDto> getAllServiceHome() throws Exception {
        return dao.getAllServiceHome();
    }
    public List<ServiceDetailDto> getTopService() throws Exception {
        return dao.getTopService();
    }

    public List<ServiceTypeDto> getAllType(Long id) throws Exception {
        return dao.getTypeByServiceId(id);
    }

}
