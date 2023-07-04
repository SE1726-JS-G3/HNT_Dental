
package com.hnt.dental.controllers.management;
import com.hnt.dental.service.DoctorService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DoctorController", value = {
        "/management/doctor",
        "/management/doctor/create",
        "/management/doctor/detail",
        "/management/doctor/update",
        "/management/doctor/my-appointment",
        "/management/doctor/my-appointment-detail",
        "/management/mypatient",
        "/management/mypatient/detail",
        "/management/doctor/delete"
})
public class DoctorController extends HttpServlet {
    private static final DoctorService doctorService;
    static {
        doctorService = new DoctorService();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        try {
            switch (action) {
                case "/management/doctor":
                    doctorService.getAllManagement(req, resp);
                    break;
                case "/management/doctor/create":
                    req.getRequestDispatcher("/WEB-INF/templates/management/doctor/create.jsp").forward(req, resp);
                    break;
                case "/management/doctor/detail":
                    doctorService.updateRender(req, resp);
                    break;
                case "/management/doctor/delete":
                    doctorService.delete(req, resp);
                    break;
                case "/management/doctor/my-appointment":
                    doctorService.getMyAppointments(req, resp);
                    break;
                case "/management/doctor/my-appointment-detail":
                    doctorService.getAppointmentDetail(req, resp);
                    break;
                case "/management/mypatient":
                    doctorService.MyPatientDoctor(req, resp);
                    break;
                case "/management/mypatient/detail":
                    doctorService.getMyPatientDetails(req, resp);
                    break;
                default:
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        try {
            switch (action) {
                case "/management/doctor/create":
                    doctorService.create(req, resp);
                    break;
                case "/management/doctor/update":
                    doctorService.update(req, resp);
                    break;
                case "/management/doctor/my-appointment-detail":
                    doctorService.updateBookingStatus(req, resp);
                    break;
                case "/management/mypatient/detail":
                    doctorService.getMyPatientDetails(req, resp);
                    break;
                default:
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}