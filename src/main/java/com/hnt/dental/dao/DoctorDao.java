package com.hnt.dental.dao;

import com.hnt.dental.dto.response.DoctorDetailDto;
import com.hnt.dental.dto.response.DoctorSummaryRes;
import com.hnt.dental.dto.response.ServiceResDto;
import com.hnt.dental.entities.Doctors;
import com.hnt.dental.dto.response.DoctorDto;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface DoctorDao extends GenericDao<Doctors> {

    List<DoctorSummaryRes> getListDoctorSummary(Integer offset, Integer limit, String search) throws SQLException;
    List<DoctorDetailDto> getDoctorDetailDto() throws SQLException;
    Optional<DoctorDetailDto> getDoctorDetail(Long id) throws SQLException;
    List<ServiceResDto> getAllServiceByIdDoctor(Long id) throws SQLException;
    Integer countListDoctorSummary(String search) throws SQLException;

    List<DoctorDetailDto> getTopDoctor() throws SQLException;

//    List<DoctorSummaryRes> serviceDoctor() throws SQLException;

    List<DoctorDto> serviceDoctor(Integer offset, Integer limit) throws SQLException;

    Integer countDoctor() throws Exception;

    Doctors DetaiMyDoctor(String id) throws SQLException;
}
