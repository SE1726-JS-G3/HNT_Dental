package com.hnt.dental.dao;

import com.hnt.dental.dto.response.*;
import com.hnt.dental.entities.Booking;
import com.hnt.dental.dto.response.*;
import java.sql.SQLException;
import java.util.List;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface BookingDao extends GenericDao<Booking> {

    List<BookingManagementDto> getAllBookingSummary(int offset, int limit, String search, String serviceId, String status) throws SQLException;

    Integer countListBookingSummary(String search) throws SQLException;

    List<BookingManagementDto> getServiceByServiceId() throws SQLException;

    Optional<BookingDetailPatientDto> getPatientByBookingId(Long id) throws SQLException;

    Optional<BookingDetailDoctorDto> getDoctorByBookingId(Long id) throws SQLException;


    Optional<BookingDetailServiceDto> getServiceByBookingId(Long id) throws SQLException;

    Optional<BookingDetailDto> getBookingDetailById(Long id) throws SQLException;
    
    List<BookingDto> getAllHistory() throws SQLException;
    BookingDto DetailHistory(String id) throws SQLException;
}
