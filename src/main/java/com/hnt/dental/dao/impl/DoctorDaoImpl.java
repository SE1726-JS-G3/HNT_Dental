package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.DoctorDao;
import com.hnt.dental.dto.response.DoctorDetailDto;
import com.hnt.dental.dto.response.DoctorSummaryRes;
import com.hnt.dental.dto.response.ServiceResDto;
import com.hnt.dental.entities.Doctors;
import com.hnt.dental.util.ConnectionUtils;

import javax.management.MBeanAttributeInfo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class DoctorDaoImpl implements DoctorDao {
    private static final String SQL_GET_ALL_SERVICE_BY_ID_DOCTOR = "select s.id, s.name, GROUP_CONCAT(st.name SEPARATOR ',')" +
            " as type, CONCAT(MIN(sf.fee), ' ~ ', MAX(sf.fee)) as fee, s.image from service s " +
            "inner join service_doctor sd on sd.id_service = s.id " +
            "inner join doctors d on d.id = sd.id_doctor " +
            "inner join service_fee sf on sf.service_id = s.id " +
            "inner join service_type st on st.id = sf.service_type " +
            "where sd.id_doctor = ? " +
            "group by s.id";
    private static final String SQL_GET_DOCTOR_BY_ID = "select * from doctors " +
            "where id = ?";


    private static final String SQL_GET_SUMMARY = "SELECT" +
            "  d.id," +
            "  d.full_name," +
            "  dr.name AS rank_name," +
            "  d.image," +
            "  LEFT(d.description, 50) AS description " +
            "FROM" +
            "  doctors d" +
            "  INNER JOIN doctor_rank dr ON d.rank_id = dr.id " +
            "WHERE" +
            "   d.full_name LIKE ? " +
            "ORDER BY d.id " +
            "LIMIT ? OFFSET ? ";

    private static final String SQL_COUNT_SUMMARY = "SELECT " +
            "  COUNT(*)" +
            "  FROM" +
            "    doctors d" +
            "    INNER JOIN doctor_rank dr ON d.rank_id = dr.id" +
            "  WHERE" +
            "    d.full_name LIKE ?" +
            "  ORDER BY" +
            "    d.id";
    private static final String SQL_GET_TOP_DOCTOR = "select * from doctors " +
            "ORDER BY RAND() LIMIT 4";

    private static final String SQL_GET_LIST_DOCTOR_AVAILABLE = "SELECT DISTINCT d.full_name, d.id " +
            "FROM doctors d " +
            "INNER JOIN service_doctor sd ON d.id = sd.id_doctor " +
            "INNER JOIN doctor_rank dr ON dr.id = d.rank_id " +
            "INNER JOIN doctor_of_rank dor ON dor.rank_id = dr.id " +
            "INNER JOIN service_type st ON st.id = dor.type_id " +
            "WHERE sd.id_service = ? " +
            "  AND st.id = ? " +
            "  AND d.id <> (" +
            "    SELECT DISTINCT d .id " +
            "    FROM doctors d " +
            "    INNER JOIN booking b ON d.id = b.doctor_id " +
            "    INNER JOIN service_doctor sd ON d.id = sd.id_doctor " +
            "    INNER JOIN doctor_rank dr ON dr.id = d.rank_id " +
            "    INNER JOIN doctor_of_rank dor ON dor.rank_id = dr.id " +
            "    INNER JOIN service_type st ON st.id = dor.type_id " +
            "    WHERE b.date = ? " +
            "      AND b.time = ? " +
            "  )";

    @Override
    public List<DoctorSummaryRes> getListDoctorAvailable(LocalDate date, LocalTime time, Long typeId, Long serviceId) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_LIST_DOCTOR_AVAILABLE, serviceId, typeId, date, time);
        List<DoctorSummaryRes> result = new ArrayList<>();
        while (rs.next()) {
            result.add(DoctorSummaryRes.builder()
                    .id(rs.getLong("id"))
                    .fullName(rs.getString("full_name"))
                    .build());
        }
        return result;
    }

    @Override
    public List<Doctors> getAll(Integer offset, Integer limit, String search) throws SQLException {
        return null;
    }

    @Override
    public Optional<Doctors> get(int id) throws SQLException {
        return Optional.empty();
    }

    public Optional<DoctorDetailDto> getDoctorDetail(Long id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_DOCTOR_BY_ID, id);
        if (rs.next()) {
            return Optional.ofNullable(DoctorDetailDto.builder()
                    .id(rs.getLong("id"))
                    .fullName(rs.getString("full_name"))
                    .position(rs.getString("position"))
                    .image(rs.getString("image"))
                    .description(rs.getString("description"))
                    .rankName(rs.getString("rank_id"))
                    .dob(rs.getDate("dob"))
                    .build());
        }
        ConnectionUtils.closeConnection();
        return Optional.empty();
    }

    @Override
    public List<ServiceResDto> getAllServiceByIdDoctor(Long id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_ALL_SERVICE_BY_ID_DOCTOR, id);
        List<ServiceResDto> result = new ArrayList<>();
        while (rs.next()) {
            result.add(ServiceResDto.builder()
                    .id(rs.getLong("id"))
                    .name(rs.getString("name"))
                    .type(rs.getString("type"))
                    .fee(rs.getString("fee"))
                    .image(rs.getString("image"))
                    .build());
        }
        return result;
    }

    @Override
    public Long save(Doctors doctors) throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public void update(Doctors doctors) throws SQLException {

    }

    @Override
    public void delete(Doctors doctors) throws SQLException {

    }

    @Override
    public List<DoctorSummaryRes> getListDoctorSummary(Integer offset, Integer limit, String search) throws SQLException {
        search = "%" + search + "%";
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_SUMMARY, search, limit, offset);
        List<DoctorSummaryRes> result = new ArrayList<>();
        while (rs.next()) {
            result.add(DoctorSummaryRes.builder()
                    .id(rs.getLong("id"))
                    .fullName(rs.getString("full_name"))
                    .rankName(rs.getString("rank_name"))
                    .image(rs.getString("image"))
                    .description(rs.getString("description"))
                    .build());
        }
        ConnectionUtils.closeConnection();
        return result;
    }

    @Override
    public List<DoctorDetailDto> getDoctorDetailDto() throws SQLException {
        //
        return null;
    }

    @Override
    public Integer countListDoctorSummary(String search) throws SQLException {
        search = "%" + search + "%";
        ResultSet rs = ConnectionUtils.executeQuery(SQL_COUNT_SUMMARY, search);
        if (rs.next()) {
            return rs.getInt(1);
        }
        ConnectionUtils.closeConnection();
        return null;
    }

    @Override
    public List<DoctorDetailDto> getTopDoctor() throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_TOP_DOCTOR);
        List<DoctorDetailDto> result = new ArrayList<>();
        while (rs.next()) {
            result.add(DoctorDetailDto.builder()
                    .id(rs.getLong("id"))
                    .fullName(rs.getString("full_name"))
                    .position(rs.getString("position"))
                    .image(rs.getString("image"))
                    .description(rs.getString("description"))
                    .rankName(rs.getString("rank_id"))
                    .dob(rs.getDate("dob"))
                    .build());
        }
        return result;
    }


}
