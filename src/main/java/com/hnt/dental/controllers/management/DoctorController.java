package com.hnt.dental.controllers.management;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DoctorController", value = {
        "/management/doctor",
        "/management/doctor/create",
        "/management/doctor/update",
        "/management/doctor/myPatient",
        "/management/doctor/detail",
        "/management/doctor/delete"
})
public class DoctorController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/management/doctor":
                req.getRequestDispatcher("/WEB-INF/templates/management/doctor/index.jsp").forward(req, resp);
                break;
            case "/management/doctor/myPatient":
                req.getRequestDispatcher("/WEB-INF/templates/management/doctor/myPatient.jsp").forward(req, resp);
                break;
            case "/management/doctor/detail":
                req.getRequestDispatcher("/WEB-INF/templates/management/doctor/detail.jsp").forward(req, resp);
                break;
            case "/management/doctor/delete":
                req.getRequestDispatcher("/WEB-INF/templates/management/doctor/delete.jsp").forward(req, resp);
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        // TODO
    }
}
