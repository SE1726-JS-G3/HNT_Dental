package com.hnt.dental.entities;
import lombok.*;

import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Doctors extends BaseEntity{
    private String fullName;
    private Date dob;
    private Boolean gender;
    private String phone;
    private String address;
    private String position;
    private String description;
    private DoctorRank doctorRank;
}
