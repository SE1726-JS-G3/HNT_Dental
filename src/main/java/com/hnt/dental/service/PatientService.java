package com.hnt.dental.service;

import com.hnt.dental.dao.PatientDao;
import com.hnt.dental.dao.impl.PatientDaoImpl;
import com.hnt.dental.dto.response.DoctorDetailDto;
import com.hnt.dental.dto.response.PatientResDto;
import com.hnt.dental.dto.response.ServiceResDto;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.entities.Patient;
import com.hnt.dental.util.PagingUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class PatientService {
    private static final PatientDao dao;


    static {
        dao = new PatientDaoImpl();
    }

}
