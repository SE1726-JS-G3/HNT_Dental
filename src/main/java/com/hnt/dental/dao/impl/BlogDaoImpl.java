package com.hnt.dental.dao.impl;

import com.hnt.dental.constant.BlogStatusEnum;
import com.hnt.dental.dao.BlogDao;
import com.hnt.dental.dao.CategoryBlogDao;
import com.hnt.dental.dto.response.BlogResDto;
import com.hnt.dental.entities.Blogs;
import com.hnt.dental.entities.CategoryBlog;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.entities.Service;
import com.hnt.dental.util.ConnectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BlogDaoImpl implements BlogDao {

    private static CategoryBlogDao categoryBlogDao;

    static {
        categoryBlogDao = new CategoryBlogDaoImpl();
    }

    private static final String GET_ALL_BLOG = "SELECT b.id, b.category_id, b.title, b.brief, b.description, b.create_at,\n" +
            " b.update_at, b.created_by, b.status\n" +
            ",e.full_name,cb.name FROM blogs b inner join employees e \n" +
            "on e.id = b.created_by inner join category_blog cb on b.category_id = cb.id\n" +
            "where (1=1) and b.title like ?" +
            "LIMIT ?,?";

    private static final String SQL_COUNT_BLOG = "SELECT count(*) FROM blogs b \n" +
            "                                   inner join category_blog cb on b.category_id = cb.id \n" +
            "                                  where LOWER(b.title) like ?  AND b.status LIKE ? \n" +
            "                     AND b.category_id LIKE ?" +
            " order by b.id";

    private static final String SQL_GET_CATEGORY_BY_CATEGORY_ID = "select DISTINCT cb.name, cb.id from blogs b \n" +
            "            inner join category_blog cb on b.category_id = cb.id;";

    private static final String GET_BLOG_BY_ID = "SELECT b.id, b.category_id, b.title, b.brief, b.description, b.create_at,\n" +
            " b.update_at, b.created_by, b.status\n" +
            ",e.full_name,cb.name FROM blogs b inner join employees e \n" +
            "on e.id = b.created_by inner join category_blog cb on b.category_id = cb.id\n" +
            "where (1=1) and b.id = ?\n";

    private static final String SAVE_BLOG = "INSERT INTO blogs " +
            "(id, category_id, title, brief, description, create_at, status) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?)";

    private static final String COUNT_BLOG = "SELECT COUNT(*) AS count FROM blogs";

    private static final String UPDATE_BLOG = "UPDATE blogs " +
            "SET category_id=?, title=?,brief=?, description=?, create_at=?, update_at=?, created_by=?, status = ? " +
            "WHERE id=?";
    private static final String CHANGE_status = "UPDATE blogs\n" +
            "SET\n" +
            "`status` = ?\n" +
            "WHERE `id` = ?";
    private static final String DELETE_BLOG = "DELETE FROM blogs WHERE id=?";
    private static final String GET_ALL_CREATED_BY = "SELECT distinct e.full_name,b.created_by FROM hnt_dental.blogs b inner join employees e\n" +
            "on e.id = b.created_by";


    private static final String GET_CATEGORYBLOG = "SELECT distinct category_id FROM blogs";

    private static final String GET_ALL_BLOGS = " SELECT b.id, b.category_id , b.title, b.brief, b.description, b.create_at, b.update_at, b.created_by, b.status, e.full_name, cb.name\n" +
            "            FROM blogs b\n" +
            "            INNER JOIN category_blog cb ON b.category_id = cb.id\n" +
            "            LEFT JOIN employees e ON b.created_by = e.id\n" +
            "            WHERE LOWER(b.title) LIKE ?\n" +
            "            AND b.status LIKE ? \n" +
            "            AND b.category_id LIKE ? \n" +
            "            LIMIT ?, ?";

    @Override
    public Integer count(String search) throws Exception {

        search = StringUtils.isNotEmpty(search) ? "%" + search.toLowerCase() + "%" : "%";
        ResultSet rs = ConnectionUtils.executeQuery(COUNT_BLOG);
        assert rs != null;
        if (rs.next()) {
            return rs.getInt("count");
        }
        ConnectionUtils.closeConnection();
        return null;
    }


    @Override
    public void changeStatus(int id, String status) throws SQLException {
        if (status.equals("0")) {
            ConnectionUtils.executeUpdate(CHANGE_status, 1, id);
        } else {
            ConnectionUtils.executeUpdate(CHANGE_status, 0, id);
        }
    }

    @Override
    public ArrayList<Blogs> getAllCreatedBy() throws Exception {
        ArrayList<Blogs> blogs = new ArrayList<>();


        try {
            ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_CREATED_BY);
            while (rs.next()) {
                blogs.add(
                        Blogs.builder()
                                .employee(Employee.builder().fullName(rs.getString("full_name"))
                                        .build())
                                .createdBy(rs.getLong("created_by"))
                                .build()
                );
            }
            ConnectionUtils.closeConnection();
        } catch (Exception e) {
            System.out.println("getAllCreatedBy:" + e);
        }

        return blogs;
    }

    @Override
    public List<Blogs> getAllBlog(int offset, int limit, String search, String status, String category) throws SQLException {
        List<Blogs> blogs = new ArrayList<>();
        search = StringUtils.isNotEmpty(search) ? "%" + search.toLowerCase() + "%" : "%";
        status = !status.equals("all") ? status : "%";
        category = !category.equals("all") ? category : "%";
        ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_BLOGS, search, status, category, offset, limit);
        while (rs.next()) {
            blogs.add(
                    Blogs.builder()
                            .employee(
                                    Employee.builder()
                                            .id(rs.getLong("id"))
                                            .fullName(rs.getString("full_name"))
                                            .build()
                            )
                            .categoryBlog(CategoryBlog.builder()
                                    .name(rs.getString("name"))
                                    .build())
                            .id(rs.getLong("id"))
                            .categoryID(rs.getInt("category_id"))
                            .title(rs.getString("title"))
                            .brief(rs.getString("brief"))
                            .description(rs.getString("description"))
                            .status(rs.getBoolean("status"))
                            .createdAt(rs.getTimestamp("create_at").toLocalDateTime())
                            .createdBy(rs.getLong("created_by"))
                            .build()
            );
        }
        ConnectionUtils.closeConnection();
        return blogs;
    }

    @Override
    public Integer countListBlogSummary(String search, String status, String category) throws SQLException {
        search = StringUtils.isNotEmpty(search) ? "%" + search.toLowerCase() + "%" : "%";
        status = !status.equals("all") ? status : "%";
        category = !category.equals("all") ? category : "%";
//        search = "%" + search + "%";
        ResultSet rs = ConnectionUtils.executeQuery(SQL_COUNT_BLOG, search, status, category);
        if (rs.next()) {
            return rs.getInt(1);
        }
        ConnectionUtils.closeConnection();
        return null;

    }


    @Override
    public List<Blogs> getAll(Integer offset, Integer limit, String search) throws SQLException {
        List<Blogs> blogs = new ArrayList<>();
        search = StringUtils.isNotEmpty(search) ? "%" + search + "%" : "%";
        try {
            ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_BLOG, search, offset, limit);
            while (rs.next()) {

                blogs.add(

                        Blogs.builder()
                                .categoryBlog(
                                        CategoryBlog.builder()
                                                .name(rs.getString("name"))
                                                .build()
                                )
                                .employee(Employee.builder().fullName(rs.getString("full_name"))
                                        .build())
                                .id(rs.getLong("id"))
                                .title(rs.getString("title"))
                                .brief(rs.getString("brief"))
                                .description(rs.getString("description"))
                                .createdAt(rs.getTimestamp("create_at").toLocalDateTime())
                                .status(rs.getBoolean("status"))
                                .build()
                );
            }
            ConnectionUtils.closeConnection();
        } catch (Exception e) {
            System.out.println("getAll:" + e);
        }


        return blogs;
    }


    @Override
    public Optional<Blogs> get(int id) throws SQLException {

        try {
            ResultSet rs = ConnectionUtils.executeQuery(GET_BLOG_BY_ID, id);
            assert rs != null;
            if (rs.next()) {
                return Optional.ofNullable(Blogs.builder()
                        .categoryBlog(
                                CategoryBlog.builder()
                                        .name(rs.getString("name"))
                                        .build()
                        )
                        .employee(Employee.builder().fullName(rs.getString("full_name"))
                                .build())
                        .createdAt(rs.getTimestamp("create_at").toLocalDateTime())
                        .createdBy(rs.getLong("created_by"))
                        .title(rs.getString("title"))
                        .brief(rs.getString("brief"))
                        .description(rs.getString("description"))
                        .status(rs.getBoolean("status"))
                        .build());
            }
            ConnectionUtils.closeConnection();
        } catch (Exception e) {
            System.out.println("get:" + e);
        }
        return Optional.empty();
    }


    @Override
    public Long save(Blogs blog) throws SQLException, ClassNotFoundException {
        ConnectionUtils.executeUpdate(SAVE_BLOG, blog.getId(), blog.getCategoryID(), blog.getTitle(), blog.getBrief(),
                blog.getDescription(), blog.getCreatedAt()
//                ,blog.getCreatedBy()
                , blog.getStatus());
        return null;

    }

    @Override
    public void update(Blogs blog) throws SQLException {
        ConnectionUtils.executeUpdate(UPDATE_BLOG, blog.getCategoryBlog().getId(), blog.getTitle(),
                blog.getBrief(), blog.getDescription(),
                blog.getCreatedAt(), blog.getUpdatedAt(), blog.getCreatedBy(), blog.getStatus(), blog.getId());
    }

    @Override
    public void delete(Blogs blog) throws SQLException {
        categoryBlogDao.delete(CategoryBlog.builder().id(blog.getId()).build());
        ConnectionUtils.executeUpdate(DELETE_BLOG, blog.getId());
    }


    public ArrayList<String> listCategory() throws SQLException {

        ArrayList<String> data = new ArrayList<>();
        try {
            ResultSet rs = ConnectionUtils.executeQuery(GET_CATEGORYBLOG);
            while (rs.next()) {
                String category = rs.getString("category");
                data.add(category);
            }

        } catch (Exception e) {
            System.out.println("getListCategory " + e);
        }
        return data;
    }


}
