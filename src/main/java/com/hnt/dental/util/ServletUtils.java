package com.hnt.dental.util;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class ServletUtils {
    private ServletUtils() {
    }
    public static void redirect(HttpServletRequest request, HttpServletResponse response, String url) throws IOException {
        response.sendRedirect(request.getContextPath() + url);
    }

    public static void requestDispatcher(HttpServletRequest request, HttpServletResponse response, String url) throws IOException, ServletException {
        request.getRequestDispatcher(url).forward(request, response);
    }

    public static void response (HttpServletResponse response, String value) throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println(value);
        out.close();
    }
}
