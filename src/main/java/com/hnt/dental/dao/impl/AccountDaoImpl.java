package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.AccountDao;
import com.hnt.dental.entities.Account;
import com.hnt.dental.util.ConnectionUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class AccountDaoImpl extends ConnectionUtils implements AccountDao {

    private static final String FIND_BY_EMAIL_SQL = "SELECT * FROM accounts WHERE email = ?";
    private static final String GET_ALL_ACCOUNT = "SELECT * FROM accounts";
    private static final String GET_ACCOUNT_BY_ID = "SELECT * FROM accounts where id = ?";
    private static final String SAVE_ACCOUNT = "INSERT INTO accounts" +
            "(email, password, `role`, is_verified, image, create_at, update_at)" +
            "VALUES(?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_ACCOUNT = "UPDATE accounts" +
            "SET id= ?, password= ?, `role`=?, is_verified=?, image=?, create_at=?, update_at=?" +
            "WHERE email=?";
    private static final String DELETE_ACCOUNT = "DELETE FROM accounts" +
            "WHERE id=?;";

    @Override
    public Account findByEmail(String email) throws SQLException {
        rs = executeQuery(FIND_BY_EMAIL_SQL, email);
        assert rs != null;
        if (rs.next()) {
            return Account.builder()
                    .id(rs.getLong("id"))
                    .email(rs.getString("email"))
                    .password(rs.getString("password"))
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
        while (true) {
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
        rs = executeQuery(GET_ACCOUNT_BY_ID, id);
        assert rs != null;
        if (rs.next()) {
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
    public Long save(Account account) throws SQLException {
        return executeUpdateForIdentity(SAVE_ACCOUNT, account.getEmail(), account.getPassword(), account.getRole(),
                account.getIsVerified(), account.getImage(), account.getCreatedAt(), account.getUpdatedAt());
    }

    @Override
    public void update(Account account) {
        executeUpdate(UPDATE_ACCOUNT, account.getEmail(), account.getPassword(), account.getRole(),
                account.getIsVerified(), account.getImage(), account.getCreatedAt(), account.getUpdatedAt(), account.getId());
    }

    @Override
    public void delete(Account account) {
        executeUpdate(DELETE_ACCOUNT,account.getId());

    }

    public static void main(String[] args) {
         AccountDaoImpl account = new AccountDaoImpl();
        account.delete(Account.builder().id(1L).build());
    }
}
