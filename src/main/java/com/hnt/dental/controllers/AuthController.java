package com.hnt.dental.controllers;

import com.hnt.dental.exception.SystemRuntimeException;
import com.hnt.dental.service.AuthService;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AuthController", value = {"/auth/login", "/auth/register",
        "/auth/logout", "/auth/changePassword", "/auth/forgotPassword", "/auth/verification" })
public class AuthController extends HttpServlet {

    private static final AuthService service;

    static {
        service = new AuthService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/auth/login":
                ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/login.jsp");
                break;
            case "/auth/register":
                ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/register.jsp");
                break;
            case "/auth/logout":
                // TODO
                break;
                //để đây để test font end change password
            case "/auth/changePassword":
                ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/changePassword.jsp");
                // TODO
                break;
            //để đây để test font end forgot
            case "/auth/forgotPassword":
                ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/forgotPassword.jsp");
                // TODO
                break;
            case "/auth/verification":
                service.verification(req, resp);
                break;
            default:
                // TODO
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        try {
            switch (action) {
                case "/auth/login":
                    service.login(req, resp);
                    break;
                case "/auth/register":
                    service.register(req, resp);
                    break;
                case "/auth/changePassword":
                    ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/changePassword.jsp");
                    // TODO
                    break;
                //để đây để test font end forgot
                case "/auth/forgotPassword":
                    ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/forgotPassword.jsp");
                    // TODO
                    break;
                case "/auth/logout":
                    // TODO
                    break;
                default:
                    // TODO
            }
        } catch (SQLException e) {
            throw new SystemRuntimeException("Server error");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
