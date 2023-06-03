package com.hnt.dental.dao;

import com.hnt.dental.entities.Employee;

public interface EmployeeDao extends GenericDao<Employee> {

    Integer count(String search) throws Exception;
}
