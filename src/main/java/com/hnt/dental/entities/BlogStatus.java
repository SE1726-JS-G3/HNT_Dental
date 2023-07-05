package com.hnt.dental.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;


@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder

public class BlogStatus {
    private String id;
    private String name;
}
