package com.hnt.dental.entities;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class Blogs extends BaseEntity{
    private CategoryBlog categoryBlog;
    private String title;
    private String brief;
    private String description;

}
