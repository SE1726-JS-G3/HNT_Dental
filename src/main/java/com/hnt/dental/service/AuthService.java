package com.hnt.dental.service;

import com.google.gson.Gson;
import com.hnt.dental.constant.RoleEnum;
import com.hnt.dental.dao.AccountDao;
import com.hnt.dental.dao.BookingDao;
import com.hnt.dental.dao.PatientDao;
import com.hnt.dental.dao.VerificationDao;
import com.hnt.dental.dao.impl.AccountDaoImpl;
import com.hnt.dental.dao.impl.BookingDaoImpl;
import com.hnt.dental.dao.impl.PatientDaoImpl;
import com.hnt.dental.dao.impl.VerificationDaoImpl;
import com.hnt.dental.dto.response.ApiResponse;
import com.hnt.dental.dto.response.BookingDto;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Patient;
import com.hnt.dental.entities.Verification;
import com.hnt.dental.exception.SystemRuntimeException;
import com.hnt.dental.util.AesUtils;
import com.hnt.dental.util.CaptchaUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.io.EOFException;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ResourceBundle;

public class AuthService {
    private static final AccountDao accountDao;
    private static final PatientDao patientDao;
    private static final VerificationDao verificationDao;

    private static final ResourceBundle bundle = ResourceBundle.getBundle("application");

    static {
        accountDao = new AccountDaoImpl();
        patientDao = new PatientDaoImpl();
        verificationDao = new VerificationDaoImpl();
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String message = null;

        Account account = accountDao.findByEmail(email);

        if (account != null) {
            try {
                String passwordEncrypt = AesUtils.encrypt(password);
                if (StringUtils.equals(passwordEncrypt, account.getPassword())) {
                    if (Boolean.TRUE.equals(account.getIsVerified())) {
                        req.getSession().setAttribute("account", account);
                        message = "success";
                    } else {
                        message = "account_not_verified";
                    }
                } else {
                    message = "password_incorrect";
                }
            } catch (Exception e) {
                throw new SystemRuntimeException("Error encrypt");
            }
        } else {
            message = "email_incorrect";
        }
        ApiResponse<Account> response = new ApiResponse<>();
        response.setStatus(false);
        response.setMessage(message);
        ServletUtils.apiResponse(resp, new Gson().toJson(response));
    }

    public void register(HttpServletRequest req, HttpServletResponse resp) {
        String fullName = req.getParameter("fullName");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        try {
            if (accountDao.findByEmail(email) != null) {
                ApiResponse<Account> response = new ApiResponse<>();
                response.setStatus(false);
                response.setMessage("email_existed");
                ServletUtils.apiResponse(resp, new Gson().toJson(response));
            } else {

                Long id = accountDao.save(
                        Account.builder()
                                .email(email)
                                .password(AesUtils.encrypt(password))
                                .role(RoleEnum.ROLE_PATIENT.ordinal())
                                .createdAt(LocalDateTime.now())
                                .updatedAt(LocalDateTime.now())
                                .isVerified(false)
                                .build()
                );

                patientDao.save(
                        Patient.builder()
                                .account(Account.builder().id(id).build())
                                .fullName(fullName)
                                .dob(LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd")))
                                .address(address)
                                .phone(phone)
                                .gender(StringUtils.equals(gender, "Nam"))
                                .build()
                );

                String captcha = CaptchaUtils.getCaptcha(6);

                verificationDao.save(
                        Verification.builder()
                                .email(email)
                                .code(captcha)
                                .createdAt(LocalDateTime.now())
                                .updatedAt(LocalDateTime.now())
                                .build()
                );

                String token = AesUtils.encrypt(StringUtils.join(email, ":", captcha));
                String url = bundle.getString("server.url") + "/auth/verification?token=" + token;
                MailService.sendMailConfirm(fullName, url, email);

                ApiResponse<Account> response = new ApiResponse<>();
                response.setStatus(false);
                response.setMessage("success");
                ServletUtils.apiResponse(resp, new Gson().toJson(response));
            }
        } catch (Exception e) {
            throw new SystemRuntimeException(e.getMessage());
        }
    }

    public void verification(HttpServletRequest req, HttpServletResponse resp) {
        String token = req.getParameter("token");
        try {
            String tokenDecrypt = AesUtils.decrypt(token);
            String[] tokenSplit = tokenDecrypt.split(":");
            String email = tokenSplit[0];
            String code = tokenSplit[1];

            Verification verification = verificationDao.findByEmail(email);

            if (verification != null && StringUtils.equals(verification.getCode(), code) && (StringUtils.equals(code, verification.getCode()))) {
                Account account = accountDao.findByEmail(email);
                account.setIsVerified(true);
                accountDao.update(account);
                verificationDao.delete(verification);
                req.setAttribute("success", true);
                ServletUtils.requestDispatcher(req, resp, "/auth/verification/result");
            } else {
                req.setAttribute("success", false);
                ServletUtils.requestDispatcher(req, resp, "/auth/verification/result");
            }
        } catch (Exception e) {
            throw new SystemRuntimeException("Error decrypt");
        }
    }

    public void forgot(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
        String email = req.getParameter("email");
        try {
            Account account = accountDao.findByEmail(email);
            if (account != null) {
                String captcha = CaptchaUtils.getCaptcha(6);

                verificationDao.save(
                        Verification.builder()
                                .email(email)
                                .code(captcha)
                                .createdAt(LocalDateTime.now())
                                .updatedAt(LocalDateTime.now())
                                .createdBy(account.getId())
                                .build()
                );
                String token = AesUtils.encrypt(StringUtils.join(email, ":", captcha));
                String url = bundle.getString("server.url") + "/auth/forgot/confirm?token=" + token;
                MailService.sendMailConfirm(account.getEmail(), url, email);
                ServletUtils.apiResponse(resp, new Gson().toJson(ApiResponse.builder().status(true).message("success").build()));
            } else {
                ServletUtils.apiResponse(resp, new Gson().toJson(ApiResponse.builder().status(false).message("email_not_existed").build()));
            }
        } catch (Exception e) {
            throw new SystemRuntimeException("Error encrypt");
        }
    }

    public void forgotConfirm(HttpServletRequest req, HttpServletResponse resp) {
        String token = req.getParameter("token");
        String password = req.getParameter("password");
        try {
            String tokenDecrypt = AesUtils.decrypt(token);
            String[] tokenSplit = tokenDecrypt.split(":");
            String email = tokenSplit[0];
            String code = tokenSplit[1];

            Verification verification = verificationDao.findByEmail(email);

            if (verification != null && StringUtils.equals(verification.getCode(), code) && (StringUtils.equals(code, verification.getCode()))) {
                Account account = accountDao.findByEmail(email);
                account.setPassword(AesUtils.encrypt(password));
                accountDao.update(account);
                ServletUtils.redirect(req, resp, "/auth/login");
            }
            ServletUtils.redirect(req, resp, "/404.jsp");
        } catch (Exception e) {
            throw new SystemRuntimeException("Error decrypt");
        }
    }

    public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.getSession().removeAttribute("account");
        ServletUtils.redirect(req, resp, "/auth/login");
    }

    public void historyBooking(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ServletException {
        resp.setContentType("text/html;charset=UTF-8");
        BookingDao dao = new BookingDaoImpl();
        List<BookingDto> list = null;
        try {
            list = dao.getAllHistory();
            int page =1;
            String pageStr = req.getParameter("page");
            if(pageStr!=null){
                page = Integer.parseInt(pageStr);
            }
            final int PAGE_SIZE =8;
            req.setAttribute("list", list.subList((page-1)*PAGE_SIZE,page*PAGE_SIZE));
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/booking-history.jsp");
        } catch (SQLException e) {
            throw new EOFException();

        }
    }

    public void history(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ServletException {
        resp.setContentType("text/html;charset=UTF-8");
        String id = req.getParameter("id");
        BookingDao dao = new BookingDaoImpl();
        BookingDto detail = dao.DetailHistory(id);
        req.setAttribute("d", detail);
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/my-appointment-detail.jsp");

    }
}
