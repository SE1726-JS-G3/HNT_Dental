package com.hnt.dental.controllers;

import com.hnt.dental.dao.PatientDao;
import com.hnt.dental.dao.impl.PatientDaoImpl;
import com.hnt.dental.entities.Patient;
import com.hnt.dental.exception.SystemRuntimeException;
import com.hnt.dental.service.AuthService;
import com.hnt.dental.service.PatientService;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.EOFException;
import java.io.IOException;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.List;


@WebServlet(name = "PatientController", value = {
        "/management/patient",
        "/management/detail",
        "/management/delete",
        "/management/create",
        "/management/update",
        "/management/patient/update"



//        "/management/search"

})
public class PatientController extends HttpServlet {

    private static final PatientService service;

    static {
        service = new PatientService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getServletPath();
        switch (action) {
            case "/management/patient":

                try {
                    service.patient(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "/management/detail":
                try {
                    service.patientDetail(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "/management/delete":
                try {
                    service.delete(req,resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "/management/create":
                req.getRequestDispatcher("/WEB-INF/templates/management/patient/create.jsp").forward(req, resp);
                break;

            case "/management/patient/update":
                try {
                    service.patientDetail(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;


            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String action = req.getServletPath();
        switch (action) {
            case "/management/patient":
                try {
                    service.patientSearch(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "/management/create":
                try {
                    service.create(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;

            case "/management/patient/update":
                try {
                    service.update(req, resp);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;


            default:
        }
    }


}


