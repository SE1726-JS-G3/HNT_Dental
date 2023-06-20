package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.PaymentDao;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Payment;
import com.hnt.dental.util.ConnectionUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class PaymentDaoImpl implements PaymentDao {

    private static final String GET_PAYMENT_BY_BOOKING_ID = "SELECT * FROM payment p " +
            "inner join booking b on p.booking_id = b.id " +
            "where b.id = ?";

    @Override
    public List<Payment> getAll(Integer offset, Integer limit, String search) throws SQLException {
        return null;
    }

    @Override
    public Optional<Payment> get(int id) throws SQLException {
        return Optional.empty();
    }

    @Override
    public Long save(Payment payment) throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public void update(Payment payment) throws SQLException {

    }

    @Override
    public void delete(Payment payment) throws SQLException {

    }

    @Override
    public Optional<Payment> getPaymentByAppointmentId(Long id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(GET_PAYMENT_BY_BOOKING_ID, id);
        if (rs.next()) {
            return Optional.of(Payment.builder()
                    .account(Account.builder().id(rs.getLong("account_id")).build())
                    .status(rs.getBoolean("status"))
                    .create_at(rs.getDate("create_at"))
                    .update_at(rs.getDate("update_at"))
                    .build());
        }
        return Optional.empty();
    }

    public static void main(String[] args) {
        try {
            System.out.println(new PaymentDaoImpl().getPaymentByAppointmentId(1L));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
