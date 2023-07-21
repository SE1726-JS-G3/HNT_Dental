package com.hnt.dental.service;

import com.hnt.dental.dao.*;
import com.hnt.dental.dao.impl.*;
import com.hnt.dental.entities.Patient;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DashboardService {
    private static final DoctorDao dao;
    private static final PatientDao patient;
private static final BookingDao booking;
private static final PaymentDao payment;
    static {
        dao = new DoctorDaoImpl();
        patient = new PatientDaoImpl();
        booking = new BookingDaoImpl();
        payment = new PaymentDaoImpl();

    }

    public void getAll(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int countDoctor = dao.countDoctorDashboard();
        Long countPatient = patient.countPatientDashboard();
        Long countBooking = booking.countBookingDashboard();
        Double countRevenue = payment.countRevenue();
        String countRevenueString = String.format("%,.0f", countRevenue);
        req.setAttribute("countDoctor", countDoctor);
        req.setAttribute("countPatient", countPatient);
        req.setAttribute("countBooking", countBooking);
        req.setAttribute("countRevenue", countRevenueString);
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/dashboard/index.jsp");
    }
}
