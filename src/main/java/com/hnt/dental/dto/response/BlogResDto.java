package com.hnt.dental.dto.response;

import com.hnt.dental.dao.impl.BlogDaoImpl;
import com.hnt.dental.entities.Blogs;

import com.hnt.dental.entities.CategoryBlog;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.util.DateUtils;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@SuperBuilder

public class BlogResDto {
    private long id;
    private CategoryBlog categoryBlog;
    private Employee employee;
    private String title;
    private String brief;
    private String description;
    private String create_at;
    private String update_at;
    private String active;
    private long created_by;


    //    public static void main(String[] args) throws SQLException {
//        BlogDaoImpl blogDaoimpl = new BlogDaoImpl();
//        List<Blogs> blog = blogDaoimpl.getAll(0,1,"title");
//        System.out.println("" + blog.get(0).getCategory_id());
////        List<Blogs> blogs = new List<Blogs>() ;
////        List<BlogResDto> a = convert()
//    }
    public static List<BlogResDto> convert(List<Blogs> blogs) {
        List<BlogResDto> blogResDtos = new ArrayList<>();

        for (Blogs blog : blogs) {
            blogResDtos.add(
                    BlogResDto.builder()
                            .id(blog.getId())
                            .categoryBlog(
                                    CategoryBlog.builder().name(blog.getCategoryBlog().getName()).build()
                            ).employee(Employee.builder().fullName(blog.getEmployee().getFullName()).build())
                            .title(blog.getTitle())
                            .brief(blog.getBrief())
                            .description(blog.getDescription())
                            .create_at(String.valueOf(blog.getCreatedAt()))
                            .active(blog.getActive())

                            .build()
            );
        }
        return blogResDtos;
    }
}
