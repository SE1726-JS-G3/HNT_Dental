package com.hnt.dental.dao;

import com.hnt.dental.entities.Employee;

import java.util.Optional;

public interface EmployeeDao extends GenericDao<Employee> {

    Integer count(String search) throws Exception;

    Optional<Employee> findByName(String name) throws Exception;
}
