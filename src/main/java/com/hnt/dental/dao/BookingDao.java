package com.hnt.dental.dao;

//import com.hnt.dental.dto.response.BookingDto;
import com.hnt.dental.entities.Booking;
import com.hnt.dental.dto.response.*;
import java.sql.SQLException;
import java.util.List;


public interface BookingDao extends GenericDao<Booking>{


    List<BookingDto> getAllHistory() throws SQLException;

    List<BookingDto> getAllHistory(Integer offset, Integer limit) throws SQLException;

    Integer countHistory() throws Exception;

    BookingDto DetailHistory(String id) throws SQLException;
}
