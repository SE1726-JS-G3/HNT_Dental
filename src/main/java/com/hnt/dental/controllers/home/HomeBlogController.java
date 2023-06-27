package com.hnt.dental.controllers.home;

import com.hnt.dental.service.BlogService;
import com.hnt.dental.service.DoctorService;
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

    private static final BlogService service;

    static {
        service = new BlogService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getServletPath();
        switch (action) {
            case "/blog":
                service.getAll(req, resp);
                break;
            case "/blog/detail":
                String id = req.getParameter("id");
                req.setAttribute("test",id);
                try {
                    service.getBlogById(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }

                break;
            default:
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
