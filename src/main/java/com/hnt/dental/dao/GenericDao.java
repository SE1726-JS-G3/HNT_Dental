package com.hnt.dental.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface GenericDao<T> {
    List<T> getAll() throws SQLException;

    Optional<T> get(int id) throws SQLException;

    void save(T t);

    void update(T t);

    void delete(T t);
}
