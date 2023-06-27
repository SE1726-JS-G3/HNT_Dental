package com.hnt.dental.entities;

import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CategoryBlog extends BaseEntity{

    private Long id;
    private String name;

}
