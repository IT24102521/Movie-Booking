package com.movie_booking.moviebookingsystem.exception;

public class AccountNotEnabledException extends RuntimeException {
  public AccountNotEnabledException(String message) {
    super(message);
  }
}