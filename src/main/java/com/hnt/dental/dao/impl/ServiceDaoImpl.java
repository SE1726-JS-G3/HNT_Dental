package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.ServiceDao;
import com.hnt.dental.dto.response.ServiceResDto;
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

}
