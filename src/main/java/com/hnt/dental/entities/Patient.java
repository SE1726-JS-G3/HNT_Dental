package com.hnt.dental.entities;

import lombok.*;

import java.time.LocalDate;
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class Patient extends BaseEntity{
    private Account account;
    private String fullName;
    private LocalDate dob;
    private Boolean gender;
    private String phone;
    private String address;
    private String description;


}
