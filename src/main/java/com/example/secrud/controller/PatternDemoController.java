package com.example.secrud.controller;

import com.example.secrud.patterns.observer.AdminObserver;
import com.example.secrud.patterns.observer.EmailServiceObserver;
import com.example.secrud.patterns.observer.UserRegistrationSubject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PatternDemoController {

    @GetMapping("/api/observer")
    public String testObserverPattern() {
        // Create subject
        UserRegistrationSubject subject = new UserRegistrationSubject();

        // Create and attach observers
        subject.attach(new AdminObserver());
        subject.attach(new EmailServiceObserver());

        // Simulate user registration
        subject.registerUser("JohnDoe");

        return "✅ Observer pattern executed. Check your console for notifications.";
    }
}