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
        "/management/blog/delete"
})
public class BlogController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/templates/management/blogs/blog_detail.jsp").forward(req, resp);
    }
}
