package com.hnt.dental.service;

import com.google.gson.Gson;
import com.hnt.dental.dao.AccountDao;
import com.hnt.dental.dao.impl.AccountDaoImpl;
import com.hnt.dental.dto.response.ApiResponse;
import com.hnt.dental.entities.Account;
import com.hnt.dental.exception.SystemRuntimeException;
import com.hnt.dental.util.AesUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.sql.SQLException;

public class AuthService {
    private static final AccountDao accountDao;

    static {
        accountDao = new AccountDaoImpl();
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String message = null;

        Account account = accountDao.findByEmail(email);

        if(account != null){
            try {
                String passwordEncrypt = AesUtils.encrypt(password);

                if(StringUtils.equals(passwordEncrypt, account.getPassword())){
                    if(Boolean.TRUE.equals(account.getIsVerified())){
                        req.getSession().setAttribute("account", account);
                        message = "success";
                    } else {
                        message = "account_not_verified";
                    }
                } else {
                    message = "password_incorrect";
                }
            }catch (Exception e){
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
}
