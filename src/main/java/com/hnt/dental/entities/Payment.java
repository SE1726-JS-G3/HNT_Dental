package com.hnt.dental.entities;
import lombok.*;

import java.util.Date;

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
    private Boolean status;
    private Date create_at;
    private Date update_at;

}
