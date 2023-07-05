package com.hnt.dental.entities;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class Doctors extends BaseEntity{
    private String fullName;
    private Date dob;
    private Boolean gender;
    private String phone;
    private String address;
    private String position;
    private String description;
    private DoctorRank doctorRank;
    private String image;
}
