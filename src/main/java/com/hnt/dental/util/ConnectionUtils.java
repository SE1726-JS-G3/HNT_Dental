package com.hnt.dental.util;

import java.sql.*;

public class ConnectionUtils {
    private static final String URL = "jdbc:mysql://localhost:3306/hnt_dental";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "rootroot@3210";
    private static PreparedStatement preparedStatement;
    public static ResultSet rs;

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
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
        try {
            PreparedStatement statement = getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            for (int i = 0; i < args.length; i++) {
                statement.setObject(i + 1, args[i]);
            }

            long id;

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
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