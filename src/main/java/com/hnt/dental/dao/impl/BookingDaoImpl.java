package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.BookingDao;
import com.hnt.dental.dto.response.ServiceTypeDto;
import com.hnt.dental.entities.Booking;
import com.hnt.dental.entities.Service;
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
            "(name, phone, email, age, service_id, account_id, `date`, `time`, fee, decription, status, created_at, updated_at) " +
            "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
    private static final String GET_ALL_BOOKING = "SELECT b.id, b.name, s.name as service, b.date, b.time, b.status FROM booking b " +
            "            inner join service s on b.service_id = s.id " +
            "            where LOWER(b.name) like ? OR LOWER(s.name) like ? " +
            "LIMIT ?, ?";


    private static final String HISTORY_PATIENT = "SELECT  b.fee ,b.account_id, b.status ,b.time,b.date ,s.name  FROM booking b join service s \n" +
            " where b.service_id = s.id ";
    private static final String HISTORY_DETAIL ="SELECT b.date,b.name, b.age, b.email,b.decription,b.status,b.phone,s.name as service FROM booking b join service_type s \n" +
            "                       on b.service_id = s.id where b.id =?" ;

    @Override
    public List<Booking> getAll(Integer offset, Integer limit, String search) throws SQLException {
        search = StringUtils.isNotEmpty(search) ? "%" + search.toLowerCase() + "%" : "%";
        ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_BOOKING, search, search, offset, limit);
        List<Booking> list = new ArrayList<>();
        while (rs.next()) {
            list.add(Booking.builder()
                    .name(rs.getString("name"))
                    .service(Service.builder().name(rs.getString("service")).build())
                    .date(rs.getDate("date").toLocalDate())
                    .time(rs.getTime("time").toLocalTime())
                    .status(rs.getBoolean("status"))
                    .build());
        }
        ConnectionUtils.closeConnection();
        return list;
    }

    @Override
    public Optional<Booking> get(int id) throws SQLException {
        return Optional.empty();
    }


    @Override
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
                    .status(rs.getString("status"))
                    .time(String.valueOf(rs.getTime("time")))
                    .fee(rs.getDouble("fee"))
                    .account_id(rs.getInt("account_id"))
                    .build());
        }
        return list;

    }


        @Override
    public BookingDto DetailHistory(String id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(HISTORY_DETAIL,id);

        assert rs != null;

        if (rs.next()) {
            return (BookingDto.builder().serviceTypeDto(ServiceTypeDto.builder()
                            .nameType(rs.getString("service"))
                            .build())
                    .phone(rs.getInt("phone"))
                    .status(String.valueOf(rs.getBoolean("status")))
                    .name(rs.getString("name"))
                    .email(rs.getString("email"))
                    .age(rs.getInt("age"))
                    .decription(rs.getString("decription"))
                    .date(rs.getDate("date").toLocalDate())
                    .build());
        }
        return null;

    }



    @Override
    public Long save(Booking booking) throws SQLException, ClassNotFoundException {
        return ConnectionUtils.executeUpdateForIdentity(SAVE_BOOKING, booking.getName(), booking.getPhone(), booking.getEmail(), booking.getAge(),
                booking.getService().getId(), booking.getAccount().getId(), booking.getDate(), booking.getTime(),
                booking.getFee(), booking.getDescription(), booking.isStatus(), booking.getCreatedAt(), booking.getUpdatedAt());
    }

    @Override
    public void update(Booking booking) throws SQLException {

    }

    @Override
    public void delete(Booking booking) throws SQLException {

    }
}
