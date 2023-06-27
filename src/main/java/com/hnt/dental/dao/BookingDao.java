package com.hnt.dental.dao;

import com.hnt.dental.dto.response.BookingDetailPatientDto;
import com.hnt.dental.dto.response.BookingManagementDto;
import com.hnt.dental.dto.response.DoctorSummaryRes;
import com.hnt.dental.entities.Booking;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface BookingDao extends GenericDao<Booking>{

List<BookingManagementDto> getAllBookingSummary(int offset, int limit,String search) throws SQLException;
    Integer countListBookingSummary(String search) throws SQLException;

    List<BookingManagementDto> getServiceByServiceId() throws SQLException;
    List<BookingManagementDto> getStatusByStatusId() throws SQLException;
    Optional<BookingDetailPatientDto> getPatientByBookingId(Long id) throws SQLException;
}