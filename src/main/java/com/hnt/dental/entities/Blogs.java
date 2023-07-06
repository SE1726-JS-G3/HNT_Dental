package com.hnt.dental.entities;

import lombok.*;
import lombok.Builder;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder

public class Blogs extends BaseEntity{

    private CategoryBlog categoryBlog;
    private Employee employee;
    private String title;
    private String title_img;
    private String brief;
    private String description;


}
