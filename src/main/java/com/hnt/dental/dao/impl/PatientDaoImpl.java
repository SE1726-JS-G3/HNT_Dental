package com.hnt.dental.dao.impl;
import com.hnt.dental.dao.AccountDao;

import com.hnt.dental.dao.PatientDao;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Patient;
import com.hnt.dental.util.ConnectionUtils;
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
            "(id, full_name, dob, gender, phone, address, description, created_at, updated_at, created_by)" +
            "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL_PATIENT = "SELECT a.id, p.full_name, p.dob,p.gender,p.phone " +
            "            FROM patients p " +
            "            INNER JOIN accounts a ON p.id = a.id ";
    private static final String SEARCH_PATIENT = "select * from patients where full_name like ?";


    private static final String DETAIL_PATIENT = "SELECT p.id, p.full_name, p.dob, p.gender,p.address,a.image,a.email,p.description ,p.phone " +
            "\t\tFROM patients p " +
            "            INNER JOIN accounts a ON p.id = a.id " +
            "            where p.id = ?";
    private static final String DELETE_PATIENT = "DELETE FROM patients " +
            "WHERE id=?";



    private static final String CREATE_PATIENT ="INSERT INTO patients " +
            "            ( id,full_name, dob, gender, phone, address) " +
            "            VALUES(?,?,?,?,?,?)  ";


//    private static final String UPDATE_PATIENT = "UPDATE patients " +
//            "\t\tSET full_name=?, dob=?, gender=?, phone=?, address=?, description=? " +
//            "            WHERE id=? ";
private static final String UPDATE_PATIENT = "UPDATE patients p inner join accounts a on p.id= a.id\n" +
        "            SET p.full_name=?, p.dob=?, p.gender=?, p.phone=?, p.address=?,p.description=?\n" +
        "                       WHERE p.id = ?";


    @Override
    public List<Patient> getAll() throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_PATIENT);
        List<Patient> list = new ArrayList<>();
        //Patient patient = new Patient();
        while (true) {
            assert rs != null;
            if (!rs.next()) break;

            list.add(Patient
                    .builder()
                    .id(rs.getLong("id"))
                    .fullName(rs.getString("full_name"))
                    .dob(rs.getDate("dob").toLocalDate())
                    .gender(rs.getBoolean("gender"))
                    .phone(String.valueOf(rs.getInt("phone")))

                    .build());
        }
        return list;

    }

    @Override
    public List<Patient> SearchPatients(String txtSearch) throws SQLException {
        txtSearch = StringUtils.isNotEmpty(txtSearch) ? "%" + txtSearch.toLowerCase() + "%" : "%";
        ResultSet rs = ConnectionUtils.executeQuery(SEARCH_PATIENT, txtSearch);
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
                    //.created_at(rs.getDate("created_at").toLocalDate())
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
                            .id(rs.getLong("id"))
                            .build())
                    //.id(rs.getLong("id"))
                    .fullName(rs.getString("full_name"))
                    .dob(rs.getDate("dob").toLocalDate())
                    .gender(rs.getBoolean("gender"))
                    .description(rs.getString("description"))
                    .phone(String.valueOf(rs.getInt("phone")))
                    .address(rs.getString("address"))
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
        return Optional.empty();
    }


    @Override
    public Long save(Patient patient) throws SQLException {
        ConnectionUtils.executeUpdate(CREATE_PATIENT, patient.getId(), patient.getFullName(), patient.getDob(),
                patient.getGender(), patient.getPhone(), patient.getAddress());
        return patient.getId();

    }

    @Override
    public void update(Patient patient) throws SQLException {
        ConnectionUtils.executeUpdate(UPDATE_PATIENT, patient.getFullName(),
                patient.getDob(), patient.getGender(), patient.getPhone(), patient.getAddress(),
                 patient.getCreatedAt(), patient.getUpdatedAt(), patient.getAccount().getId());




}

    @Override
    public void delete(Patient patient) throws SQLException {
        accountDao.delete(Account.builder().id(patient.getId()).build());
        ConnectionUtils.executeUpdate(DELETE_PATIENT, patient.getId());

    }



    }