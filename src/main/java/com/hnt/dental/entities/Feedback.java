package com.hnt.dental.entities;
import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Feedback  extends BaseEntity{
    private Booking booking;
    private Service service;
    private Doctors doctors;
    private int star;
    private String description;
    private Boolean isShow;
}
