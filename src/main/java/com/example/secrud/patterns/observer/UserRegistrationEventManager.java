package com.example.secrud.patterns.observer;

public class UserRegistrationEventManager {
    private static final UserRegistrationSubject subject = new UserRegistrationSubject();

    static {
        // Attach observers once globally
        subject.attach(new AdminObserver());
        subject.attach(new EmailServiceObserver());
    }

    public static UserRegistrationSubject getSubject() {
        return subject;
    }
}
