package com.hnt.dental.dao.impl;

import com.hnt.dental.constant.BookingStatusEnum;
import com.hnt.dental.constant.PaymentEnum;
import com.hnt.dental.dao.BookingDao;
import com.hnt.dental.dto.response.ServiceTypeDto;
import com.hnt.dental.entities.Booking;
import com.hnt.dental.entities.Service;
import com.hnt.dental.dto.response.*;
import com.hnt.dental.entities.*;
import com.hnt.dental.util.ConnectionUtils;
import org.apache.commons.lang3.StringUtils;
import com.hnt.dental.dto.response.BookingDto;
import com.hnt.dental.dto.response.ServiceResDto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class BookingDaoImpl implements BookingDao {
    private static final String SAVE_BOOKING = "INSERT INTO booking " +
            "           ( name, phone, gender, age, account_id, service_id, `date`, `time`, decription, status, created_at, updated_at) " +
            "            VALUES(?, ?, ?, ? , ?, ?, ? ,? ,?, ?, ?, ?)";
    private static final String GET_ALL_BOOKING = "SELECT b.id, b.name, s.name as service, b.date, b.time, b.status FROM booking b " +
            "            inner join service s on b.service_id = s.id " +
            "            where (LOWER(b.name) like ? OR LOWER(s.name) like ?) AND s.id LIKE ? AND b.status LIKE ? order by b.created_at desc " +
            "LIMIT ?, ?";
    private static final String SQL_COUNT_BOOKING = "SELECT count(*) FROM booking b " +
            "                       inner join service s on b.service_id = s.id " +
            "                      where LOWER(b.name) like ? OR LOWER(s.name) like ? order by b.id";
    private static final String SQL_GET_SERVICE_BY_SERVICE_ID = "select DISTINCT s.name, s.id from booking b " +
            "inner join service s on b.service_id = s.id";

    private static final String SQL_GET_STATUS = "select distinct b.status from booking b ";

    private static final String SQL_GET_PATIENT = "select b.id, b.name, b.gender, b.phone, b.age from booking b " +
            "where b.id = ?";
    private static final String SQL_GET_DOCTOR = "select b.id, d.full_name, dr.name, d.position, d.gender, d.image from booking b " +
            "inner join doctors d on b.doctor_id = d.id " +
            "inner join doctor_rank dr on dr.id = d.rank_id " +
            "where b.id = ?";
    private static final String SQL_GET_SERVICE_BY_BOOKING_ID = "select s.id, s.name,s.image, st.name  as serviceType, st.id as typeID , p.fee from booking b " +
            "inner join service s on b.service_id = s.id " +
            "inner join service_type st on st.id = b.service_type_id " +
            "inner join payment p on p.booking_id = b.id " +
            "where b.id = ? ";
    private static final String SQL_GET_BOOKING_DETAIL_BY_BOOKING_ID = "select b.date, b.time,b.status as statusBooking, d.full_name as doctorName ," +
            " e.full_name as employeeName, p.status as statusPayment, p.type, b.decription  from booking b " +
            "inner join doctors d on b.doctor_id = d.id " +
            "inner join employees e on e.id = b.staff_id " +
            "inner join payment p on p.booking_id = b.id " +
            "where b.id = ? ";
    private static final String HISTORY_PATIENT = "SELECT  b.fee ,b.account_id, b.status ,b.time,b.date ,s.name  FROM booking b join service s \n" +
            " where b.service_id = s.id ";
    private static final String HISTORY_DETAIL = "SELECT b.date,b.name, b.age, b.email,b.decription,b.status,b.phone,s.name as service FROM booking b join service_type s \n" +
            "                       on b.service_id = s.id where b.id =?";


    @Override
    public List<Booking> getAll(Integer offset, Integer limit, String search) throws SQLException {
        return null;
    }
    @Override
    public Optional<Booking> get(int id) throws SQLException {
        return Optional.empty();
    }
    @Override
    public Long save(Booking booking) throws SQLException, ClassNotFoundException {
        return ConnectionUtils.executeUpdateForIdentity(SAVE_BOOKING, booking.getName(), booking.getPhone(), booking.isGender(), booking.getAge(),
                booking.getAccount().getId(), booking.getService().getId(), booking.getDate(), booking.getTime(),
                booking.getDescription(), booking.getStatus(), booking.getCreatedAt(), booking.getUpdatedAt());
    }
    @Override
    public void update(Booking booking) throws SQLException {

    }
    @Override
    public void delete(Booking booking) throws SQLException {

    }

    @Override
    public List<BookingManagementDto> getAllBookingSummary(int offset, int limit, String search, String serviceId, String status) throws SQLException {
        search = StringUtils.isNotEmpty(search) ? "%" + search.toLowerCase() + "%" : "%";
        serviceId = StringUtils.isNotEmpty(serviceId) ? serviceId : "%";
        status = StringUtils.isNotEmpty(status) ? status : "%";
        ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_BOOKING, search, search, serviceId, status, offset, limit);
        List<BookingManagementDto> list = new ArrayList<>();
        while (rs.next()) {
            list.add(BookingManagementDto.builder()
                    .id(rs.getLong("id"))
                    .name(rs.getString("name"))
                    .service(Service.builder().name(rs.getString("service")).build())
                    .date(rs.getDate("date").toLocalDate())
                    .time(rs.getTime("time").toLocalTime())
                    .status(BookingStatusEnum.getBookingStatusString(rs.getInt("status")))
                    .build());
        }
        ConnectionUtils.closeConnection();
        return list;
    }

    @Override
    public Integer countListBookingSummary(String search) throws SQLException {
        search = "%" + search + "%";
        ResultSet rs = ConnectionUtils.executeQuery(SQL_COUNT_BOOKING, search, search);
        if (rs.next()) {
            return rs.getInt(1);
        }
        ConnectionUtils.closeConnection();
        return null;
    }


    @Override
    public List<BookingManagementDto> getServiceByServiceId() throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_SERVICE_BY_SERVICE_ID);
        List<BookingManagementDto> list = new ArrayList<>();
        while (rs.next()) {
            list.add(BookingManagementDto.builder()
                    .service(Service.builder().name(rs.getString("name")).id(rs.getLong("id")).build())
                    .build());
        }
        ConnectionUtils.closeConnection();
        return list;
    }

    public List<BookingDto> getAllHistory() throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(HISTORY_PATIENT);
        List<BookingDto> list = new ArrayList<>();
        while (true) {
            assert rs != null;
            if (!rs.next()) break;
            list.add(BookingDto
                    .builder().serviceResDto(ServiceResDto.builder()
                            .name(rs.getString("name"))
                            .build())
                    .date(rs.getDate("date").toLocalDate())
                    .status(String.valueOf(rs.getBoolean("status")))
                    .time(String.valueOf(rs.getTime("time")))
                    .fee(rs.getDouble("fee"))
                    .account_id(rs.getInt("account_id"))
                    .build());
        }
        return list;

    }


    @Override
    public BookingDto DetailHistory(String id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(HISTORY_DETAIL, id);

        assert rs != null;

//        if (rs.next()) {
//            return (BookingDto.builder()
//                    .phone(rs.getInt("phone"))
//                    .status(String.valueOf(rs.getBoolean("status")))
//                    .name(rs.getString("name"))
//                    .email(rs.getString("email"))
//                    .age(rs.getInt("age"))
//                    .decription(rs.getString("decription"))
//                    .date(rs.getDate("date").toLocalDate())
//                    .build());
//        }
        return null;

    }

    @Override
    public void updateBookingDetail(BookingDetailDto bookingDetailDto) throws SQLException {

    }


    @Override
    public Optional<BookingDetailPatientDto> getPatientByBookingId(Long id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_PATIENT, id);
        if (rs.next()) {
            return Optional.ofNullable(
                    BookingDetailPatientDto
                            .builder()
                            .id(rs.getLong("id"))
                            .name(rs.getString("name"))
                            .gender(rs.getBoolean("gender"))
                            .phone(rs.getString("phone"))
                            .age(rs.getInt("age"))
                            .build()
            );
        }
        ConnectionUtils.closeConnection();
        return Optional.empty();
    }

    @Override
    public Optional<BookingDetailDoctorDto> getDoctorByBookingId(Long id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_DOCTOR, id);
        if (rs.next()) {
            return Optional.ofNullable(
                    BookingDetailDoctorDto
                            .builder()
                            .id(rs.getLong("id"))
                            .doctors(
                                    Doctors.builder()
                                            .fullName(rs.getString("full_name"))
                                            .gender(rs.getBoolean("gender"))
                                            .position(rs.getString("position"))
                                            .image(rs.getString("image"))
                                            .build())
                            .doctorRank(
                                    DoctorRank.builder()
                                            .name(rs.getString("name"))
                                            .build())
                            .build());
        }
        ConnectionUtils.closeConnection();
        return Optional.empty();
    }

    @Override
    public Optional<BookingDetailServiceDto> getServiceByBookingId(Long id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_SERVICE_BY_BOOKING_ID, id);
        if (rs.next()) {
            return Optional.ofNullable(
                    BookingDetailServiceDto
                            .builder()
                            .id(rs.getLong("id"))
                            .name(rs.getString("name"))
                            .image(rs.getString("image"))
                            .type(rs.getString("serviceType"))
                            .fee(rs.getDouble("fee"))
                            .typeId(rs.getLong("typeID"))
                            .build());
        }
        return Optional.empty();
    }

    @Override
    public Optional<BookingDetailDto> getBookingDetailById(Long id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_BOOKING_DETAIL_BY_BOOKING_ID, id);
        if (rs.next()) {
            return Optional.ofNullable(
                    BookingDetailDto
                            .builder()
                            .date(rs.getDate("date").toLocalDate())
                            .time(rs.getTime("time").toLocalTime())
                            .status(BookingStatusEnum.getBookingStatusString(rs.getInt("statusBooking")))
                            .doctors(Doctors.builder().fullName(rs.getString("doctorName")).build())
                            .employee(Employee.builder().fullName(rs.getString("employeeName")).build())
                            .payment(Payment.builder().status(rs.getBoolean("statusPayment")).type(rs.getInt("type")).build())
                            .decription(rs.getString("decription"))
                            .paymentType(PaymentEnum.getPaymentString(rs.getInt("type")))
                            .build());
        }
        return Optional.empty();
    }
}
