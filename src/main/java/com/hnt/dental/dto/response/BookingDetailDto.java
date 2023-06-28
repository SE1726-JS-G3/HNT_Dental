package com.hnt.dental.dto.response;

import com.hnt.dental.entities.Doctors;
import com.hnt.dental.entities.Employee;
import com.hnt.dental.entities.Payment;
import com.hnt.dental.entities.Service;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalTime;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class BookingDetailDto {
    private Long id;
    private LocalDate date;
    private LocalTime time;
    private Doctors doctors;
    private Employee employee;
    private Service service;
    private Double fee;
    private Boolean status;
    private String description;
}
