package com.hnt.dental.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@SuperBuilder
public class ServiceManagementDto {
    private Long id;
    private String name;
    private String type;
    private String fee;
    private String image;
    private String status;
}
