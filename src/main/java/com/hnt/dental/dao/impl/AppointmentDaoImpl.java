package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.AppointmentDao;
import com.hnt.dental.entities.Booking;
import com.hnt.dental.util.ConnectionUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class AppointmentDaoImpl implements AppointmentDao {
    private static final String SAVE_APPOINTMENT = "INSERT INTO booking " +
            "(name, phone, email, age, service_id, account_id, staff_id, `date`, `time`, fee, decription, status, created_at, updated_at) " +
            "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

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
        return ConnectionUtils.executeUpdateForIdentity(SAVE_APPOINTMENT, booking.getName(), booking.getPhone(), booking.getEmail(), booking.getAge(),
                booking.getService().getId(), booking.getAccount().getId(), booking.getEmployee().getId(), booking.getDate(), booking.getTime(),
                booking.getFee(), booking.getDescription(), booking.isStatus(), booking.getCreatedAt(), booking.getUpdatedAt());
    }

    @Override
    public void update(Booking booking) throws SQLException {

    }

    @Override
    public void delete(Booking booking) throws SQLException {

    }
}
