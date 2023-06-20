package com.hnt.dental.entities;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalTime;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Booking extends BaseEntity{
    private String name;
    private int phone;
    private String email;
    private int age;
    private Service service;
    private Account account;
    private Employee employee;
    private LocalDate date;
    private LocalTime time;
    private int fee;
    private String description;
    private boolean status;
    private String payment;
}
