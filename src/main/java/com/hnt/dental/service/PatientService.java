package com.hnt.dental.service;

import com.hnt.dental.dao.PatientDao;
import com.hnt.dental.dao.impl.PatientDaoImpl;
import com.hnt.dental.dto.response.DoctorDetailDto;
import com.hnt.dental.dto.response.PatientResDto;
import com.hnt.dental.dto.response.ServiceResDto;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.entities.Patient;
import com.hnt.dental.util.PagingUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class PatientService {
    private static final PatientDao dao;


    static {
        dao = new PatientDaoImpl();
    }

    public void MyPatientDoctor(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String page = req.getParameter("page");
        String search = req.getParameter("search");
        int pageNumber = 1;

        if(StringUtils.isNotEmpty(page)){
            pageNumber = Integer.parseInt(page);
        }

        Integer totalItem = dao.count();
        Integer totalPage = PagingUtils.getTotalPage(totalItem);
        try {
            List<Patient> myPatientDoctor = dao.MyPatientDoctor(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE);
            req.setAttribute("patients", PatientResDto.convert(myPatientDoctor));
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("currentPage", pageNumber);
            req.setAttribute("search", search);
            req.getRequestDispatcher("/WEB-INF/templates/home/my-patient.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }
    }



    public void getMyPatientDetail(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("id");
        String page1 = req.getParameter("page1");
        String search = req.getParameter("search");
        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page1)) {
            pageNumber = Integer.parseInt(page1);
        }

        Integer totalItem = null;
        try {
            totalItem = dao.count();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        Integer totalPage = PagingUtils.getTotalPage(totalItem);
        try {
            List<Patient> patient = dao.getPatientDetail(Long.valueOf(id), PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE);

            req.setAttribute("patient", PatientResDto.convert(patient));
            req.setAttribute("id", id);
            req.setAttribute("totalPage1", totalPage);
            req.setAttribute("currentPage1", pageNumber);
            req.setAttribute("search", search);
            req.setAttribute("url", "/management/mypatient/detail");
            req.getRequestDispatcher("/WEB-INF/templates/home/my-patientdetail.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}
