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
    private String email;
    private int age;
    private Service service;
    private Account account;
    private Doctors doctors;
    private Employee employee;
    private LocalDate date;
    private LocalTime time;
    private int fee;
    private String description;
    private Patient patient;
    private boolean status;
    private String payment;
}
