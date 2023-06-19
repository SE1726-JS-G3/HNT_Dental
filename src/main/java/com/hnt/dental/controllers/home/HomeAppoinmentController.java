package com.hnt.dental.controllers.home;

import com.hnt.dental.service.AppointmentService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "HomeAppoinmentController", value = {
        "/appointment",
        "/appointment/create",
        "/appointment/success"
})
public class HomeAppoinmentController extends HttpServlet {

    private static final AppointmentService service;


    static {
        service = new AppointmentService();

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        try {
            service.renderData(req, resp);
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
