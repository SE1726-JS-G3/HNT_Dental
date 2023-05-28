package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.EmployeeDao;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.util.ConnectionUtils;
import com.hnt.dental.util.DateUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class EmployeeDaoImpl implements EmployeeDao {

    private static final String GET_ALL_EMPLOYEE = "SELECT e.id, e.full_name, e.dob, e.gender, a.email, e.status " +
            "FROM employees e " +
            "INNER JOIN accounts a ON e.id = a.id " +
            "LIMIT ?, ?";

    private static final String SAVE_EMPLOYEE = "INSERT INTO hnt_dental.employees" +
            "(id, full_name, dob, gender, phone, address, salary, status, created_at, updated_at, created_by) " +
            "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
    private static final String COUNT_EMPLOYEE = "SELECT COUNT(*) FROM employees";

    @Override
    public List<Employee> getAll(Integer offset, Integer limit) throws SQLException {
        List<Employee> employees = new ArrayList<>();
        ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_EMPLOYEE, offset, limit);
        while (rs.next()) {
            employees.add(
                    Employee.builder()
                            .account(
                                    Account.builder()
                                            .id(rs.getLong("id"))
                                            .email(rs.getString("email"))
                                            .build()
                            )
                            .fullName(rs.getString("full_name"))
                            .dob(DateUtils.convertDateToLocalDate(rs.getDate("dob")))
                            .gender(rs.getBoolean("gender"))
                            .status(rs.getBoolean("status"))
                            .build()
            );
        }
        return employees;
    }

    @Override
    public Optional<Employee> get(int id) throws SQLException {

        return Optional.empty();
    }

    @Override
    public Long save(Employee employee) throws SQLException, ClassNotFoundException {
        ConnectionUtils.executeUpdate(SAVE_EMPLOYEE, employee.getAccount().getId(), employee.getFullName(), employee.getDob(), employee.getGender(), employee.getPhone(), employee.getAddress(),
                employee.getSalary(), employee.isStatus(), employee.getCreatedAt(), employee.getUpdatedAt(), employee.getCreatedBy());
        return null;
    }

    @Override
    public void update(Employee employee) {
    }

    @Override
    public void delete(Employee employee) {

    }

    @Override
    public Integer count() throws Exception {
        ResultSet rs = ConnectionUtils.executeQuery(COUNT_EMPLOYEE);
        assert rs != null;
        if (rs.next()) {
            return rs.getInt(1);
        }
        return null;
    }
}
