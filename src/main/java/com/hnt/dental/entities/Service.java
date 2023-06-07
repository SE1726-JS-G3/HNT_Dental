package com.hnt.dental.entities;
import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Service extends BaseEntity{
    private String name;
    private String description;
    private Long image;
}
