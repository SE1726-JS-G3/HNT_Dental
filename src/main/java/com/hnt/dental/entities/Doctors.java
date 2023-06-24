package com.hnt.dental.entities;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.time.LocalDate;

import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class Doctors extends BaseEntity{
    private String fullName;
    private Account account;
    private LocalDate dob;
    private Boolean gender;
    private String phone;
    private String address;
    private String position;
    private String description;
    private DoctorRank doctorRank;
    private String image;
    private boolean status;
    private long rankId;
}
