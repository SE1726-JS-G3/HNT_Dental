package com.hnt.dental.dto.response;

import com.hnt.dental.entities.CategoryBlog;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class BlogsSummaryRes {
    private Long id;
    private CategoryBlog categoryBlog;
    private String title;
    private String title_img;
    private String brief;
    private String description;
}
