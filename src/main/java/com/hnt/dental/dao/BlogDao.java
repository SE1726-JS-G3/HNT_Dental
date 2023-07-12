package com.hnt.dental.dao;

import com.hnt.dental.dto.response.BlogsSummaryRes;
import com.hnt.dental.entities.Blogs;
import com.hnt.dental.entities.CategoryBlog;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface BlogDao extends GenericDao<Blogs> {

    List<BlogsSummaryRes> getListBlogsFilter(Integer offset, Integer limit, String search, String oder, Integer categoryId ) throws SQLException;

    Integer countListBlogs(String search) throws SQLException;

    List<CategoryBlog> getListCategoryBlog() throws SQLException;
    Blogs getBlogID(int id) throws Exception;

    List<BlogsSummaryRes> getListBlogRelated(long id, long categoryId ) throws SQLException;

    List<Blogs> RecentPosts() throws Exception;

}
