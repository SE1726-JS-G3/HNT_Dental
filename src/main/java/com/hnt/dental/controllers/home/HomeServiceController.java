package com.hnt.dental.controllers.home;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "HomeServiceController", value = {
        "/service",
        "/service/detail"
})
public class HomeServiceController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/service":
                req.getRequestDispatcher("/WEB-INF/templates/home/service/index.jsp").forward(req, resp);
                break;
            case "/service/detail":
                req.getRequestDispatcher("/WEB-INF/templates/home/service/detail.jsp").forward(req, resp);
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String action = req.getServletPath();
//        switch (action) {

    }
}