package com.hnt.dental.dao;

import java.util.List;
import java.util.Optional;

public interface GenericDao<T> {
    List<T> getAll();

    Optional<T> get(int id);

    void save(T t);

    void update(T t);

    void delete(T t);
}
