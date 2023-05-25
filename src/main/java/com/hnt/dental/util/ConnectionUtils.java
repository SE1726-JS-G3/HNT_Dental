package com.hnt.dental.util;

import org.apache.commons.lang3.StringUtils;

import java.sql.*;
import java.util.ResourceBundle;

public class ConnectionUtils {

    private ConnectionUtils() {
    }

    private static PreparedStatement preparedStatement;

    private static final ResourceBundle bundle = ResourceBundle.getBundle("application");

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        String url = StringUtils.join("jdbc:mysql://", bundle.getString("db.host"), ":",
                bundle.getString("db.port"), "/", bundle.getString("db.name"),
                "?useUnicode=true&characterEncoding=utf-8&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC");
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, bundle.getString("db.username"), bundle.getString("db.password"));
    }

    private static PreparedStatement getStatement(String sql, Object... args) {
        try {
            preparedStatement = getConnection().prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]);
            }
            return preparedStatement;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static ResultSet executeQuery(String sql, Object... args) {
        try {
            preparedStatement = getStatement(sql, args);
            assert preparedStatement != null;
            return preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean executeUpdate(String sql, Object... args) {
        try {
            preparedStatement = getStatement(sql, args);
            assert preparedStatement != null;
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Long executeUpdateForIdentity(String sql, Object... args) {
        try (Connection connection = getConnection()){
            preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]);
            }

            long id;

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    id = generatedKeys.getLong(1);
                } else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
            return id;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
}