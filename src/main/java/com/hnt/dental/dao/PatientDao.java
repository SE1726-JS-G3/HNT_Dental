package com.hnt.dental.dao;

import com.hnt.dental.dto.response.DoctorDetailDto;
import com.hnt.dental.dto.response.PatientResDto;
import com.hnt.dental.entities.Patient;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface PatientDao extends GenericDao<Patient>{

    List<Patient> MyPatientDoctor(Integer offset, Integer limit) throws SQLException;


    List<Patient> getPatientDetail(Long id,Integer offset, Integer limit) throws SQLException;
    Integer count() throws Exception;
}

