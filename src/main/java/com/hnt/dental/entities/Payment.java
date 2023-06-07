package com.hnt.dental.entities;
import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Payment extends BaseEntity{
    private Account account;
    private ServiceFee serviceFee;
    private ServiceType serviceType;
    private Booking booking;

}
