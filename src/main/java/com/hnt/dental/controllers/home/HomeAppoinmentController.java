package com.hnt.dental.controllers.home;

import com.hnt.dental.exception.SystemRuntimeException;
import com.hnt.dental.service.AppointmentService;
import com.hnt.dental.service.VNPayService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "HomeAppoinmentController", value = {
        "/appointment",
        "/appointment/success",
        "/appointment/payment/verify",
        "/appointment/payment/cancel",
        "/appointment/payment/success"
})
public class HomeAppoinmentController extends HttpServlet {
    private static final AppointmentService service;

    static {
        service = new AppointmentService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        try {
            switch (action) {
                case "/appointment":
                    service.renderData(req, resp);
                    break;
                case "/appointment/success":
                    break;
                case "/appointment/payment/verify":
                    service.paymentCallback(req, resp);
                    break;
                default:
            }
        } catch (Exception e) {
            throw new SystemRuntimeException(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            service.create(req, resp);
        } catch (Exception e) {
            throw new SystemRuntimeException(e.getMessage());
        }
    }
}
