package com.hnt.dental.controllers.management;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AppointmentController", value = {
        "/management/appointment",
        "/management/appointment/create",
        "/management/appointment/update",
        "/management/appointment/detail",
        "/management/appointment/delete"
})
public class AppointmentController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getServletPath();
        switch (action) {
            case "/management/appointment":
                req.getRequestDispatcher("/WEB-INF/templates/management/appointment/index.jsp").forward(req, resp);
                break;
            case "/management/appointment/detail":
                req.getRequestDispatcher("/WEB-INF/templates/management/appointment/detail.jsp").forward(req, resp);
                break;
            default:
        }


    }
}
