package com.hnt.dental.entities;

import lombok.*;
import lombok.experimental.SuperBuilder;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@SuperBuilder
public class BookingResult extends BaseEntity{
    private Long id;
    private Long bookingId;
    private String medicalHistory;
    private String symptoms;
    private String attachments;
    private String diagnosis;
    private String prescription;
    private String recommendations;


}
