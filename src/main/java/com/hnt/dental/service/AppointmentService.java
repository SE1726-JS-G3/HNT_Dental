package com.hnt.dental.service;

import com.hnt.dental.dao.AppointmentDao;
import com.hnt.dental.dao.ServiceDao;
import com.hnt.dental.dao.impl.AppointmentDaoImpl;
import com.hnt.dental.dao.impl.ServiceDaoImpl;
import com.hnt.dental.dto.AppointmentDto;
import com.hnt.dental.dto.response.ServiceDetailDto;
import com.hnt.dental.dto.response.ServiceTypeDto;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Booking;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.entities.Service;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class AppointmentService {

    private static final ServiceDao dao;
    private static final AppointmentDao adao;

    static {
        dao = new ServiceDaoImpl();
        adao = new AppointmentDaoImpl();
    }

    public void renderData(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("serviceId");
        String typeId = req.getParameter("typeId");
        List<ServiceTypeDto> getType = dao.getTypeByServiceId(Long.valueOf(id));
        if (getType.isEmpty()) {
            ServletUtils.redirect(req, resp, "/service");
        } else {
            typeId = (typeId == null ? getType.get(0).getIdType() : Long.valueOf(typeId)).toString();
            ServiceDetailDto serviceResDtos = dao.getServiceDetailByServiceId(Long.valueOf(id), Long.valueOf(typeId));

            req.setAttribute("services", serviceResDtos);
            req.setAttribute("types", getType);
            req.setAttribute("typeId", typeId);
            req.setAttribute("id", id);
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/appointment/booking.jsp");

        }
    }

    public void create(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String error = null;
        String sid = req.getParameter("id");
        String typeId = req.getParameter("typeId");
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String age = req.getParameter("age");
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        String decription = req.getParameter("decription");
        String payment = req.getParameter("payment");
        AppointmentDto dto = null;
        try {
            if (name == null || name.isEmpty()) {
                throw new Exception("Name is required");
            }

            if (phone == null || phone.isEmpty()) {
                throw new Exception("Phone is required");
            }

            if (email == null || email.isEmpty()) {
                throw new Exception("Email is required");
            }

            if (age == null || age.isEmpty()) {
                throw new Exception("Age is required");
            }

            if (date == null || date.isEmpty()) {
                throw new Exception("Date is required");
            }

            if (time == null || time.isEmpty()) {
                throw new Exception("Time is required");
            }

            if (decription == null || decription.isEmpty()) {
                throw new Exception("Decription is required");
            }

            if (payment == null || payment.isEmpty()) {
                throw new Exception("Payment is required");
            }

            dto = AppointmentDto.builder()
                    .name(name)
                    .phone(Integer.parseInt(phone))
                    .email(email)
                    .age(Integer.parseInt(age))
                    .date(LocalDate.parse(date, DateTimeFormatter.ofPattern("dd/MM/yyyy")))
                    .time(time)
                    .decription(decription)
                    .payment(payment)
                    .build();

            Long id = adao.save(Booking.builder()
                    .name(name)
                    .account(Account.builder().id(1L).build())
                    .employee(Employee.builder().id(1L).build())
                    .service(Service.builder().id(Long.parseLong(req.getParameter("id"))).build())
                    .phone(Integer.parseInt(phone))
                    .email(email)
                    .age(Integer.parseInt(age))
                    .date(LocalDate.parse(date, DateTimeFormatter.ofPattern("dd/MM/yyyy")))
                    .time(LocalTime.parse(time, DateTimeFormatter.ofPattern("HH:mm")))
                    .status(false)
                    .decription(decription)
                    .payment(payment)
                    .build());

        } catch (Exception e) {
            error = e.getMessage();
        }

        if (error != null) {
            req.setAttribute("error", error);

            req.setAttribute("appointment", dto);
            List<ServiceTypeDto> getType = dao.getTypeByServiceId(Long.valueOf(sid));
            typeId = (typeId == null ? getType.get(0).getIdType() : Long.valueOf(typeId)).toString();
            ServiceDetailDto serviceResDtos = dao.getServiceDetailByServiceId(Long.valueOf(sid), Long.valueOf(typeId));

            req.setAttribute("services", serviceResDtos);
            req.setAttribute("types", getType);
            req.setAttribute("typeId", typeId);
            req.setAttribute("id", sid);
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/appointment/booking.jsp");
        } else {
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/appointment/booking-success.jsp");
        }
    }
}