package com.hnt.dental.exception;

public class SystemRuntimeException extends RuntimeException {
    public SystemRuntimeException(String errorDecryptingStoredPassword, Exception e) {
    }

    public SystemRuntimeException(String message) {
        super(message);
    }

}
