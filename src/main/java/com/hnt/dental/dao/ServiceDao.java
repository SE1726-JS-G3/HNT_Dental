package com.hnt.dental.dao;

import com.hnt.dental.dto.response.*;
import com.hnt.dental.entities.Service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface ServiceDao extends GenericDao<Service>{
    List<ServiceResDto> getAllServiceDao(Integer offset, Integer limit, String search) throws Exception;
    Integer countListService(String search) throws SQLException;

    ServiceDetailDto getServiceDetailByServiceId(Long id, Long typeId) throws SQLException;

    List<ServiceTypeDto> getTypeByServiceId(Long id) throws SQLException;

    List<DoctorByServiceIdDto> getDoctorByServiceIdAndServiceType(Long id, Long idType) throws SQLException;
}