package com.hnt.dental.controllers.management;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "EmployeeController", value = {
        "/management/employee",
        "/management/employee/create",
        "/management/employee/update",
        "/management/employee/delete"
})
public class EmployeeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/management/employee":
                req.getRequestDispatcher("/WEB-INF/templates/management/employee/index.jsp").forward(req, resp);
                break;
            case "/management/employee/create":
                req.getRequestDispatcher("/WEB-INF/templates/management/employee/create.jsp").forward(req, resp);
                break;
            case "/management/employee/update":
                req.getRequestDispatcher("/WEB-INF/templates/management/employee/update.jsp").forward(req, resp);
                break;
            case "/management/employee/delete":
                req.getRequestDispatcher("/WEB-INF/templates/management/employee/delete.jsp").forward(req, resp);
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
