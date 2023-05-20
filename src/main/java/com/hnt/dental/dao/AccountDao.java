package com.hnt.dental.dao;

import com.hnt.dental.entities.Account;

import java.sql.SQLException;

public interface AccountDao extends GenericDao<Account>{
    Account login(String email, String password) throws SQLException;
}
