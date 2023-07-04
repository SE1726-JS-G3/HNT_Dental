package com.hnt.dental.dto.response;
<<<<<<< HEAD
import com.hnt.dental.entities.Account;
import com.hnt.dental.entities.Booking;
=======
import com.hnt.dental.entities.Patient;
>>>>>>> develop
import com.hnt.dental.util.DateUtils;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

<<<<<<< HEAD
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PatientResDto {
    private Long id;
    private Booking booking;
    private Account account;
    private String fullName;
    private String Name;
    private String gender;
    private String phone;
    private String address;
    private String description;
    private String status;
    private String dob;
    private String email;
    private String date;
    private String time;
    public static List<PatientResDto> convert(List<PatitentsDto> patients) {
        List<PatientResDto> patientResDto = new ArrayList<>();
        for (PatitentsDto patient : patients) {
            patientResDto.add(
                    PatientResDto.builder()
                            .id(patient.getAccount().getId())
                            .fullName(patient.getFullName())
                            .dob(DateUtils.convertLocalDateToString(patient.getDob()))
                            .gender(patient.getGender() ? "Nam" : "Nữ")
                            .email(patient.getAccount().getEmail())
                            .status(patient.getBooking().getStatus() == 1 ? "rejected" : "approved")
                            .date(DateUtils.convertLocalDateToString(patient.getBooking().getDate()))
                            .time(String.valueOf(patient.getBooking().getTime()))
                            .phone(patient.getPhone())
                            .Name(patient.getBooking().getName())
                            .build()
            );
        }
        return patientResDto;
    }
}
=======

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder

public class PatientResDto {
    private Long id;
    private String name;
    private String dob;
    private String gender;
    private String email;
    private String status;

    public static List<PatientResDto> convert(List<Patient> patients) {
        List<PatientResDto> patientResDtos = new ArrayList<>();
        for (Patient patient: patients){
            patientResDtos.add(
                    PatientResDto.builder()
                            .id(patient.getAccount().getId())
                            .name(patient.getFullName())
                            .dob(DateUtils.convertLocalDateToString(patient.getDob()))
                            .gender(patient.getGender() ? "Nam" : "Nữ")
                            .status(patient.getStatus()? "active" : "nactive")
                            .build()
            );
        }
        return patientResDtos;
    }

}
>>>>>>> develop
