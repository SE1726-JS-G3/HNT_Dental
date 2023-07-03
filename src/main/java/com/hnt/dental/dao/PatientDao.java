package com.hnt.dental.dao;

import com.hnt.dental.entities.Patient;

import java.sql.SQLException;
import java.util.List;

public interface PatientDao extends GenericDao<Patient>{


//    List<Patient> getAll() throws SQLException;
//
//    List<Patient> SearchPatients(String txtSearch) throws SQLException;

    Patient DetailPatients(String id) throws SQLException;

    List<Patient> getAll(Integer offset, Integer limit) throws SQLException;

    Integer count(String search) throws Exception;
}

