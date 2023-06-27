package com.hnt.dental.entities;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.time.LocalDate;
import java.time.LocalTime;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class Booking extends BaseEntity{
    private String name;
    private int phone;
    private int age;
    private boolean gender;
    private Service service;
    private Account account;
    private Employee employee;
    private Doctors doctors;
    private LocalDate date;
    private LocalTime time;
    private int fee;
    private String description;
    private boolean status;
    private String payment;
}
