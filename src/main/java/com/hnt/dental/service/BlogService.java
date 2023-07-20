package com.hnt.dental.service;

import com.hnt.dental.dao.BlogDao;
import com.hnt.dental.dao.CategoryBlogDao;
import com.hnt.dental.dao.EmployeeDao;
import com.hnt.dental.dao.impl.BlogDaoImpl;
import com.hnt.dental.dao.impl.CategoryBlogDaoImpl;
import com.hnt.dental.dao.impl.EmployeeDaoImpl;
import com.hnt.dental.dto.response.BlogResDto;
import com.hnt.dental.entities.*;
import com.hnt.dental.util.PagingUtils;
import com.hnt.dental.util.ServletUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.SQLException;
import java.time.LocalDateTime;
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

    }

//    private String getFileName(Part part) {
//        String contentDisposition = part.getHeader("content-disposition");
//        String[] tokens = contentDisposition.split(";");
//        for (String token : tokens) {
//            if (token.trim().startsWith("filename")) {
//                return token.substring(token.indexOf("=") + 2, token.length() - 1);
//            }
//        }
//        return "";
//    }
//    private static final String UPLOAD_DIR = "static\\images"; // Change this to your desired directory
//    public void create(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//        String title = req.getParameter("title");
//        String brief = req.getParameter("brief");
//        String description = req.getParameter("description");
//        Long categoryId = Long.valueOf(req.getParameter("categoryId"));
//        String name = req.getParameter("name");
//        String status = req.getParameter("status");
//        String error = null;
//        Part filePart = req.getPart("image");
//        String fileName = getFileName(filePart);
//        // Get the absolute path of the "webapp" directory
//        String appPath = req.getServletContext().getRealPath("");
//        // Construct the relative path to the target directory
//        String uploadPath = appPath + UPLOAD_DIR;
//        try (InputStream fileContent = filePart.getInputStream()) {
//            File targetFile = new File(uploadPath, fileName);
//            Files.copy(fileContent, targetFile.toPath());
//        } catch (IOException e) {
//            System.out.println("Error uploading and saving file " + fileName + ": " + e.getMessage());
//        }
//
//        try {
//            Blogs blog = Blogs.builder()
//                    .title(title)
//                    .brief(brief)
//                    .description(description)
//                    .categoryID(categoryId)
//                    .categoryBlog(CategoryBlog.builder().name(name).build())
////                    .employee(Employee.builder().fullName(fullName).build())
//                    .status(Objects.equals(status, "Hiện"))
//                    .createdAt(LocalDateTime.now())
//                    .image(fileName)
////                    .createdBy(created_by)
//                    .build();
//
//            Long id = blogDao.save(blog);
//        } catch (Exception e) {
//            error = e.getMessage();
//        }
//        if (StringUtils.isNotEmpty(error)) {
//            ServletUtils.redirect(req, resp, "/management/blog/create?error=" + error);
//        } else {
//            ServletUtils.redirect(req, resp, "/management/blog");
//        }
//
//    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
    private static final String UPLOAD_DIR = "static\\images"; // Change this to your desired directory
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
        Part filePart = req.getPart("image");
        String fileName = getFileName(filePart);
        // Get the absolute path of the "webapp" directory
        String appPath = req.getServletContext().getRealPath("");
        // Construct the relative path to the target directory
        String uploadPath = appPath + UPLOAD_DIR;
        try (InputStream fileContent = filePart.getInputStream()) {
            File targetFile = new File(uploadPath, fileName);
            Files.copy(fileContent, targetFile.toPath());
        } catch (IOException e) {
            System.out.println("Error uploading and saving file " + fileName + ": " + e.getMessage());
        }

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
                    .image(fileName)
                    .build();

            Long id = blogDao.save(blog);
        } catch (Exception e) {
            error = e.getMessage();
        }
        if (StringUtils.isNotEmpty(error)) {
            ServletUtils.redirect(req, resp, "/management/blog/create?error=" + error);
        } else {
            ServletUtils.redirect(req, resp, "/management/blog");
        }

    }

    public void update(HttpServletRequest req, HttpServletResponse resp) throws Exception {
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

            CategoryBlog categoryBlog = categoryBlogDao.get(cate_id.intValue()).isPresent() ? categoryBlogDao.get(cate_id.intValue()).get() : null;
            categoryBlog.setUpdatedAt(LocalDateTime.now());
            categoryBlog.setCreatedAt(LocalDateTime.parse(create_at));
            categoryBlogDao.update(categoryBlog);

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

//    public void updateRender(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//        String error = req.getParameter("error");
//
//        String idParam = req.getParameter("id");
//        if (idParam == null) {
//            System.out.println("id is null");
//            return;
//        }
//
//        int id = Integer.parseInt(idParam);
//        Optional<Blogs> blogsOptional = blogDao.get(id);
//        if (blogsOptional.isEmpty()) {
//            System.out.println("blogs is null");
//            return;
//        }
//        Blogs blogs = blogsOptional.get();
//
//        Optional<CategoryBlog> categoryBlogOptional = categoryBlogDao.get(id);
//        if (categoryBlogOptional.isEmpty()) {
//            System.out.println("categoryBlog is null");
//            return;
//        }
//        CategoryBlog categoryBlog = categoryBlogOptional.get();
//
//        ArrayList<CategoryBlog> categoryBlog1 = (ArrayList<CategoryBlog>) categoryBlogDao.getAll();
//
//        blogs.setCategoryBlog(categoryBlog);
//        req.setAttribute("blogs", blogs);
//        req.getSession().setAttribute("category_lst", categoryBlog1);
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


