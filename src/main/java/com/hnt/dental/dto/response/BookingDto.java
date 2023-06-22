package com.hnt.dental.dto.response;

import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.entities.Service;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.time.LocalDate;
import java.time.LocalTime;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class BookingDto {
    private Long id;
    private String name;

    private Service service;
    private int age;
    private LocalDate date;
    private LocalTime time;
    private boolean status;
}

