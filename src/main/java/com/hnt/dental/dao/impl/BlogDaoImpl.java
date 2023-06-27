package com.hnt.dental.dao.impl;

import com.hnt.dental.dao.BlogDao;
import com.hnt.dental.dao.CategoryBlogDao;
import com.hnt.dental.entities.Blogs;
import com.hnt.dental.entities.CategoryBlog;
import com.hnt.dental.entities.Employee;
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
            " b.update_at, b.created_by, b.active\n" +
            ",e.full_name,cb.name FROM blogs b inner join employees e \n" +
            "on e.id = b.created_by inner join category_blog cb on b.category_id = cb.id\n" +
            "where (1=1) and b.title like ?" +
            "LIMIT ?,?";

    private static final String GET_BLOG_BY_ID ="SELECT b.id, b.category_id, b.title, b.brief, b.description, b.create_at,\n" +
            " b.update_at, b.created_by, b.active\n" +
            ",e.full_name,cb.name FROM blogs b inner join employees e \n" +
            "on e.id = b.created_by inner join category_blog cb on b.category_id = cb.id\n" +
            "where (1=1) and b.id = ?\n" ;

    private static final String GET_BLOG_BY_CATEGORY ="SELECT b.id, b.category_id, b.title, b.brief, b.description, b.create_at,\n" +
            "             b.update_at, b.created_by, b.active\n" +
            "            ,e.full_name,cb.name FROM blogs b inner join employees e \n" +
            "            on e.id = b.created_by inner join category_blog cb on b.category_id = cb.id\n" +
            "            where (1=1) and b.category_id = ?";
    private static final String SAVE_BLOG = "INSERT INTO blogs " +
            "(id, category_id, title, brief, description, create_at, update_at, created_by, active) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String COUNT_BLOG = "SELECT COUNT(*) AS count FROM blogs";

    private static final String UPDATE_BLOG = "UPDATE blogs " +
            "SET category_id=?, title=?,brief=?, description=?, create_at=?, update_at=?, created_by=?, active = ? " +
            "WHERE id=?";
    private static final String CHANGE_ACTIVE = "UPDATE blogs\n" +
            "SET\n" +
            "`active` = ?\n" +
            "WHERE `id` = ?";
    private static final String DELETE_BLOG = "DELETE FROM blogs WHERE id=?";
    private static final String RECENT_POST = "SELECT * FROM blogs \n" +
            "order by update_at asc ";
    private static final String GET_ALL_CREATED_BY = "SELECT distinct e.full_name,b.created_by FROM hnt_dental.blogs b inner join employees e\n" +
            "on e.id = b.created_by";


    private static final String GET_CATEGORYBLOG = "SELECT distinct category_id FROM blogs";

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
            ConnectionUtils.executeUpdate(CHANGE_ACTIVE, 1,id);
        } else {
            ConnectionUtils.executeUpdate(CHANGE_ACTIVE, 0,id);
        }
    }

    @Override
    public ArrayList<Blogs> getAllCreatedBy() throws Exception {
        ArrayList<Blogs> blogs = new ArrayList<>();


        try {
            ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_CREATED_BY);
//            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
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


//    public static void main(String[] args) throws Exception {
//        BlogDaoImpl blogDaoImpl = new BlogDaoImpl();
//
//
////        List<Blogs> getall = blogDaoImpl.getAll(0, 3, "");
////        System.out.println("" + getall.get(0).getCreatedAt());
//
////        Optional<Blogs> gett = blogDaoImpl.get(10);
////        System.out.println(""+gett.get().getTitle());
//
//    }


    @Override
    public List<Blogs> getAll(Integer offset, Integer limit, String search) throws SQLException {
        List<Blogs> blogs = new ArrayList<>();
        search = StringUtils.isNotEmpty(search) ? "%" + search + "%" : "%";
        try {
            ResultSet rs = ConnectionUtils.executeQuery(GET_ALL_BLOG ,search , offset, limit);
//            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
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
                                .active(rs.getString("active"))

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
                        .active(rs.getString("active"))
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
        ConnectionUtils.executeUpdate(SAVE_BLOG,blog.getId(),blog.getCategoryBlog().getId(),blog.getTitle(),blog.getBrief(),
                blog.getDescription(),blog.getCreatedAt(),blog.getUpdatedAt(),blog.getEmployee().getId(),blog.getActive());
        return null;
    }

    @Override
    public void update(Blogs blog) throws SQLException {
        ConnectionUtils.executeUpdate(UPDATE_BLOG, blog.getCategoryBlog().getId(), blog.getTitle(),blog.getBrief(), blog.getDescription(),
                blog.getCreatedAt(), blog.getUpdatedAt(), blog.getCreatedBy(), blog.getActive(),blog.getId()
        );
    }




    @Override
    public void delete(Blogs blog) throws SQLException {
        categoryBlogDao.delete(CategoryBlog.builder().id(blog.getId()).build());
        ConnectionUtils.executeUpdate(DELETE_BLOG, blog.getId());
    }


    public ArrayList<String> listCategory() throws SQLException{

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

    @Override
    public Optional<Blogs> filterCategoryBlog(int category_id) throws SQLException {
        try {
            ResultSet rs = ConnectionUtils.executeQuery(GET_BLOG_BY_ID, category_id);
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
                        .active(rs.getString("active"))
                        .build());
            }
            ConnectionUtils.closeConnection();
        } catch (Exception e) {
            System.out.println("filterCategoryBlog:" + e);
        }
        return Optional.empty();
    }

//    public ArrayList<Blogs> paggingV2( String position, int active) {
//        String sql = "SELECT * FROM blogs where(1=1) \n";
//        Integer count = 0;
//        HashMap<Integer, Object> params = new HashMap<>();
//
//        if (!position.equals("-1")) {
//            count++;
//            sql += "and category_id = ? \n ";
//            params.put(count,  position );
//        }
//        if (active != -1) {
//            count++;
//            sql += "and active = ? \n ";
//            params.put(count, active);
//        }
//        ArrayList<Blogs> list = new ArrayList<>();
//
//        try {
//            ResultSet rs = ConnectionUtils.executeQuery(sql);
//            while (rs.next()) {
//                String id = String.valueOf(rs.getInt(1));
//                String full_name1 = rs.getString(2);
//                String dob = String.valueOf(rs.getDate(3));
//                String gender1 = String.valueOf(rs.getInt(4));
//                String phone = String.valueOf(rs.getInt(5));
//                String address = rs.getString(6);
//                String position1 = rs.getString(7);
//                String fee = String.valueOf(rs.getDouble(8));
//                String description = rs.getString(9);
//                String rank_id = String.valueOf(rs.getInt(10));
//                String created_at = String.valueOf(rs.getDate(11));
//                String update_at = String.valueOf(rs.getDate(12));
//                String created_by = String.valueOf(rs.getInt(13));
//                list.add(new Doctor(id, full_name1, dob, gender1, phone, address, position1, fee, description, rank_id, created_at, update_at, created_by));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (ClassNotFoundException e) {
//            throw new RuntimeException(e);
//        }
//
//        return list;
//    }


}
