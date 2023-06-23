package com.hnt.dental.controllers.home;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "HomeBlogController", value = {
        "/blog",
        "/blog/detail"
})

public class HomeBlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getServletPath();
        switch (action) {
            case "/blog":
                req.getRequestDispatcher("/WEB-INF/templates/home/blog/index.jsp").forward(req, resp);
               // req.getRequestDispatcher("/WEB-INF/templates/home/payment/payment-error.jsp").forward(req, resp);
                break;
            case "/blog/detail":
                req.getRequestDispatcher("/WEB-INF/templates/home/blog/detail.jsp").forward(req, resp);
                break;
            default:
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
