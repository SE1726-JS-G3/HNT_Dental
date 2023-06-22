package com.hnt.dental.controllers.management;

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
        "/management/patient/delete"
})
public class PatientController extends HttpServlet {
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
                req.getRequestDispatcher("/WEB-INF/templates/management/patient/1.jsp").forward(req, resp);
                break;
            case "/management/patient/delete":
                req.getRequestDispatcher("/WEB-INF/templates/management/patient/delete.jsp").forward(req, resp);
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
