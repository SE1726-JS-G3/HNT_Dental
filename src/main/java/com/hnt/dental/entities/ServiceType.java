package com.hnt.dental.entities;
import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ServiceType extends BaseEntity{
    private Service service;
    private String name;
    private String description;
}
