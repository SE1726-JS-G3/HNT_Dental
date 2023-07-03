package com.hnt.dental.dao.impl;
import com.hnt.dental.dao.AccountDao;

import com.hnt.dental.dao.PatientDao;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Patient;
import com.hnt.dental.util.ConnectionUtils;
import com.hnt.dental.util.DateUtils;
import org.apache.commons.lang3.StringUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class PatientDaoImpl implements PatientDao {
    private static AccountDao accountDao;
    static {
        accountDao = new AccountDaoImpl();
    }
    private static final String SAVE_PATIENT = "INSERT INTO patients" +
            "(id,dob, full_name, gender, phone, address) \n" +
            "VALUES(?, ?, ?, ?, ?, ?)";
    private static final String DETAIL_PATIENT = "SELECT p.id, p.full_name, p.dob, p.gender,p.address,p.description ,p.phone,p.status,a.email \n" +
        "                       FROM patients p inner join  accounts a on p.id = a.id\n" +
        "                      where p.id = ?";
    private static final String DELETE_PATIENT = "DELETE FROM patients " +
            "WHERE id=?";
    private static final String CREATE_PATIENT ="INSERT INTO patients " +
            "            ( id,full_name, dob, gender, phone, address,created_at) " +
            "            VALUES(?,?,?,?,?,?,?)  ";

    private static final String UPDATE_PATIENT = "UPDATE patients \n" +
            "           SET full_name=?, dob=?, gender=?, phone=?, address=?, description=?,status=?,created_at=?, updated_at=? \n" +
            "                      WHERE id=?";
    private static final String GET_PATIENT_BY_ID = "SELECT * FROM patients where id =?";
    private static final String GET_ALL_PATIENTS = "SELECT a.id, p.full_name, p.dob,p.gender,p.status\n" +
            "FROM patients p " +
            "INNER JOIN accounts a ON p.id = a.id " +
            "WHERE LOWER(p.full_name) LIKE ? " +
            "OR LOWER(a.email) LIKE ? " +
            "OR LOWER(p.dob) LIKE ? " +
            "LIMIT ?, ?";
    private static final String COUNT_PATIENT = "SELECT COUNT(*) FROM patients p " +
            "INNER JOIN accounts a ON p.id = a.id " +
            "WHERE LOWER(p.full_name) LIKE ? " +
            "OR LOWER(a.email) LIKE ? " +
            "OR LOWER(p.dob) LIKE ? ";

    @Override
    public Patient DetailPatients(String id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(DETAIL_PATIENT, id);
        assert rs != null;
        if (rs.next()) {
            return (Patient.builder().account(Account.builder()
                            .email(rs.getString("email"))
                            .build())
                    .id(rs.getLong("id"))
                    .fullName(rs.getString("full_name"))
                    .dob(rs.getDate("dob").toLocalDate())
                    .gender(rs.getBoolean("gender"))
                    .description(rs.getString("description"))
                    .phone(String.valueOf(rs.getInt("phone")))
                    .address(rs.getString("address"))
                    .status(Boolean.parseBoolean(rs.getString("status")))
                    .build());
        }
        return null;

    }
    @Override
    public List<Patient> getAll(Integer offset, Integer limit) throws SQLException {
        return null;
    }

    @Override
    public List<Patient> getAll(Integer offset, Integer limit, String search) throws SQLException {
        List<Patient> patients = new ArrayList<>();
        search = StringUtils.isNotEmpty(search) ? "%" + search.toLowerCase() + "%" : "%";
        ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_PATIENTS, search, search, search, offset, limit);
        while (rs.next()) {
            patients.add(
                    Patient.builder()
                            .account(
                                    Account.builder()
                                            .id(rs.getLong("id"))
                                            //.email(rs.getString("email"))
                                            .build()
                            )
                            .fullName(rs.getString("full_name"))
                            .dob(DateUtils.convertDateToLocalDate(rs.getDate("dob")))
                            .gender(rs.getBoolean("gender"))
                            .status(rs.getBoolean("status"))
                            .build()
            );
        }
        ConnectionUtils.closeConnection();
        return patients;
    }

    @Override
    public Optional<Patient> get(int id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(GET_PATIENT_BY_ID, id);
        assert rs != null;
        if (rs.next()) {
            return Optional.ofNullable(Patient.builder()
                    .fullName(rs.getString("full_name"))
                    .account(Account.builder()
                                    .email("email")
                                    .build())
                    .phone(rs.getString("phone"))
                    .address(rs.getString("address"))
                    .dob(DateUtils.convertDateToLocalDate(rs.getDate("dob")))
                    .gender(rs.getBoolean("gender"))
                    .description(rs.getString("description"))

                    .build());
        }
        ConnectionUtils.closeConnection();
        return Optional.empty();
    }


    @Override
    public Long save(Patient patient) throws SQLException,ClassNotFoundException {
        ConnectionUtils.executeUpdate(CREATE_PATIENT,patient.getAccount().getId(), patient.getFullName(), patient.getDob(),
                patient.getGender(), patient.getPhone(), patient.getAddress(),patient.getCreatedAt());
      return null;
    }

    @Override
    public void update(Patient patient) throws SQLException {
        ConnectionUtils.executeUpdate(UPDATE_PATIENT, patient.getFullName(),
                patient.getDob(), patient.getGender(), patient.getPhone(), patient.getAddress(),patient.getDescription(),patient.getStatus(),patient.getCreatedAt(),patient.getUpdatedAt(),
                  patient.getAccount().getId());
    }
    @Override
    public void delete(Patient patient) throws SQLException {
        accountDao.delete(Account.builder().id(patient.getId()).build());
        ConnectionUtils.executeUpdate(DELETE_PATIENT, patient.getId());
    }
    @Override
    public Integer count(String search) throws Exception {
        search = StringUtils.isNotEmpty(search) ? "%" + search.toLowerCase() + "%" : "%";
        ResultSet rs = ConnectionUtils.executeQuery(COUNT_PATIENT, search, search, search);
        assert rs != null;
        if (rs.next()) {
            return rs.getInt(1);
        }
        ConnectionUtils.closeConnection();
        return null;
    }


}