package com.hnt.dental.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class FeedbackDoctorDto {
    private Long id;
    private String fullName;
    private String image;
    private String description;
    private Integer star;
    private Date createdAt;
}
