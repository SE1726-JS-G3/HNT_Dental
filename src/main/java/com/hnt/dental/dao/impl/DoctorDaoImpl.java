package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.DoctorDao;
import com.hnt.dental.dto.response.DoctorSummaryRes;
import com.hnt.dental.entities.Doctors;
import com.hnt.dental.util.ConnectionUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class DoctorDaoImpl implements DoctorDao {

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

    @Override
    public List<Doctors> getAll(Integer offset, Integer limit, String search) throws SQLException {
        return null;
    }

    @Override
    public Optional<Doctors> get(int id) throws SQLException {
        return Optional.empty();
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
    public Integer countListDoctorSummary(String search) throws SQLException {
        search = "%" + search + "%";
        ResultSet rs = ConnectionUtils.executeQuery(SQL_COUNT_SUMMARY, search);
        if (rs.next()) {
            return rs.getInt(1);
        }
        ConnectionUtils.closeConnection();
        return null;
    }
}
