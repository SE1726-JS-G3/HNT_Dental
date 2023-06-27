package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.BlogDao;
import com.hnt.dental.dao.DoctorDao;
import com.hnt.dental.dto.response.BlogsSummaryRes;
import com.hnt.dental.dto.response.DoctorDetailDto;
import com.hnt.dental.dto.response.DoctorSummaryRes;
import com.hnt.dental.dto.response.ServiceResDto;
import com.hnt.dental.entities.Blogs;
import com.hnt.dental.entities.CategoryBlog;
import com.hnt.dental.entities.Doctors;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.util.ConnectionUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class BlogsDaoImpl implements BlogDao {
    private static final String SQL_GET_ALL_BLOGS_BY_CATEGORY = "SELECT id, category_id, title, title_img, brief, " +
            "description, create_at, update_at, created_by " +
            "FROM blogs where " +
            "category_id = ?";
//private static final String SQL_GET_BLOGS_BY_ID="select * from blogs where id = ?";


    private static final String SQL_GET_BLOGS_BY_ID="select b.id, b.category_id, b.title,b.title_img, b.brief, b.description, b.create_at, b.update_at, b.created_by,c.name, e.full_name from blogs b inner join category_blog c \n" +
            "on b.category_id = c.id inner join employees e on b.created_by = e.id\n" +
            "where b.id = ?";
    private static final String SQL_GET_ALL_BLOGS = "SELECT b.id as id, b.category_id as category_id , b.title as title, " +
            " b.title_img as title_img, b.brief as brief, b.description as description, c.name as category_name " +
            "FROM blogs b inner join category_blog c on b.category_id = c.id ";

    private static final String SQL_GET_ALL_FILTER = "SELECT b.id as id, b.category_id as category_id , " +
            "b.title as title, b.title_img as title_img, b.brief as brief," +
            " b.description as description, c.name as category_name " +
            "FROM blogs b inner join category_blog c on b.category_id = c.id " +
            "where ( title like ? or brief like ? or description like ?) ORDER BY ? LIMIT ? OFFSET ?";

    private static final String SQL_GET_ALL_FILTER_CATEGORY = "SELECT b.id as id, b.category_id as category_id , " +
            "b.title as title, b.title_img as title_img, b.brief as brief," +
            " b.description as description, c.name as category_name " +
            "FROM blogs b inner join category_blog c on b.category_id = c.id " +
            "where ( title like ? or brief like ? or description like ?) and b.category_id = ? ORDER BY ? LIMIT ? OFFSET ?";

    private static final String SQL_GET_ALL_BLOGS_REALEATED = "SELECT b.id as id, b.category_id as category_id , " +
            "b.title as title, b.title_img as title_img, b.brief as brief," +
            " b.description as description " +
            "FROM blogs b " +
            "where id != ? and category_id = ? " +
            "ORDER BY create_at DESC " +
            "LIMIT 5";

    private static final String SQL_COUNT_BLOGS = "SELECT COUNT(*) " +
            "FROM blogs b inner join category_blog c on b.category_id = c.id " +
            "where ( title like ? or brief like ? or description like ?) ";

    private static final String SQL_LIST_CATEGORY = "select id, name from category_blog";

    @Override
    public List<BlogsSummaryRes> getListBlogsFilter(Integer offset, Integer limit, String search, String oder, Integer categoryId) throws SQLException {
        search = "%" + search + "%";
        ResultSet rs;
        if(categoryId != null) {
            rs = ConnectionUtils.executeQuery(SQL_GET_ALL_FILTER_CATEGORY, search,search,search,categoryId, oder,limit,offset);
        } else {
            rs = ConnectionUtils.executeQuery(SQL_GET_ALL_FILTER, search,search,search,oder,limit,offset);    
        }
        
        List<BlogsSummaryRes> result = new ArrayList<>();
        while (rs.next()) {
            result.add(BlogsSummaryRes.builder()
                    .id(rs.getLong("id"))
                    .categoryBlog(new CategoryBlog(rs.getLong("category_id"), rs.getString("category_name")))
                    .title(rs.getString("title"))
                    .title_img(rs.getString("title_img"))
                    .brief(rs.getString("brief"))
                    .description(rs.getString("description"))
                    .build());
        }
        return result;
    }

    @Override
    public List<Blogs> getAll(Integer offset, Integer limit, String search) throws SQLException {
        return null;
    }

    @Override
    public Optional<Blogs> get(int id) throws SQLException {
        return Optional.empty();
    }

    @Override
    public Long save(Blogs blogs) throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public void update(Blogs blogs) throws SQLException {

    }

    @Override
    public void delete(Blogs blogs) throws SQLException {

    }

    @Override
    public Integer countListBlogs(String search) throws SQLException {
        search = "%" + search + "%";
        ResultSet rs = ConnectionUtils.executeQuery(SQL_COUNT_BLOGS, search, search, search);
        if (rs.next()) {
            return rs.getInt(1);
        }
        ConnectionUtils.closeConnection();
        return null;
    }

    @Override
    public List<CategoryBlog> getListCategoryBlog() throws SQLException {
        ResultSet rs = ConnectionUtils.executeQuery(SQL_LIST_CATEGORY);
        List<CategoryBlog> result = new ArrayList<>();
        while (rs.next()) {
            result.add(new CategoryBlog(rs.getLong("id"), rs.getString("name")));
        }
        return result;
    }

    @Override
    public Blogs getBlogID(int id) throws Exception {
        Blogs blogs = new Blogs();
        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_BLOGS_BY_ID, id);
        while (rs.next()) {
            blogs = Blogs.builder()
                    .id((long) rs.getInt("id"))
                    .title(rs.getString("title"))
                    .title_img(rs.getString("title_img"))
                    .description(rs.getString("description"))
                    .brief(rs.getString("brief"))
                    .categoryBlog(
                            CategoryBlog.builder()
                                    .id(rs.getLong("category_id"))
                                    .name((rs.getString("name")))
                                    .build()
                    )
                    .employee(Employee.builder().fullName(rs.getString("full_name")).build())
                    .build();
            return blogs;
        }
        return blogs;
    }

    @Override
    public List<BlogsSummaryRes> getListBlogRelated(long id, long categoryId) throws SQLException {

        ResultSet rs = ConnectionUtils.executeQuery(SQL_GET_ALL_BLOGS_REALEATED, id ,categoryId);

        List<BlogsSummaryRes> result = new ArrayList<>();
        while (rs.next()) {
            result.add(BlogsSummaryRes.builder()
                    .id(rs.getLong("id"))
                    .title(rs.getString("title"))
                    .title_img(rs.getString("title_img"))
                    .brief(rs.getString("brief"))
                    .description(rs.getString("description"))
                    .build());
        }
        return result;
    }

    public static void main(String[] args) throws Exception {
        BlogsDaoImpl blogsDaoIpml = new BlogsDaoImpl();
        Blogs blogs = blogsDaoIpml.getBlogID(1);
        System.out.println(""+ blogs.getBrief());

        System.out.println(""+ blogs.getId());
        System.out.println(""+ blogs.getTitle());
        System.out.println(""+ blogs.getDescription());




    }
}
