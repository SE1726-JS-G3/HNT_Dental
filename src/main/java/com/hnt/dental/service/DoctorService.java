package com.hnt.dental.service;

import com.hnt.dental.dao.DoctorDao;
import com.hnt.dental.dao.FeedbackDao;
import com.hnt.dental.dao.impl.DoctorDaoImpl;
import com.hnt.dental.dao.impl.FeedbackDaoImpl;
import com.hnt.dental.dto.response.*;
import com.hnt.dental.util.PagingUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Optional;
import java.sql.SQLException;
import java.util.List;
import java.io.EOFException;
import java.io.IOException;
import jakarta.servlet.ServletException;
import com.hnt.dental.util.ServletUtils;
import com.hnt.dental.exception.SystemRuntimeException;

public class DoctorService {

    private static final DoctorDao dao;
    private static final FeedbackDao feedbackDao;


    static {
        dao = new DoctorDaoImpl();
        feedbackDao = new FeedbackDaoImpl();
    }

    public void getAll(HttpServletRequest req, HttpServletResponse resp) {
        String page = req.getParameter("page");
        String search = req.getParameter("search");
        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }

        if (StringUtils.isEmpty(search)) {
            search = "";
        }
        try {
            Integer totalItem = dao.countListDoctorSummary(search.trim());
            Integer totalPage = PagingUtils.getTotalPage(totalItem);

            List<DoctorSummaryRes> doctorSummaryRes = dao.getListDoctorSummary(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE, search.trim());

            req.setAttribute("doctors", doctorSummaryRes);
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("currentPage", pageNumber);
            req.setAttribute("search", search);
            req.setAttribute("url", "/doctor");
            req.getRequestDispatcher("/WEB-INF/templates/home/doctor/index.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void getDoctorById(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        try {
            Optional<DoctorDetailDto> doctorDetailDto = dao.getDoctorDetail(Long.valueOf(id));
            List<ServiceResDto> getAllServiceByIdDoctor = dao.getAllServiceByIdDoctor(Long.valueOf(id));
            List<FeedbackDto> getAllFeedbackByIdDoctor = feedbackDao.getFeedbackDoctor(Long.valueOf(id));
            req.setAttribute("services", getAllServiceByIdDoctor);
            req.setAttribute("doctorDetailDto", doctorDetailDto.get());
            req.setAttribute("feedbacks", getAllFeedbackByIdDoctor);
            req.setAttribute("id", id);
            req.setAttribute("url", "/doctor");
            req.getRequestDispatcher("/WEB-INF/templates/home/doctor/detail.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public List<DoctorDetailDto> getTopDoctor() throws Exception {
        return dao.getTopDoctor();
    }

    public void myDoctor(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ServletException, SQLException {
        resp.setContentType("text/html;charset=UTF-8");
        DoctorDao dao = new DoctorDaoImpl();
        List<DoctorSummaryRes> list = null;

        try {
            list = dao.serviceDoctor();
            int page =1;
            String pageStr = req.getParameter("page");
            if(pageStr!=null){
                page = Integer.parseInt(pageStr);
            }
            final int PAGE_SIZE =2;
            req.setAttribute("list", list.subList((page-1)*PAGE_SIZE,page*PAGE_SIZE));
            // ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/doctor/mydoctor.jsp");
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/my-doctor.jsp");
        } catch (SQLException e) {
            //throw new SystemRuntimeException(e.getMessage());

        }
    }


}
