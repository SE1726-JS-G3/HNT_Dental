package com.hnt.dental.entities;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Booking extends BaseEntity{
    private Service service;
    private Account account;
    private Employee employee;
    private Date date;
    private LocalDateTime time;
    private String decription;
    private String status;
}
