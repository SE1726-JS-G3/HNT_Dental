package com.hnt.dental.dto.response;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ServiceDetailDto {
    private Long id;
    private String name;
    private String fee;
    private String type;
    private String image;
    private String description;

}
