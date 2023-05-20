package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.AccountDao;
import com.hnt.dental.entities.Account;
import com.hnt.dental.util.ConnectionUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class AccountDaoImpl extends ConnectionUtils  implements AccountDao {

    private static final String LOGIN_SQL = "SELECT * FROM Accounts WHERE email = ? AND password = ?";
    private static final String GET_ALL_ACCOUNT = "SELECT * FROM Accounts";
    private static final String GET_ACCOUNT_BY_ID = "SELECT * FROM accounts where id = ?";
    @Override
    public Account login(String email, String password) throws SQLException {
        rs = executeQuery(LOGIN_SQL, email, password);
        assert rs != null;
        if (rs.next()){
            return Account.builder()
                    .id(rs.getLong("id"))
                    .email(rs.getString("email"))
                    .role(rs.getInt("role"))
                    .isVerified(rs.getBoolean("is_verified"))
                    .build();
        }
        return null;
    }

    @Override
    public List<Account> getAll() throws SQLException {
        rs = executeQuery(GET_ALL_ACCOUNT);
        List<Account> list = new ArrayList<>();
        while(true){
            assert rs != null;
            if (!rs.next()) break;
            list.add(Account.builder()
                    .id(rs.getLong("id"))
                    .email(rs.getString("email"))
                    .role(rs.getInt("role"))
                    .isVerified(rs.getBoolean("is_verified"))
                    .build());
        }
        return list;
    }

    @Override
    public Optional<Account> get(int id) throws SQLException {
        rs = executeQuery(GET_ACCOUNT_BY_ID,id);
        assert rs != null;
        if(rs.next()){
            return Optional.ofNullable(Account.builder()
                    .id(rs.getLong("id"))
                    .email(rs.getString("email"))
                    .role(rs.getInt("role"))
                    .isVerified(rs.getBoolean("is_verified"))
                    .build());

        }
        return Optional.empty();
    }

    @Override
    public void save(Account account) {

    }

    @Override
    public void update(Account account) {

    }

    @Override
    public void delete(Account account) {

    }
}
