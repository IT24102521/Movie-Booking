package com.example.secrud.patterns.observer;

public class EmailServiceObserver implements Observer {
    @Override
    public void update(String message) {
        System.out.println("📧 Email Service sent notification: " + message);
    }
}