package com.hnt.dental.dto.response;

import com.hnt.dental.entities.CategoryBlog;
import lombok.*;

@Data
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BlogsSummaryRes {
    private Long id;
    private CategoryBlog categoryBlog;
    private String title;
    private String title_img;
    private String brief;
    private String description;


}
