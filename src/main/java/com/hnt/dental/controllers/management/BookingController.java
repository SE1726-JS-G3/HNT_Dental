package com.hnt.dental.controllers.management;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import com.hnt.dental.service.BookingService;

import java.sql.SQLException;


@WebServlet(name = "BookingController", value = {
        "/management/booking",
        "/management/booking/create",
        "/management/booking/update",
        "/management/booking/detail",
        "/management/booking/delete",
        "/management/booking-history",
        "/management/detail-booking"

})
public class BookingController extends HttpServlet {
    private static final BookingService service;

    static {
        service = new BookingService();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getServletPath();
        switch (action) {
            case "/management/booking":
                req.getRequestDispatcher("/WEB-INF/templates/management/booking/index.jsp").forward(req, resp);
                break;
            case "/management/booking/detail":
                req.getRequestDispatcher("/WEB-INF/templates/management/booking/detail.jsp").forward(req, resp);
                break;
            case "/management/booking-history":

                try {
                    service.historyBooking(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/management/detail-booking":
                try {
                    service.history(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:

        }


    }
}
