package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.AccountDao;
import com.hnt.dental.dao.EmployeeDao;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.util.ConnectionUtils;
import com.hnt.dental.util.DateUtils;
import org.apache.commons.lang3.StringUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class EmployeeDaoImpl implements EmployeeDao {

    private static AccountDao accountDao;

static {
        accountDao = new AccountDaoImpl();
    }

    private static final String GET_ALL_EMPLOYEE = "SELECT e.id, e.full_name, e.dob, e.gender, a.email, e.status " +
            "FROM employees e " +
            "INNER JOIN accounts a ON e.id = a.id " +
            "WHERE LOWER(e.full_name) LIKE ? " +
            "OR LOWER(a.email) LIKE ? " +
            "OR LOWER(e.dob) LIKE ? " +
            "LIMIT ?, ?";

    private static final String SAVE_EMPLOYEE = "INSERT INTO employees" +
            "(id, full_name, dob, gender, phone, address, salary, status, created_at, updated_at, created_by) " +
            "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
    private static final String COUNT_EMPLOYEE = "SELECT COUNT(*) FROM employees e " +
            "INNER JOIN accounts a ON e.id = a.id " +
            "WHERE LOWER(e.full_name) LIKE ? " +
            "OR LOWER(a.email) LIKE ? " +
            "OR LOWER(e.dob) LIKE ? ";
    private static final String UPDATE_EMPLOYEE = "UPDATE employees " +
            "SET full_name=?, dob=?, gender=?, phone=?, address=?, salary=?, status=?, created_at=?, updated_at=?, " +
            " created_by=? " +
            "WHERE id=?";

    private static final String GET_EMPLOYEE_BY_ID = "SELECT * FROM hnt_dental.employees where id=?";

    private static final String DELETE_EMPLOYEE = "DELETE FROM employees WHERE id=?";

    @Override
    public List<Employee> getAll(Integer offset, Integer limit, String search) throws SQLException {
        List<Employee> employees = new ArrayList<>();
        search = StringUtils.isNotEmpty(search) ? "%" + search.toLowerCase() + "%" : "%";
        ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_EMPLOYEE, search, search, search, offset, limit);
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
        ConnectionUtils.closeConnection();
        return employees;
    }

    @Override
    public Optional<Employee> get(int id) throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(GET_EMPLOYEE_BY_ID, id);
        assert rs != null;
        if (rs.next()) {
            return Optional.ofNullable(Employee.builder()
                    .fullName(rs.getString("full_name"))
                    .account(
                            Account.builder()
                                    .email("email")
                                    .build())
                    .phone(rs.getString("phone"))
                    .address(rs.getString("address"))
                    .dob(DateUtils.convertDateToLocalDate(rs.getDate("dob")))
                    .gender(rs.getBoolean("gender"))
                    .salary(rs.getDouble("salary"))
                    .description(rs.getString("description"))
                    .build());
        }
        ConnectionUtils.closeConnection();
        return Optional.empty();
    }

    @Override
    public Long save(Employee employee) throws SQLException, ClassNotFoundException {
        ConnectionUtils.executeUpdate(SAVE_EMPLOYEE, employee.getAccount().getId(), employee.getFullName(),
                employee.getDob(), employee.getGender(), employee.getPhone(), employee.getAddress(),
                employee.getSalary(), employee.isStatus(), employee.getCreatedAt(), employee.getUpdatedAt(),
                employee.getCreatedBy());
        return null;
    }

    @Override
    public void update(Employee employee) throws SQLException {
        ConnectionUtils.executeUpdate(UPDATE_EMPLOYEE, employee.getFullName(),
                employee.getDob(), employee.getGender(), employee.getPhone(), employee.getAddress(),
                employee.getSalary(), employee.isStatus(), employee.getCreatedAt(), employee.getUpdatedAt(),
                employee.getCreatedBy(), employee.getAccount().getId());
    }

    @Override
    public void delete(Employee employee) throws SQLException {
        accountDao.delete(Account.builder().id(employee.getId()).build());
        ConnectionUtils.executeUpdate(DELETE_EMPLOYEE, employee.getId());
    }

    @Override
    public Integer count(String search) throws Exception {
        search = StringUtils.isNotEmpty(search) ? "%" + search.toLowerCase() + "%" : "%";
        ResultSet rs = ConnectionUtils.executeQuery(COUNT_EMPLOYEE, search, search, search);
        assert rs != null;
        if (rs.next()) {
            return rs.getInt(1);
        }
        ConnectionUtils.closeConnection();
        return null;
    }
}
