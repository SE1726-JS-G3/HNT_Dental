package com.hnt.dental.dto.response;

import lombok.*;

import java.time.LocalDate;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Builder
public class BookingDto {

    private ServiceTypeDto serviceTypeDto;
    private ServiceResDto serviceResDto;
    private Long id;
    private String name;
    private int phone;
    private boolean gender;
    private int age;
    private LocalDate date;
    private String time;
    private String description;
    private String payment;
    private String status;
    private double fee;
    private int account_id;
}
