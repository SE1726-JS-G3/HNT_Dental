package com.hnt.dental.dto.response;

import com.hnt.dental.entities.*;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalTime;

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
    private int age;
    private boolean gender;
    private Service service;
    private Account account;
    private Doctors doctors;
    private Employee employee;
 private Booking booking;
    private LocalDate date;
    private LocalTime time;
    private String description;
    private Patient patient;
    private int status;

private Long id;
    private String payment;
    private String status;
    private double fee;
    private int account_id;
}
