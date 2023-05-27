package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.PatientDao;
import com.hnt.dental.entities.Patient;
import com.hnt.dental.util.ConnectionUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class PatientDaoImpl implements PatientDao {
    private static final String SAVE_PATIENT = "INSERT INTO patients" +
            "(id, full_name, dob, gender, phone, address, description, created_at, updated_at, created_by)" +
            "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    @Override
    public List<Patient> getAll(Integer offset, Integer limit) throws SQLException {
        return null;
    }

    @Override
    public Optional<Patient> get(int id) throws SQLException {
        return Optional.empty();
    }

    @Override
    public Long save(Patient patient) {
        ConnectionUtils.executeUpdate(SAVE_PATIENT, patient.getAccount().getId(),patient.getFullName(),patient.getDob(),
                patient.getGender(),patient.getPhone(),patient.getAddress(),patient.getDescription(),patient.getCreatedAt()
        ,patient.getUpdatedAt(),patient.getCreatedBy());
        return patient.getAccount().getId();
    }

    @Override
    public void update(Patient patient) {

    }

    @Override
    public void delete(Patient patient) {

    }
}
