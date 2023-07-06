package com.hnt.dental.entities;

import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CategoryBlog extends BaseEntity{


    private String name;
    public CategoryBlog(Long id, String name) {
        super.setId(id);
        this.name = name;
    }

}
