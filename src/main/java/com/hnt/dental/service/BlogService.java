package com.hnt.dental.service;


import com.hnt.dental.constant.RoleEnum;
import com.hnt.dental.dao.AccountDao;
import com.hnt.dental.dao.BlogDao;
import com.hnt.dental.dao.CategoryBlogDao;
import com.hnt.dental.dao.EmployeeDao;
import com.hnt.dental.dao.impl.AccountDaoImpl;
import com.hnt.dental.dao.impl.BlogDaoImpl;
import com.hnt.dental.dao.impl.CategoryBlogDaoImpl;
import com.hnt.dental.dao.impl.EmployeeDaoImpl;
import com.hnt.dental.dto.response.BlogResDto;
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Blogs;
import com.hnt.dental.entities.CategoryBlog;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.exception.SystemRuntimeException;
import com.hnt.dental.util.AesUtils;
import com.hnt.dental.util.CaptchaUtils;
import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class BlogService {
    private static final BlogDao blogDao;
    private static final CategoryBlogDao categoryBlogDao;
    private static final EmployeeDao employeeDao;

    static {
        blogDao = new BlogDaoImpl();
        categoryBlogDao = new CategoryBlogDaoImpl();
        employeeDao = new EmployeeDaoImpl();

    }


    public void getAll(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String page = req.getParameter("page");
        String search = req.getParameter("txt");

        String raw_category = req.getParameter("cate");
        String raw_status = req.getParameter("status");
        String raw_created_by = req.getParameter("created_by");

        int created_by = (raw_created_by != null && !raw_created_by.equals("-1")) ? Integer.parseInt(raw_created_by) : -1 ;
        int category = (raw_category != null && !raw_category.equals("-1")) ? Integer.parseInt(raw_category) : -1 ;
        int active = (raw_status != null && !raw_status.equals("-1")) ? Integer.parseInt(raw_status) : -1 ;
        ArrayList<CategoryBlog> categoryBlog = (ArrayList<CategoryBlog>) categoryBlogDao.getAll();
        ArrayList<Blogs> createdByList = blogDao.getAllCreatedBy();
//        Optional<Blogs> filterCategoryBlog(int category_id)


        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }

        if (StringUtils.isEmpty(search)) {
            search = "";
        }
        Integer totalItem = blogDao.count(renderSearch(search.trim()));
        Integer totalPage = PagingUtils.getTotalPage(totalItem);
        //
        //check change status
        String status_id = req.getParameter("change_status");
        if (status_id != null) {
            String[] arr = status_id.split("_");
            String id = arr[0];
            String raw_active = arr[1];
            blogDao.changeStatus(Integer.parseInt(id), raw_active);
        }

        List<Blogs> blogs = blogDao.getAll(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE, renderSearch(search.trim()));

        req.setAttribute("blogs", BlogResDto.convert(blogs));
        req.setAttribute("category", categoryBlog);
        req.setAttribute("createdByList", createdByList);
        req.setAttribute("active", active);
        req.setAttribute("created_by_elm", created_by);
        req.setAttribute("cate_elm", category);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("currentPage", pageNumber);
        req.setAttribute("search", search);
        req.setAttribute("url", "/management/blog");
//        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/blogs/index.jsp");
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/blogs/index.jsp");
//        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/employee/index.jsp");

    }

    public void create(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Long id = Long.valueOf(req.getParameter("blog_id"));
        String name = req.getParameter("name");
        String title = req.getParameter("title");
        String brief = req.getParameter("brief");
        String description = req.getParameter("description");
        String create_at = req.getParameter("create_at");
        String update_at = req.getParameter("update_at");
        String created_by = req.getParameter("created_by");
        String active = "1";
        String error = null;

        try {
            Optional<Employee> employee = employeeDao.findByName(created_by);
            CategoryBlog categoryBlog = categoryBlogDao.findByName(name);
            categoryBlog.setName(name);
            categoryBlog.setUpdatedAt(LocalDateTime.now());
            categoryBlog.setCreatedAt(LocalDateTime.parse(create_at));
            categoryBlogDao.save(categoryBlog);

            blogDao.save(
                    Blogs.builder()
                            .categoryBlog(CategoryBlog.builder().id(categoryBlog.getId()).build())
                            .id(id)
                            .active(active)
                            .title(title)
                            .brief(brief)
                            .description(description)
                            .createdAt(LocalDateTime.parse(create_at))
                            .updatedAt(LocalDateTime.now())
                            .createdBy(employee.get().getId())

                            .build()

            );
        } catch (Exception e) {
            error = e.getMessage();
        }

        ServletUtils.redirect(req, resp, "/management/blog");
    }

    public void update(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Long id = Long.valueOf(req.getParameter("id"));
        String title = req.getParameter("title");
        String brief = req.getParameter("brief");
        String description = req.getParameter("description");
        String name = req.getParameter("name");
        String create_at = req.getParameter("create_at");
        String update_at = req.getParameter("update_at");
        String created_by = req.getParameter("created_by");
        String active = "1";
        String error = null;
        try {
            Optional<Employee> employee = employeeDao.findByName(created_by);
            CategoryBlog categoryBlog = categoryBlogDao.findByName(name);

           /* if (categoryBlog != null && !Objects.equals(categoryBlog.getId(), id)) {
                throw new SystemRuntimeException(StringUtils.join("Name ", name, " already exists"));
            }*/

            // categoryBlog = categoryBlogDao.get(id.intValue()).isPresent() ? categoryBlogDao.get(id.intValue()).get() : null;
            categoryBlog.setName(name);
            categoryBlog.setUpdatedAt(LocalDateTime.now());
            categoryBlog.setCreatedAt(LocalDateTime.parse(create_at));
            categoryBlogDao.update(categoryBlog);

            blogDao.update(
                    Blogs.builder()
                            .categoryBlog(CategoryBlog.builder().id(id).build())
                            .active(active)
                            .title(title)
                            .brief(brief)
                            .description(description)
                            .createdAt(LocalDateTime.parse(create_at))
                            .updatedAt(LocalDateTime.now())
                            .createdBy(employee.get().getId())
                            .build()
            );
        } catch (Exception e) {
            error = e.getMessage();
        }

            if (StringUtils.isNotEmpty(error)) {
                ServletUtils.redirect(req, resp, "/management/blog/update?id=" + id + "&error=" + error);
            } else {
                ServletUtils.redirect(req, resp, "/management/blog/update?id=" + id);
            }
    }


    public void updateRender(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));
        String error = req.getParameter("error");
        Blogs blogs = blogDao.get(id).isPresent() ? blogDao.get(Integer.parseInt(req.getParameter("id"))).get() : null;

        CategoryBlog categoryBlog = categoryBlogDao.get(id).isPresent() ? categoryBlogDao.get(id).get() : null;

        ArrayList<CategoryBlog> categoryBlog1 = (ArrayList<CategoryBlog>) categoryBlogDao.getAll();
        assert blogs != null;
        blogs.setCategoryBlog(categoryBlog);
        req.setAttribute("blogs", blogs);
        req.setAttribute("category", categoryBlog1);
        req.setAttribute("blog_id", id);
        req.setAttribute("error", error);
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/blogs/detail.jsp");
    }

    private String renderSearch(String search) {
        if (search.matches("\\d{2}/\\d{2}/\\d{4}")) {
            String[] date = search.split("/");
            return StringUtils.join(date[2], "-", date[1], "-", date[0]);
        }
        return search;
    }

    public void Active(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
//        blogDao.Active(Blogs.builder().id());
    }
    public void delete(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        blogDao.delete(Blogs.builder().id((long) id).build());
        ServletUtils.redirect(req, resp, "/management/blog");
    }




}


