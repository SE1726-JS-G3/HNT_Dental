package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.BookingDao;
import com.hnt.dental.dto.response.BookingManagementDto;
import com.hnt.dental.dto.response.DoctorSummaryRes;
import com.hnt.dental.entities.Booking;
import com.hnt.dental.entities.Service;
import com.hnt.dental.util.ConnectionUtils;
import org.apache.commons.lang3.StringUtils;

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
    private static final String SQL_COUNT_BOOKING = "SELECT count(*) FROM booking b " +
            "                       inner join service s on b.service_id = s.id " +
            "                      where LOWER(b.name) like ? OR LOWER(s.name) like ? order by b.id";

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

    @Override
    public List<BookingManagementDto> getAllBookingSummary(int offset, int limit, String search) throws SQLException {
        search = StringUtils.isNotEmpty(search) ? "%" + search.toLowerCase() + "%" : "%";
        ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_BOOKING, search, search, offset, limit);
        List<BookingManagementDto> list = new ArrayList<>();
        while (rs.next()) {
            list.add(BookingManagementDto.builder()
                    .id(rs.getLong("id"))
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
    public Integer countListBookingSummary(String search) throws SQLException {
        search = "%" + search + "%";
        ResultSet rs = ConnectionUtils.executeQuery(SQL_COUNT_BOOKING, search, search);
        if (rs.next()) {
            return rs.getInt(1);
        }
        ConnectionUtils.closeConnection();
        return null;
    }

}
