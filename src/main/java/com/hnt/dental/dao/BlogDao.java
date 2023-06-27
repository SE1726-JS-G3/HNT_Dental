package com.hnt.dental.dao;

import com.hnt.dental.entities.Blogs;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


public interface BlogDao extends GenericDao<Blogs> {


    Integer count(String search) throws Exception;

    void changeStatus(int id, String status) throws SQLException;

    ArrayList<Blogs> getAllCreatedBy() throws Exception;

    public ArrayList<String> listCategory() throws SQLException;

    public Optional<Blogs> filterCategoryBlog(int category_id) throws SQLException ;
}
