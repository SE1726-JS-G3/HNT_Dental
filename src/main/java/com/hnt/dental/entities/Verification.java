package com.hnt.dental.entities;

import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@SuperBuilder
public class Verification extends BaseEntity {
    private Long id;
    private String email;
    private String code;
    private int lifeTime;

}
