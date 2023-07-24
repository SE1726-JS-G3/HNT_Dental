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



    BookingDto getAppointment(Long id) throws SQLException;

    Integer countAppointment() throws Exception;



    BookingDto detailAppointment(String id) throws SQLException;

    void saveServiceReview(Long id, Integer service_id, int star, String description) throws SQLException;

    void saveDoctorReview(Long id, Integer doctor_id, int star, String description) throws SQLException;

    List<BookingDto> getMyPatient(Integer offset, Integer limit, String search) throws SQLException;

    BookingDto getService(Long id) throws SQLException;

    Long countPatientDashboard() throws Exception;

    ProfileDto getProfile(Long id) throws SQLException;
}

