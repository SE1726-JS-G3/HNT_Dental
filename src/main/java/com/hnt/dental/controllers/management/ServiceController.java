package com.hnt.dental.controllers.management;

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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/templates/management/service/index.jsp").forward(req, resp);
    }

}
