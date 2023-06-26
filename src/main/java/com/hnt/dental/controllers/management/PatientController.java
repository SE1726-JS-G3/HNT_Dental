package com.hnt.dental.controllers.management;

import com.hnt.dental.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "PatientController", value = {
        "/management/patient",
        "/management/patient/create",
        "/management/patient/update",
        "/management/mypatient",
        "/management/mypatient/detail"
})
public class PatientController extends HttpServlet {
    private static final PatientService service;

    static {
        service = new PatientService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/management/patient":
                req.getRequestDispatcher("/WEB-INF/templates/management/patient/index.jsp").forward(req, resp);
                break;
            case "/management/patient/create":
                req.getRequestDispatcher("/WEB-INF/templates/management/patient/create.jsp").forward(req, resp);
                break;
            case "/management/patient/update":
                req.getRequestDispatcher("/WEB-INF/templates/management/patient/update.jsp").forward(req, resp);
                break;
            case "/management/mypatient":
                try {
                    service.MyPatientDoctor(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/management/mypatient/detail":
                try {
                    service.getDoctorById(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        try {
            switch (action) {
                case "/management/mypatient/detail":
                    service.getDoctorById(req, resp);
                    break;

                default:
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
