package com.hnt.dental.dao;

import com.hnt.dental.dto.response.DoctorSummaryRes;
import com.hnt.dental.entities.Doctors;

import java.sql.SQLException;
import java.util.List;

public interface DoctorDao extends GenericDao<Doctors> {

    List<DoctorSummaryRes> getListDoctorSummary(Integer offset, Integer limit, String search) throws SQLException;

    Integer countListDoctorSummary(String search) throws SQLException;
}
