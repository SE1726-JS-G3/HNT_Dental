package com.hnt.dental.dao;

import com.hnt.dental.dto.response.BookingDto;
import com.hnt.dental.dto.response.ProfileDto;
import com.hnt.dental.entities.Patient;

import java.sql.SQLException;
import java.util.List;


public interface PatientDao extends GenericDao<Patient>{



    Patient DetailPatients(String id) throws SQLException;

    List<Patient> getAll(Integer offset, Integer limit) throws SQLException;

    Integer count(String search) throws Exception;

    List<BookingDto> getAppointment(Integer offset, Integer limit) throws SQLException;

    Integer countAppointment() throws Exception;



    BookingDto detailAppointment(String id) throws SQLException;

    List<BookingDto> getAppointmentService(Integer offset, Integer limit) throws SQLException;
    Long countPatientDashboard() throws Exception;

    ProfileDto getProfile(Long id) throws SQLException;
}

