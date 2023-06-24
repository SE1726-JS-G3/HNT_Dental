package com.hnt.dental.dto.response;

import lombok.*;

import java.time.LocalDate;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Builder
public class BookingDto {
    private String name;
    private int phone;
    private String email;
    private int age;
    private LocalDate date;
    private String time;
    private String decription;
    private String payment;

}
