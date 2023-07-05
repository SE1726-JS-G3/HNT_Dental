package com.hnt.dental.dao;

import com.hnt.dental.dto.response.BlogResDto;
import com.hnt.dental.entities.Blogs;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


public interface BlogDao extends GenericDao<Blogs> {


    Integer count(String search) throws Exception;

    void changeStatus(int id, String status) throws SQLException;

    ArrayList<Blogs> getAllCreatedBy() throws Exception;

    List<Blogs> getAllBlog(int offset, int limit, String search, String status, String category) throws SQLException;

    Integer countListBlogSummary(String search,String status, String category) throws SQLException;

    List<BlogResDto> getCategoryByCategoryId() throws SQLException;



}
