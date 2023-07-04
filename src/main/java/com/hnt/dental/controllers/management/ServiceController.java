package com.hnt.dental.controllers.management;

import com.hnt.dental.service.BookingService;
import com.hnt.dental.service.ServiceService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ServiceController", value = {
        "/management/service",
        "/management/service/create",
        "/management/service/update",
        "/management/service/delete"
})
public class ServiceController extends HttpServlet {
    private static final ServiceService service;


    static {
        service = new ServiceService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        System.out.println(action);
        switch (action) {
            case "/management/service":
                try {
                    service.getAllServiceManagement(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/management/service/create":
                req.getRequestDispatcher("/WEB-INF/templates/management/service/create.jsp").forward(req, resp);
                break;
            case "/management/service/update":
                req.getRequestDispatcher("/WEB-INF/templates/management/service/1.jsp").forward(req, resp);
                break;
            case "/management/service/delete":
                req.getRequestDispatcher("/WEB-INF/templates/management/service/delete.jsp").forward(req, resp);
                break;
            default:
        }
    }
}
