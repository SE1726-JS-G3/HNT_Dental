package com.hnt.dental.controllers.management;

import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "BlogController", value = {
        "/management/blog",
        "/management/blog/create",
        "/management/blog/update",
        "/management/blog/detail",
        "/management/blog/delete"
})
public class BlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/management/blog":
                req.getRequestDispatcher("/WEB-INF/templates/management/blogs/index.jsp").forward(req, resp);
                break;
            case "/management/blog/create":
                req.getRequestDispatcher("/WEB-INF/templates/management/blogs/create.jsp").forward(req, resp);
                break;
            case "/management/blog/detail":
                req.getRequestDispatcher("/WEB-INF/templates/management/blogs/detail.jsp").forward(req, resp);
                break;
            default:
        }
    }
}
