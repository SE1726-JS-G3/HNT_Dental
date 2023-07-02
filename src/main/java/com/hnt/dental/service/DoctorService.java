package com.hnt.dental.service;

import com.hnt.dental.constant.RoleEnum;
import com.hnt.dental.dao.AccountDao;
import com.hnt.dental.dao.DoctorDao;
import com.hnt.dental.dao.FeedbackDao;
import com.hnt.dental.dao.impl.AccountDaoImpl;
import com.hnt.dental.dao.impl.DoctorDaoImpl;
import com.hnt.dental.dao.impl.FeedbackDaoImpl;
import com.hnt.dental.dto.response.*;
import com.hnt.dental.entities.*;
import com.hnt.dental.exception.SystemRuntimeException;
import com.hnt.dental.util.AesUtils;
import com.hnt.dental.util.CaptchaUtils;
import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class DoctorService {

    private static final DoctorDao dao;
    private static final FeedbackDao feedbackDao;
    private static final AccountDao accountDao;

    static {
        dao = new DoctorDaoImpl();
        feedbackDao = new FeedbackDaoImpl();
        accountDao = new AccountDaoImpl();
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


    public void getAllManagement(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String page = req.getParameter("page");
        String search = req.getParameter("search");
        String status = req.getParameter("status");
        String gender = req.getParameter("gender");
        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }
        if (StringUtils.isEmpty(search)) {
            search = "";
        }
        if (StringUtils.isEmpty(status)) {
            status = "";
        }
        if (StringUtils.isEmpty(gender)) {
            gender = "";
        }

        try {
            String renderedSearch = renderSearch(search.trim());
            Integer totalItem = dao.countListDoctorSummary(renderedSearch);
            Integer totalPage = PagingUtils.getTotalPage(totalItem);
            List<Doctors> doctors = dao.getAllDoctor(
                    PagingUtils.getOffset(pageNumber),
                    PagingUtils.DEFAULT_PAGE_SIZE,
                    renderedSearch,
                    status.trim(),
                    gender.trim()
            );
            req.setAttribute("doctors", DoctorResDto.convert(doctors));
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("currentPage", pageNumber);
            req.setAttribute("search", search);
            req.setAttribute("status", status);
            req.setAttribute("gender", gender);
            req.setAttribute("url", "/management/doctor");
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/doctor/index.jsp");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }


    private String renderSearch(String search){
        if(search.matches("\\d{2}/\\d{2}/\\d{4}")){
            String[] date = search.split("/");
            return StringUtils.join(date[2], "-", date[1], "-", date[0]);
        }
        return search;
    }
    public void getMyAppointments(HttpServletRequest req, HttpServletResponse resp) {
        String page = req.getParameter("page");
        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }

        try {
            Integer totalItem = dao.countMyAppointments();
            Integer totalPage = PagingUtils.getTotalPage(totalItem);
            List<Booking> getMyAppointments = dao.getMyAppointments(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE);
            req.setAttribute("bookings", AppointmentResDto.convert(getMyAppointments));
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("currentPage", pageNumber);
            req.getRequestDispatcher("/WEB-INF/templates/home/MyAppointments.jsp").forward(req, resp);


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

    public void create(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String fullname = req.getParameter("full_name");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String position = req.getParameter("position");
        String description = req.getParameter("description");
        Long rankId = Long.valueOf(req.getParameter("rankId"));
        String name = req.getParameter("name");
        String status = req.getParameter("status");
        String password = AesUtils.encrypt(CaptchaUtils.getCaptcha(8));
        RoleEnum role = RoleEnum.ROLE_DOCTOR;
        String error = null;
        try {
            // Check if the email already exists
            if (accountDao.findByEmail(email) != null) {
                throw new SystemRuntimeException(StringUtils.join("Email ", email, " already exists"));
            }
            Long id = accountDao.save(
                    Account.builder()
                            .email(email)
                            .password(password)
                            .role(role.ordinal())
                            .isVerified(true)
                            .build()
            );
            dao.save(
                    Doctors.builder()
                            .account(Account.builder().id(id).build())
                            .fullName(fullname)
                            .dob(LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd")))
                            .gender(Objects.equals(gender, "Nam"))
                            .phone(phone)
                            .position(position)
                            .address(address)
                            .description(description)
                            .rankId(rankId)
                            .status(Objects.equals(status, "Đang làm việc"))
                            .doctorRank(DoctorRank.builder().name(name).build())
                            .build()
            );
        } catch (Exception e) {
            error = e.getMessage();
        }
        if (StringUtils.isNotEmpty(error)) {
            // Redirect to the create page with the error message
            ServletUtils.redirect(req, resp, "/management/doctor/create?error=" + error);
        } else {
            // Redirect to the doctor management page
            ServletUtils.redirect(req, resp, "/management/doctor");
        }
    }
    public void update(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Long id = Long.valueOf(req.getParameter("id"));
        String fullname = req.getParameter("full_name");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String position = req.getParameter("position");
        String description = req.getParameter("description");
        Long rankId = null;
        if (req.getParameter("rankId") != null) {
            rankId = Long.valueOf(req.getParameter("rankId"));
        }
        String status = req.getParameter("status");
        //  RoleEnum role = position.equals("DOCTOR") ? RoleEnum.ROLE_DOCTOR : RoleEnum.ROLE_STAFF;
        RoleEnum role = RoleEnum.ROLE_DOCTOR;
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

            dao.update(
                    Doctors.builder()
                            .account(Account.builder().id(id).build())
                            .fullName(fullname)
                            .dob(LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd")))
                            .gender(Objects.equals(gender, "Nam"))
                            .phone(phone)
                            .position(position)
                            .address(address)
                            .description(description)
                            .status(Objects.equals(status, "Đang làm việc"))
                            .rankId(rankId)
                            .build()
            );
        } catch (Exception e){
            error = e.getMessage();
        }

        if(StringUtils.isNotEmpty(error)){
            ServletUtils.redirect(req, resp, "/management/doctor/detail?id=" + id + "&error=" + error);
        } else {
            ServletUtils.redirect(req, resp, "/management/doctor/detail?id=" + id);
        }
    }


    public void updateRender(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));
        String error = req.getParameter("error");
        Doctors doctor = dao.get(id).isPresent()
                ? dao.get(Integer.parseInt(req.getParameter("id"))).get() : null;

        Account account = accountDao.get(id).isPresent()
                ? accountDao.get(id).get() : null;

        if (account == null) {
            account = Account.builder().role(RoleEnum.ROLE_DOCTOR.ordinal()).build();
        }

        assert doctor != null;
        doctor.setAccount(account);
        List<FeedbackDto> getAllFeedbackByIdDoctor = feedbackDao.getFeedbackDoctor(Long.valueOf(id));
        List<Patient> myPatientDoctor = dao.getPatientDetail(Long.valueOf(id));
        req.setAttribute("doctor", doctor);
        req.setAttribute("error", error);
        req.setAttribute("patients", PatientResDto.convert(myPatientDoctor));
        req.setAttribute("feedbacks", getAllFeedbackByIdDoctor);
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/doctor/detail.jsp");
    }


    public void delete(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        dao.delete(Doctors.builder().id((long) id).build());
        ServletUtils.redirect(req, resp, "/management/doctor");
    }
}
