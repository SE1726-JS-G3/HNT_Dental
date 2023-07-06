package com.hnt.dental.dto.response;

import lombok.Builder;
import lombok.Data;
import com.hnt.dental.entities.Service;
@Data
@Builder
public class DoctorSummaryRes {
    private Service service;
    private Long id;
    private String fullName;
    private String rankName;
    private String image;
    private String description;
}
