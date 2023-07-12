package com.hnt.dental.dto.response;

import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.DoctorRank;
import com.hnt.dental.entities.Service;
import lombok.*;

import java.util.Date;
import java.util.List;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DoctorDto {
    private Service service;
    private Account account;
    private String fullName;
    private Long id;
    private Date dob;
    private Boolean gender;
    private String phone;
    private String address;
    private String position;
    private String description;
    private DoctorRank doctorRank;
    private String image;


}
