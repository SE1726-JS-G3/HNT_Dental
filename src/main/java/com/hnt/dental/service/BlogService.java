package com.hnt.dental.service;

import com.hnt.dental.dao.BlogDao;
import com.hnt.dental.dao.impl.BlogsDaoImpl;
import com.hnt.dental.dto.response.BlogsSummaryRes;
import com.hnt.dental.entities.Blogs;
import com.hnt.dental.entities.CategoryBlog;
import com.hnt.dental.util.PagingUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

public class BlogService {

    private static final BlogDao dao;

    static {
        dao = new BlogsDaoImpl();
    }

    public void getAll(HttpServletRequest req, HttpServletResponse resp) {
        String page = req.getParameter("page");
        String search = req.getParameter("search");
        String categoryId = req.getParameter("categoryId");
        String oder = req.getParameter("oder");
        int pageNumber = 1;
        Integer category = null;

        if (StringUtils.isNotEmpty(page)) {
            pageNumber = Integer.parseInt(page);
        }
        if (StringUtils.isNotEmpty(categoryId)) {
            category = Integer.parseInt(categoryId);
        }
        if (StringUtils.isEmpty(search)) {
            search = "";
        }
        if (StringUtils.isEmpty(oder)) {
            oder = "id";
        }
        try {
            Integer totalItem = dao.countListBlogs(search.trim());
            Integer totalPage = PagingUtils.getTotalPage(totalItem);
            List<BlogsSummaryRes> blogSummaryRes = dao.getListBlogsFilter(PagingUtils.getOffset(pageNumber), PagingUtils.DEFAULT_PAGE_SIZE, search.trim(), oder, category);
            List<CategoryBlog> categoryBlogList = dao.getListCategoryBlog();
            req.setAttribute("blogs", blogSummaryRes);
            req.setAttribute("categoryBlogList", categoryBlogList);
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("currentPage", pageNumber);
            req.setAttribute("search", search);
            req.setAttribute("categoryId", categoryId);
            req.setAttribute("url", "/blog");
            req.getRequestDispatcher("/WEB-INF/templates/home/blog/index.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public void getBlogById(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("id");

        Blogs blogs = dao.getBlogID(Integer.parseInt(id));
        List<CategoryBlog> categoryBlogList = dao.getListCategoryBlog();
        List<BlogsSummaryRes> blogRelated = dao.getListBlogRelated(blogs.getId(), blogs.getCategoryBlog().getId() );
        req.setAttribute("blogs", blogs);
        req.setAttribute("blogRelated", blogRelated);
        req.setAttribute("categoryBlogList", categoryBlogList);
        req.getRequestDispatcher("/WEB-INF/templates/home/blog/detail.jsp").forward(req, resp);
//        ServletUtils.requestDispatcher(req, resp, "/WEB-INF/templates/management/blog/detail.jsp");
    }




}
