package com.hnt.dental.controllers.home;

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
        "/appointment/payment",
        "/appointment/success",
        "/appointment/payment/verify",
        "/appointment/payment/cancel",
        "/appointment/payment/success"
})
public class HomeAppoinmentController extends HttpServlet {
    private static final AppointmentService service;
    private static final VNPayService vnPayService;

    static {
        service = new AppointmentService();
        vnPayService = new VNPayService();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        try {
            switch (action) {
                case "/appointment":
                    service.renderData(req, resp);
                    break;
                case "/appointment/success":
                    break;
                default:
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            service.create(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
