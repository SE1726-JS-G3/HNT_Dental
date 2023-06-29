package com.hnt.dental.dao.impl;
import com.hnt.dental.dao.AccountDao;

import com.hnt.dental.dao.PatientDao;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Employee;
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
    private static final String GET_ALL_PATIENT = "SELECT p.id, p.full_name, p.dob,p.gender,p.status \n" +
            "            FROM patients p " ;
    private static final String SEARCH_PATIENT = "select * from patients where full_name like ?";

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

    @Override
    public List<Patient> getAll() throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_PATIENT);
        List<Patient> list = new ArrayList<>();
        while (true) {
            assert rs != null;
            if (!rs.next()) break;
            list.add(Patient
                    .builder()
                    .id(rs.getLong("id"))
                    .fullName(rs.getString("full_name"))
                    .dob(rs.getDate("dob").toLocalDate())
                    .gender(rs.getBoolean("gender"))
                    .status(rs.getBoolean("status"))
                    .build());
        }
        return list;

    }

    @Override
    public List<Patient> SearchPatients(String Search) throws SQLException {
        Search = StringUtils.isNotEmpty(Search) ? "%" + Search.toLowerCase() + "%" : "%";
        ResultSet rs = ConnectionUtils.executeQuery(SEARCH_PATIENT, Search);
        List<Patient> list = new ArrayList<>();
        assert rs != null;
        if (rs.next()) {
            list.add(Patient
                    .builder()
                    .id(rs.getLong("id"))
                    .fullName(rs.getString("full_name"))
                    .dob(rs.getDate("dob").toLocalDate())
                    .gender(rs.getBoolean("gender"))
                    .phone(String.valueOf(rs.getInt("phone")))
                    .status(rs.getBoolean("status"))
                    .build());
        }
        return list;
    }


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
        return null;
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
}