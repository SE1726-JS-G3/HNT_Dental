package com.hnt.dental.service;

import com.hnt.dental.constant.PaymentEnum;
import com.hnt.dental.dao.BookingDao;
import com.hnt.dental.dao.PaymentDao;
import com.hnt.dental.dao.ServiceDao;
import com.hnt.dental.dao.impl.BookingDaoImpl;
import com.hnt.dental.dao.impl.PaymentDaoImpl;
import com.hnt.dental.dao.impl.ServiceDaoImpl;
import com.hnt.dental.dto.response.*;
import com.hnt.dental.entities.*;
import com.hnt.dental.exception.SystemRuntimeException;
import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public class BookingService {

    private static final ServiceDao dao;
    private static final BookingDao adao;
    private static final PaymentDao pdao;
    private static final VNPayService vnPayService;

    static {
        dao = new ServiceDaoImpl();
        adao = new BookingDaoImpl();
        pdao = new PaymentDaoImpl();
        vnPayService = new VNPayService();
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
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/booking/booking.jsp");

        }
    }

    public void create(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException {
        String error = null;
        String sid = req.getParameter("id");
        String typeId = req.getParameter("typeId");
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String age = req.getParameter("age");
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        String decription = req.getParameter("decription");
        String payment = req.getParameter("payment");
        BookingDto dto = null;
        try {
            if (name == null || name.isEmpty()) {
                throw new Exception("Name is required");
            }

            if (phone == null || phone.isEmpty()) {
                throw new Exception("Phone is required");
            }

            if (gender == null || gender.isEmpty()) {
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

            ServiceDetailDto serviceResDtos = dao.getServiceDetailByServiceId(Long.valueOf(sid), Long.valueOf(typeId));

            Account loginInfo = (Account) req.getSession().getAttribute("account");

            dto = BookingDto.builder()
                    .name(name)
                    .phone(Integer.parseInt(phone))
                    .gender(Boolean.parseBoolean(gender))
                    .age(Integer.parseInt(age))
                    .date(LocalDate.parse(date, DateTimeFormatter.ofPattern("dd/MM/yyyy")))
                    .time(time)
                    .description(decription)
                    .payment(payment)
                    .build();

            Long id = adao.save(Booking.builder()
                    .name(name)
                    .account(Account.builder().id(loginInfo.getId()).build())
                    .service(Service.builder().id(serviceResDtos.getId()).build())
                    .phone(Integer.parseInt(phone))
                    .gender(Boolean.parseBoolean(gender))
                    .age(Integer.parseInt(age))
                    .date(LocalDate.parse(date, DateTimeFormatter.ofPattern("dd/MM/yyyy")))
                    .time(LocalTime.parse(time, DateTimeFormatter.ofPattern("HH:mm")))
                    .status(false)
                    .description(decription)
                    .payment(payment)
                    .createdAt(LocalDateTime.now())
                    .updatedAt(LocalDateTime.now())
                    .build());

            pdao.save(
                    Payment.builder()
                            .account(Account.builder().id(1L).build())
                            .booking(Booking.builder().id(id).build())
                            .serviceFee(ServiceFee.builder().fee(Double.valueOf(serviceResDtos.getFee())).build())
                            .status(false)
                            .type(Objects.requireNonNull(PaymentEnum.getPaymentEnum(payment)).ordinal())
                            .created_at(LocalDateTime.now())
                            .updated_at(LocalDateTime.now())
                            .build()
            );

            if (PaymentEnum.getPaymentEnum(payment) == PaymentEnum.CASH) {
                ServletUtils.redirect(req, resp, "/booking/success");
            } else {
                String url = vnPayService.renderPayment(id, Double.parseDouble(serviceResDtos.getFee()), req);
                ServletUtils.redirect(req, resp, url);
            }
            return;
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
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/booking/booking.jsp");
        } else {
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/home/booking/booking-success.jsp");
        }
    }

    public void paymentCallback(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String vnpTxnRef = req.getParameter("vnp_TxnRef");
        String vnpBankTranNo = req.getParameter("vnp_BankTranNo");
        String vnpTransactionNo = req.getParameter("vnp_TransactionNo");
        String vnpResponseCode = req.getParameter("vnp_ResponseCode");

        if (vnpTxnRef != null && Integer.parseInt(vnpTxnRef) > 0
                && vnpBankTranNo != null && vnpResponseCode != null && vnpResponseCode.equals("00")
                && vnpTransactionNo != null && Integer.parseInt(vnpTransactionNo) > 0) {
            Optional<Payment> payment = pdao.getPaymentByAppointmentId(Long.valueOf(vnpTxnRef));
            if (payment.isPresent() && Boolean.FALSE.equals(payment.get().getStatus())) {
                payment.get().setStatus(true);
                payment.get().setUpdated_at(LocalDateTime.now());
                pdao.update(payment.get());
            } else {
                throw new SystemRuntimeException("Payment not found");
            }
            ServletUtils.redirect(req, resp, "/payment/success");
        } else {
            ServletUtils.redirect(req, resp, "/payment/error");
        }
    }

    public void getAll(HttpServletRequest req, HttpServletResponse resp) {
        String page = req.getParameter("page");
        String search = req.getParameter("search");
        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }

        if (StringUtils.isEmpty(search)) {
            search = "";
        }
        try {
            Integer totalItem = adao.countListBookingSummary(search.trim());
            Integer totalPage = PagingUtils.getTotalPage(totalItem);

            List<BookingManagementDto> getAllBookingSummary = adao.getAllBookingSummary(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE, search.trim());
            List<BookingManagementDto> getServiceByServiceId = adao.getServiceByServiceId();
            List<BookingManagementDto> getStatusByStatusId = adao.getStatusByStatusId();
            req.setAttribute("services", getServiceByServiceId);
            req.setAttribute("status", getStatusByStatusId);
            req.setAttribute("bookings", getAllBookingSummary);
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("currentPage", pageNumber);
            req.setAttribute("search", search);
            req.setAttribute("url", "/management/booking");
            req.getRequestDispatcher("/WEB-INF/templates/management/booking/index.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
