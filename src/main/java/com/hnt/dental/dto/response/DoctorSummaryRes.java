package com.hnt.dental.dto.response;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class DoctorSummaryRes {
    private Long id;
    private String fullName;
    private String rankName;
    private String image;
    private String description;
}
