package com.example.secrud.patterns.observer;

import java.util.ArrayList;
import java.util.List;

public class UserRegistrationSubject {
    private final List<Observer> observers = new ArrayList<>();

    public void attach(Observer observer) {
        observers.add(observer);
    }

    public void detach(Observer observer) {
        observers.remove(observer);
    }

    public void notifyAllObservers(String message) {
        for (Observer observer : observers) {
            observer.update(message);
        }
    }

    // Simulate user registration event
    public void registerUser(String username) {
        System.out.println("🧍 New user registered: " + username);
        notifyAllObservers("New user registered: " + username);
    }
}
