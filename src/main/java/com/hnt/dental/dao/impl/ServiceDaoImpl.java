package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.ServiceDao;
import com.hnt.dental.dto.response.*;
import com.hnt.dental.entities.Service;
import com.hnt.dental.util.ConnectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ServiceDaoImpl implements ServiceDao {
    private static final String GET_ALL_SERVICE = "SELECT " +
            "s.id, " +
            "s.name, " +
            "GROUP_CONCAT(st.name SEPARATOR ',') as type, " +
            "CONCAT(MIN(sf.fee), ' ~ ', MAX(sf.fee)) as fee, " +
            "s.image " +
            "FROM  service s  " +
            "INNER JOIN service_fee sf on s.id = sf.service_id  " +
            "INNER JOIN service_type st on sf.service_type = st.id  " +
            "where ( s.name like ? or st.name  like ? ) " +
            "GROUP BY s.id " +
            "LIMIT ? OFFSET ? ";

    private static final String SQL_COUNT_SERVICE = "SELECT count(*) FROM service s " +
            "INNER JOIN service_fee sf on s.id = sf.service_id  " +
            "INNER JOIN service_type st on sf.service_type = st.id  " +
            "where ( s.name like ? or st.name  like ? ) order by s.id ";


    private static final String SQL_GET_SERVICE_DETAIL_BY_SERVICE_ID = "SELECT s.id, s.name, sf.fee, st.name as type, s.image, s.description  FROM service s " +
            "inner join service_fee sf on sf.service_id = s.id " +
            "inner join service_type st on sf.service_type = st.id " +
            "where  s.id = ? and st.id = ?";

    private static final String SQL_GET_TYPE_BY_SERVICE_ID = "SELECT st.id, st.name FROM service_type st " +
            "inner join service_fee sf on sf.service_type = st.id " +
            "inner join service s on s.id = sf.service_id " +
            "where s.id = ? ";

    private static final String SQL_GET_DOCTOR_BY_ID_SERVICE_AND_ID_TYPE = "SELECT d.id, d.full_name, d.image, st.name as type , dr.name as rankName from doctors d " +
            "            inner join service_doctor sd on sd.id_doctor = d.id " +
            "            inner join doctor_rank dr on d.rank_id = dr.id " +
            "            inner join service s on sd.id_service = s.id " +
            "            inner join service_fee sf on sf.service_id = s.id " +
            "            inner join service_type st on st.id = sf.service_type " +
            "            where s.id = ? and st.id = ?";

    @Override
    public List<Service> getAll(Integer offset, Integer limit, String search) throws SQLException {
        return null;
    }

    @Override
    public Optional<Service> get(int id) throws SQLException {
        return Optional.empty();
    }

    @Override
    public Long save(Service service) throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public void update(Service service) throws SQLException {

    }

    @Override
    public void delete(Service service) throws SQLException {

    }

    @Override
    public List<ServiceResDto> getAllServiceDao(Integer offset, Integer limit, String search) throws Exception {
        search = StringUtils.isNotEmpty(search) ? "%" + search.toLowerCase() + "%" : "%";
        ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_SERVICE, search, search, limit, offset);
        List<ServiceResDto> result = new ArrayList<>();
        while (rs.next()) {
            result.add(
                    ServiceResDto.builder()
                            .id(rs.getLong("id"))
                            .name(rs.getString("name"))
                            .image(rs.getString("image"))
                            .fee(rs.getString("fee"))
                            .type(rs.getString("type"))
                            .build());
        }
        ConnectionUtils.closeConnection();
        return result;
    }

    @Override
    public Integer countListService(String search) throws SQLException {
        search = "%" + search + "%";
        ResultSet rs = ConnectionUtils.executeQuery(SQL_COUNT_SERVICE, search, search);
        if (rs.next()) {
            return rs.getInt(1);
        }
        ConnectionUtils.closeConnection();
        return null;
    }

    @Override
    public ServiceDetailDto getServiceDetailByServiceId(Long id, Long typeId) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_SERVICE_DETAIL_BY_SERVICE_ID, id, typeId);
        if (rs.next()) {
            return ServiceDetailDto.builder()
                    .id(rs.getLong("id"))
                    .name(rs.getString("name"))
                    .image(rs.getString("image"))
                    .fee(rs.getString("fee"))
                    .type(rs.getString("type"))
                    .description(rs.getString("description"))
                    .build();
        }
        return null;
    }

    @Override
    public List<ServiceTypeDto> getTypeByServiceId(Long id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_TYPE_BY_SERVICE_ID, id);
        List<ServiceTypeDto> result = new ArrayList<>();
        while (rs.next()) {
            result.add(
                    ServiceTypeDto.builder()
                            .idType(rs.getLong("id"))
                            .nameType(rs.getString("name"))
                            .build());
        }
        return result;
    }

    @Override
    public List<DoctorByServiceIdDto> getDoctorByServiceIdAndServiceType(Long id, Long idType) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_DOCTOR_BY_ID_SERVICE_AND_ID_TYPE, id, idType);
        List<DoctorByServiceIdDto> result = new ArrayList<>();
        while (rs.next()) {
            result.add(
                    DoctorByServiceIdDto.builder()
                            .id(rs.getLong("id"))
                            .fullName(rs.getString("full_name"))
                            .image(rs.getString("image"))
                            .rankName(rs.getString("rankName"))
                            .type(rs.getString("type"))
                            .build());
        }
        return result;
    }

    public static void main(String[] args) {
        try {
            ServiceDaoImpl serviceDao = new ServiceDaoImpl();
            List<DoctorByServiceIdDto> allServiceDao = serviceDao.getDoctorByServiceIdAndServiceType(5L, 1L);
            System.out.println(allServiceDao.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
