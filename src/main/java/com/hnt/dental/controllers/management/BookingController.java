package com.hnt.dental.controllers.management;

import com.hnt.dental.dao.impl.BookingDaoImpl;
import com.hnt.dental.service.BookingService;
import com.hnt.dental.service.EmployeeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "BookingController", value = {
        "/management/booking",
        "/management/booking/create",
        "/management/booking/update",
        "/management/booking/detail",
        "/management/booking/delete"
})

public class BookingController extends HttpServlet {
    private static final BookingService bookingService;


    static {
        bookingService =new BookingService();
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getServletPath();
        switch (action) {
            case "/management/booking":
                bookingService.getAll(req, resp);
                break;
            case "/management/booking/detail":
                bookingService.getDetailBooking(req, resp);
                //req.getRequestDispatcher("/WEB-INF/templates/management/booking/detail.jsp").forward(req, resp);
                break;

        }
    }
}
