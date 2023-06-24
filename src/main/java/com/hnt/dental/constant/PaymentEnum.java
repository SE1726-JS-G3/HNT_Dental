package com.hnt.dental.constant;

public enum PaymentEnum {
    VNPAY, CASH;

    public static PaymentEnum getPaymentEnum(String payment) {
        if (payment.equalsIgnoreCase("VNPAY")) {
            return VNPAY;
        } else if (payment.equalsIgnoreCase("CASH")) {
            return CASH;
        }
        return null;
    }
}
