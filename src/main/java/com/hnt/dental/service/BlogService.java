package com.hnt.dental.service;


import com.hnt.dental.constant.BlogStatusEnum;
import com.hnt.dental.constant.RoleEnum;
import com.hnt.dental.dao.BlogDao;
import com.hnt.dental.dao.CategoryBlogDao;
import com.hnt.dental.dao.EmployeeDao;
import com.hnt.dental.dao.impl.BlogDaoImpl;
import com.hnt.dental.dao.impl.CategoryBlogDaoImpl;
import com.hnt.dental.dao.impl.EmployeeDaoImpl;
import com.hnt.dental.dto.response.BlogResDto;
import com.hnt.dental.entities.*;
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
        String search = req.getParameter("search");

        String raw_category = req.getParameter("cate");
        String raw_status = req.getParameter("status");
        String raw_created_by = req.getParameter("created_by");

        int created_by = (raw_created_by != null && !raw_created_by.equals("-1")) ? Integer.parseInt(raw_created_by) : -1;
        int category = (raw_category != null && !raw_category.equals("-1")) ? Integer.parseInt(raw_category) : -1;
        int status = (raw_status != null && !raw_status.equals("-1")) ? Integer.parseInt(raw_status) : -1;
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
            String raw_status1 = arr[1];
            blogDao.changeStatus(Integer.parseInt(id), raw_status1);
        }

        List<Blogs> blogs = blogDao.getAll(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE, renderSearch(search.trim()));

        req.setAttribute("blogs", BlogResDto.convert(blogs));
        req.setAttribute("category", categoryBlog);
        req.setAttribute("createdByList", createdByList);
        req.setAttribute("status", status);
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
        String title = req.getParameter("title");
        String brief = req.getParameter("brief");
        String description = req.getParameter("description");
        Long categoryId = Long.valueOf(req.getParameter("categoryId"));
        String name = req.getParameter("name");
//        String fullName = req.getParameter("fullName");
        String status = req.getParameter("status");
//        Long created_by = Long.valueOf(req.getParameter("created_by"));
        String error = null;

        try {
            Blogs blog = Blogs.builder()
                    .title(title)
                    .brief(brief)
                    .description(description)
                    .categoryID(categoryId)
                    .categoryBlog(CategoryBlog.builder().name(name).build())
//                    .employee(Employee.builder().fullName(fullName).build())
                    .status(Objects.equals(status, "Hiện"))
                    .createdAt(LocalDateTime.now())
//                    .createdBy(created_by)
                    .build();

            Long id = blogDao.save(blog);
        } catch (Exception e) {
            error = e.getMessage();
        }
        if (StringUtils.isNotEmpty(error)) {
            // Redirect to the create page with the error message
            ServletUtils.redirect(req, resp, "/management/blog/create?error=" + error);
        } else {
            // Redirect to the doctor management page
            ServletUtils.redirect(req, resp, "/management/blog");
        }

    }

    public void update(HttpServletRequest req, HttpServletResponse resp) throws Exception {

//        Long id = null;
//        if (req.getParameter("id") != null) {
//            id = Long.valueOf(req.getParameter("id"));
//        }
//        if (req.getParameter("id")==null)
//        {
//            System.out.println(req.getParameter("id"));
////            System.out.println(req.getParameter("id"));
//            return;
//        }
        Long id = Long.valueOf(req.getParameter("id"));
        Long cate_id = Long.valueOf(req.getParameter("category_id"));
        String title = req.getParameter("title");
        String brief = req.getParameter("brief");
        String description = req.getParameter("description");
        String create_at = req.getParameter("create_at");
        String update_at = req.getParameter("update_at");
        String created_by = req.getParameter("create_by");
        String status = req.getParameter("status");
        String error = null;
        ArrayList<CategoryBlog> categoryBlog1 = (ArrayList<CategoryBlog>) categoryBlogDao.getAll();
        try {
            Optional<Employee> employee = employeeDao.findByName(created_by);

           /* if (categoryBlog != null && !Objects.equals(categoryBlog.getId(), id)) {
                throw new SystemRuntimeException(StringUtils.join("Name ", name, " already exists"));
            }*/

            CategoryBlog categoryBlog = categoryBlogDao.get(cate_id.intValue()).isPresent() ? categoryBlogDao.get(cate_id.intValue()).get() : null;
            categoryBlog.setUpdatedAt(LocalDateTime.now());
            categoryBlog.setCreatedAt(LocalDateTime.parse(create_at));
            categoryBlogDao.update(categoryBlog);

//            blogDao.update(
//                    Blogs.builder()
////                            .categoryBlog(CategoryBlog.builder().id(id).build())
//                            .categoryBlog(CategoryBlog.builder().id(categoryBlog.getId()).build())
//                            .id(id)
//                            .status(status)
//                            .title(title)
//                            .brief(brief)
//                            .description(description)
//                            .createdAt(LocalDateTime.parse(create_at))
//                            .updatedAt(LocalDateTime.now())
//                            .createdBy(employee.get().getId())
//                            .build()
//
//            );

            blogDao.update(
                    Blogs.builder()
                            .categoryBlog(CategoryBlog.builder().id(cate_id).build())
                            .id(id)
                            .status(Boolean.valueOf(status))
                            .title(title)
                            .brief(brief)
                            .description(description)
                            .createdAt(LocalDateTime.parse(create_at))
                            .updatedAt(LocalDateTime.now())
                            .createdBy(employee.isPresent() ? employee.get().getId() : null)
                            .categoryID(categoryBlog.getId())
                            .build()
            );
            System.out.println("runnable");
        } catch (Exception e) {
            error = e.getMessage();
        }

        if (StringUtils.isNotEmpty(error)) {
            ServletUtils.redirect(req, resp, "/management/blog/update?id=" + id + "&error=" + error);
        } else {
            req.setAttribute("category", categoryBlog1);
            ServletUtils.redirect(req, resp, "/management/blog/update?id=" + id);
        }
    }

//    public void update(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//        Long id = Long.valueOf(req.getParameter("id"));
//        String title = req.getParameter("title");
//        String brief = req.getParameter("brief");
//        String description = req.getParameter("description");
//        String name = req.getParameter("name");
//        String create_at = req.getParameter("create_at");
//        String update_at = req.getParameter("update_at");
//        String created_by = req.getParameter("created_by");
//        String status = "1";
//        String error = null;
//
//        try {
//            Optional<Employee> employee = employeeDao.findByName(created_by);
//            CategoryBlog categoryBlog = categoryBlogDao.findByName(name);
//
//            // Cập nhật thông tin cho categoryBlog
//            categoryBlog.setName(name);
//            categoryBlog.setUpdatedAt(LocalDateTime.now());
//            categoryBlog.setCreatedAt(LocalDateTime.parse(create_at));
//            categoryBlogDao.update(categoryBlog);
//
//            // Cập nhật thông tin cho blog
//            Blogs blog = blogDao.get(Math.toIntExact(id)).orElse(null);
//            if (blog != null) {
//                blog.setCategoryBlog(categoryBlog);
//                blog.setStatus(status);
//                blog.setTitle(title);
//                blog.setBrief(brief);
//                blog.setDescription(description);
//                blog.setCreatedAt(LocalDateTime.parse(create_at));
//                blog.setUpdatedAt(LocalDateTime.now());
//                if (employee.isPresent()) {
//                    blog.setCreatedBy(employee.get().getId());
//                }
//                blogDao.update(blog);
//            }
//        } catch (Exception e) {
//            error = e.getMessage();
//        }
//
//        if (StringUtils.isNotEmpty(error)) {
//            ServletUtils.redirect(req, resp, "/management/blog/update?id=" + id + "&error=" + error);
//        } else {
//            ServletUtils.redirect(req, resp, "/management/blog/update?id=" + id);
//        }
//    }


    public void updateRender(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));
        if(req.getParameter("id")==null)
        {
            System.out.println("id null roi");
            return;
        }
        String error = req.getParameter("error");
        Blogs blogs = blogDao.get(id).isPresent()
                ? blogDao.get(Integer.parseInt(req.getParameter("id"))).get() : null;

        CategoryBlog categoryBlog = categoryBlogDao.get(id).isPresent()
                ? categoryBlogDao.get(Integer.parseInt(req.getParameter("id"))).get() : null;

        ArrayList<CategoryBlog> categoryBlog1 = (ArrayList<CategoryBlog>) categoryBlogDao.getAll();
        assert blogs != null;
        blogs.setCategoryBlog(categoryBlog);
        req.setAttribute("blogs", blogs);
        req.getSession().setAttribute("category_lst", categoryBlog1);
        req.setAttribute("blog_id", id);
        req.setAttribute("error", error);
        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/blogs/detail.jsp");
    }
    public void updateRender1() throws Exception {
        int id = Integer.parseInt(String.valueOf("1"));
//        String error = req.getParameter("error");
        Blogs blogs = blogDao.get(id).isPresent()
                ? blogDao.get(Integer.parseInt("1")).get() : null;

        CategoryBlog categoryBlog = categoryBlogDao.get(id).isPresent()
                ? categoryBlogDao.get(id).get() : null;

        ArrayList<CategoryBlog> categoryBlog1 = (ArrayList<CategoryBlog>) categoryBlogDao.getAll();
        assert blogs != null;
        blogs.setCategoryBlog(categoryBlog);
//        req.setAttribute("blogs", blogs);
//        req.setAttribute("category", categoryBlog1);
//        req.setAttribute("blog_id", id);
//        req.setAttribute("error", error);
//        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/blogs/detail.jsp");
    }
    public static void main(String[] args) throws Exception {
        BlogService obj = new BlogService();
//        HttpServletRequest req = new HttpServletRequestWrapper();
        obj.updateRender1();
    }
    //    public void updateRender(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//        String idParam = req.getParameter("id");
//        String error = req.getParameter("error");
//        int id = 0;
//
//        if (idParam != null && !idParam.isEmpty() && !idParam.equals("null")) {
//            id = Integer.parseInt(idParam);
//        }
//
//        Blogs blogs = blogDao.get(id).orElse(null);
//        CategoryBlog categoryBlog = categoryBlogDao.get(id).orElse(null);
//        ArrayList<CategoryBlog> categoryBlogList = (ArrayList<CategoryBlog>) categoryBlogDao.getAll();
//
//        if (blogs != null) {
//            blogs.setCategoryBlog(categoryBlog);
//        }
//
//        req.setAttribute("blogs", blogs);
//        req.setAttribute("category", categoryBlogList);
//        req.setAttribute("blog_id", id);
//        req.setAttribute("error", error);
//        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/blogs/detail.jsp");
//    }


    public void getAllManagement(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String page = req.getParameter("page");
        String search = req.getParameter("search");
        String status = req.getParameter("status");
        String category = req.getParameter("category");
        int pageNumber = 1;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }
        if (StringUtils.isEmpty(search)) {
            search = "";
        }
        if (StringUtils.isEmpty(status)) {
            status = "all";
        }
        if (StringUtils.isEmpty(category)) {
            category = "all";
        }

        try {
            String renderedSearch = renderSearch(search.trim());
            Integer totalItem = blogDao.countListBlogSummary(renderedSearch,status,category);
            Integer totalPage = PagingUtils.getTotalPage(totalItem);
            List<Blogs> blogs = blogDao.getAllBlog(
                    PagingUtils.getOffset(pageNumber),
                    PagingUtils.DEFAULT_PAGE_SIZE,
                    renderedSearch,
                    status.trim(),
                    category.trim()
            );
//            List<DoctorResDto> doctorsByGender = dao.getDoctorsByGender(gender.trim());
//            List<DoctorResDto> doctorsByStatus = dao.getDoctorsByStatus(status.trim());
//            req.setAttribute("doctorsByGender", doctorsByGender);
//            req.setAttribute("doctorsByStatus",doctorsByStatus);;
            ArrayList<CategoryBlog> categoryBlog1 = (ArrayList<CategoryBlog>) categoryBlogDao.getAll();
            req.setAttribute("cate_lst",categoryBlog1);
            req.setAttribute("blogs", BlogResDto.convert(blogs));
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("currentPage", pageNumber);
            req.setAttribute("search", search);
            req.setAttribute("status", status);
            req.setAttribute("category", category);
            req.setAttribute("url", "/management/blog");
            ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/blogs/index.jsp");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    private String renderSearch(String search) {
        if (search.matches("\\d{2}/\\d{2}/\\d{4}")) {
            String[] date = search.split("/");
            return StringUtils.join(date[2], "-", date[1], "-", date[0]);
        }
        return search;
    }

    public void status(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
//        blogDao.status(Blogs.builder().id());
    }

    public void delete(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        blogDao.delete(Blogs.builder().id((long) id).build());
        ServletUtils.redirect(req, resp, "/management/blog");
    }


}


