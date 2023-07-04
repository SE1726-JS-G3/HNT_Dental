package com.hnt.dental.dao;

import com.hnt.dental.dto.response.*;
import com.hnt.dental.entities.Booking;
import com.hnt.dental.entities.Doctors;
import com.hnt.dental.entities.Patient;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface DoctorDao extends GenericDao<Doctors> {

    List<DoctorSummaryRes> getListDoctorSummary(Integer offset, Integer limit, String search) throws SQLException;
    List<DoctorDetailDto> getDoctorDetailDto() throws SQLException;
    Optional<DoctorDetailDto> getDoctorDetail(Long id) throws SQLException;
    List<ServiceResDto> getAllServiceByIdDoctor(Long id) throws SQLException;
    Integer countListDoctorSummary(String search) throws SQLException;
    Integer countMyAppointments() throws Exception;
    List<DoctorDetailDto> getTopDoctor() throws SQLException;

    List<PatientResDto> getPatientDetail(Long id)throws SQLException;

    List<Doctors> getAllDoctor(int offset, int limit,  String search, String status, String gender) throws SQLException;

    List<BookingDto> getMyAppointments(int offset, int limit) throws SQLException;
    Optional<BookingDto> getAppointmentDetails(Long id) throws SQLException;
      void  updateBookingStatus(BookingDto booking) throws SQLException;
    List<PatitentDto> MyPatientDoctor(Integer offset, Integer limit) throws SQLException;
    List<PatitentDto> getPatientDetails(Long id,Integer offset, Integer limit) throws SQLException;
    Integer count() throws Exception;

}
