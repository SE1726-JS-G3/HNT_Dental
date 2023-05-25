package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.VerificationDao;
import com.hnt.dental.entities.Verification;
import com.hnt.dental.util.ConnectionUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;


public class VerificationDaoIpml extends ConnectionUtils implements VerificationDao {
    private static final String SAVE_VERIFICATION = "INSERT INTO verification\n" +
            "(email, code, life_time, created_at, updated_at, created_by)\n" +
            "VALUES(?, ?, UNIX_TIMESTAMP(now() + INTERVAL 180 SECOND), ?, ?, ?)";

    @Override
    public List<Verification> getAll() throws SQLException {
        return null;
    }

    @Override
    public Optional<Verification> get(int id) throws SQLException {
        return Optional.empty();
    }

    @Override
    public Long save(Verification verification) throws SQLException, ClassNotFoundException {
        executeUpdate(SAVE_VERIFICATION, verification.getEmail(), verification.getCode(), verification.getCreatedAt(), verification.getUpdatedAt()
                , verification.getCreatedBy());
        return null;
    }


    @Override
    public void update(Verification verification) {

    }

    @Override
    public void delete(Verification verification) {

    }

/* Test ham save
    public static void main(String[] args) {
        VerificationDaoIpml verificationDaoIpm = new VerificationDaoIpml();
        try {
            verificationDaoIpm.save(Verification.builder()
                            .email("Huyen@gmail.com")
                            .code("123456")
                            .lifeTime(10)

                    .build());
        } catch (SQLException ignored) {
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    */

}
