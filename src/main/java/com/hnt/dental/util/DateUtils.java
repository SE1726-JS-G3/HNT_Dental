package com.hnt.dental.util;

import java.sql.Date;
import java.time.LocalDate;

public class DateUtils {
    public static Date convertStringToDate(String date) {
        LocalDate localDate = LocalDate.parse(date);
        return Date.valueOf(localDate);
    }
}
