package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.PatientDao;
import com.hnt.dental.dto.response.DoctorDetailDto;
import com.hnt.dental.dto.response.PatientResDto;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Booking;
import com.hnt.dental.entities.Patient;
import com.hnt.dental.util.ConnectionUtils;
import com.hnt.dental.util.DateUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class PatientDaoImpl implements PatientDao {
    private static final String SAVE_PATIENT = "INSERT INTO patients" +
            "(id, full_name, dob, gender, phone, address, description, created_at, updated_at)" +
            "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";


    @Override
    public List<Patient> getAll(Integer offset, Integer limit, String search) throws SQLException {
        return new ArrayList<>();
    }

    @Override
    public Optional<Patient> get(int id) throws SQLException {
        return Optional.empty();
    }

    @Override
    public Long save(Patient patient) throws SQLException {
        ConnectionUtils.executeUpdate(SAVE_PATIENT, patient.getAccount().getId(), patient.getFullName(), patient.getDob(),
                patient.getGender(), patient.getPhone(), patient.getAddress(), patient.getDescription(),
                patient.getCreatedAt(), patient.getUpdatedAt());
        return patient.getAccount().getId();
    }


    @Override
    public void update(Patient patient) {

    }

    @Override
    public void delete(Patient patient) {

    }

    private static final String MY_PATIENT_DOCTOR_QUERY =
            "SELECT p.id, p.full_name, b.date, b.time,b.status, p.gender, p.dob, b.created_at,b.name, a.email, p.phone " +
                    "FROM patients p " +
                    "JOIN booking b ON b.account_id = p.id " +
                    "JOIN doctors d ON d.id = b.staff_id " +
                    "JOIN accounts a ON a.id = p.id " +
                    "ORDER BY p.id ASC " +
                    "LIMIT ?, ?";

    private static final String MY_PATIENT_DETAIL_QUERY = "SELECT DISTINCT p.id, p.full_name, b.name, a.email, p.phone, p.gender, p.dob, b.date, b.time, b.status " +
            "FROM patients p " +
            "INNER JOIN booking b ON b.account_id = p.id " +
            "INNER JOIN doctors d ON d.id = b.staff_id " +
            "JOIN accounts a ON a.id = p.id " +
            "WHERE p.id = ? " +
            "ORDER BY p.id ASC " +
            "LIMIT ?, ?";
    private static final String COUNT_EMPLOYEE = "SELECT COUNT(*) FROM patients";


    @Override
    public List<Patient> getPatientDetail(Long id,Integer offset, Integer limit) throws SQLException {
        List<Patient> patient = new ArrayList<>();
        ResultSet rs = ConnectionUtils.executeQuery(MY_PATIENT_DETAIL_QUERY, Long.valueOf(id),offset,limit);
        while (rs.next()) {
            patient.add(
                    Patient.builder()
                            .id(rs.getLong("id"))
                            .fullName(rs.getString("full_name"))
                            .phone(rs.getString("phone"))
                            .gender(rs.getBoolean("gender"))
                            .dob(rs.getDate("dob").toLocalDate())
                            .booking(
                                    Booking.builder()
                                            .date(rs.getDate("date").toLocalDate())
                                            .time(rs.getTime("time").toLocalTime())
                                            .status(rs.getBoolean("status") ? 1 : 0)

                                            .name(rs.getString("name"))
                                            .build()
                            )
                            .account(
                                    Account.builder()
                                            .id(rs.getLong("id"))
                                            .email(rs.getString("email"))
                                            .build()
                            )
                            .build()
            );
        }
        ConnectionUtils.closeConnection();
        return patient;
    }


    @Override
    public List<Patient> MyPatientDoctor(Integer offset, Integer limit) throws SQLException {
        List<Patient> patients = new ArrayList<>();
        ResultSet rs = ConnectionUtils.executeQuery(MY_PATIENT_DOCTOR_QUERY, offset, limit);
        while (rs.next()) {
            patients.add(
                    Patient.builder()
                            .id(rs.getLong("id"))
                            .fullName(rs.getString("full_name"))
                            .dob(rs.getDate("dob") != null ? DateUtils.convertDateToLocalDate(rs.getDate("dob")) : null)
                            .phone(rs.getString("phone"))
                            .gender(rs.getBoolean("gender"))
                            .account(
                                    Account.builder()
                                            .id(rs.getLong("id"))
                                            .email(rs.getString("email"))
                                            .build()
                            )
                            .booking(
                                    Booking.builder()
                                            .name((rs.getString("name")))
                                            .date(rs.getDate("date").toLocalDate())
                                            .time(rs.getTime("time").toLocalTime())
                                            .status(rs.getBoolean("status") ? 1 : 0)

                                            .build()

                            )
                            .build()
            );
        }
        ConnectionUtils.closeConnection();
        return patients;
    }


    @Override
    public Integer count() throws Exception {
        ResultSet rs = ConnectionUtils.executeQuery(COUNT_EMPLOYEE);
        assert rs != null;
        if (rs.next()) {
            return rs.getInt(1);
        }
        return 0;
    }


}