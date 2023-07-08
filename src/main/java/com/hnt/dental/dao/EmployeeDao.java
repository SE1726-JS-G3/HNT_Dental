package com.hnt.dental.dao;

import com.hnt.dental.entities.Employee;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public interface EmployeeDao extends GenericDao<Employee> {

    Integer count(String search) throws Exception;

    List<Employee> getEmployeeAvailable(LocalDate date, LocalTime time, Long bookingId) throws Exception;
}
