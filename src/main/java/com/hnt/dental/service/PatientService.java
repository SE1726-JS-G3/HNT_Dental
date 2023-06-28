package com.hnt.dental.service;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.util.AesUtils;
import com.hnt.dental.util.CaptchaUtils;
import org.apache.commons.lang3.StringUtils;
import com.hnt.dental.entities.Account;
import com.hnt.dental.exception.SystemRuntimeException;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;


import com.hnt.dental.constant.RoleEnum;
import com.hnt.dental.dao.AccountDao;

import com.hnt.dental.dao.PatientDao;
import com.hnt.dental.dao.impl.AccountDaoImpl;
import com.hnt.dental.dao.impl.PatientDaoImpl;
import com.hnt.dental.dao.impl.VerificationDaoImpl;
import com.hnt.dental.entities.Patient;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.EOFException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class PatientService {
    private static final PatientDao patientDao;
    private static final AccountDao accountDao;

    static {

        patientDao  = new PatientDaoImpl();
        accountDao = new AccountDaoImpl();

    }
    public void patient(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ServletException {
        resp.setContentType("text/html;charset=UTF-8");
        PatientDao dao = new PatientDaoImpl();
        List<Patient> list = null;
        try {
            list = dao.getAll();
            int page =1;
            String pageStr = req.getParameter("page");
            if(pageStr!=null){
                page = Integer.parseInt(pageStr);
            }
            final int PAGE_SIZE =5;
            req.setAttribute("list",list.subList((page-1)*PAGE_SIZE,page*PAGE_SIZE) );
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/patient/index.jsp");
        }catch (SQLException e) {
            throw new EOFException();

        }
    }
    public void patientSearch(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ServletException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String txtSearch = req.getParameter("txt");
        PatientDao dao = new PatientDaoImpl();
        List<Patient> list = null;
        try {
            list = dao.SearchPatients(txtSearch);

            req.setAttribute("list",list);
            req.setAttribute("txtS", txtSearch);
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/patient/index.jsp");
        }catch (SQLException e) {
            throw new EOFException();

        }
    }

    public void patientDetail(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ServletException {
        resp.setContentType("text/html;charset=UTF-8");
        String id = req.getParameter("id");
        PatientDao dao = new PatientDaoImpl();
        Patient p = dao.DetailPatients(id);
        req.setAttribute("detail", p);
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/patient/update.jsp");
    }



    public void delete(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        patientDao.delete(Patient.builder().id((long) id).build());
        ServletUtils.redirect(req, resp, "/management/patient");
    }


    public void create(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String fullName = req.getParameter("full_name");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String description = req.getParameter("description");
        String password = AesUtils.encrypt(CaptchaUtils.getCaptcha(8));
        RoleEnum role = RoleEnum.ROLE_PATIENT;
        Long id = accountDao.save(
                Account.builder()
                        .email(email)
                        .password(password)
                        .role(role.ordinal())
                        .isVerified(true)
                        .build()
        );
        patientDao.save(
              Patient.builder()
                        .account(Account.builder().id(id).build())
                        .fullName(fullName)
                        .dob(LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd")))
                        .gender(Objects.equals(gender, "Nam"))
                        .phone(phone)
                        .address(address)
                        .description(description)
                        .build()
        );

        ServletUtils.redirect(req, resp, "/management/patient");
    }

    public void update(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Long id = Long.valueOf(req.getParameter("id"));
        String fullname = req.getParameter("full_name");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String description = req.getParameter("description");
        String status = req.getParameter("status");
        patientDao.update(
                Patient.builder()
                        .id(id)
                        .fullName(fullname)
                        .dob(LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd")))
                        .gender(Objects.equals(gender, "nam"))
                        .phone(phone)
                        .address(address)
                        .description(description)
                        .status(Objects.equals(status, "active"))
                        .build()
        );

        ServletUtils.redirect(req, resp, "/management/patient");
    }

}

