package com.movie_booking.moviebookingsystem.exception;

public class AuthException extends RuntimeException {
    public AuthException(String message) {
        super(message);
    }
}