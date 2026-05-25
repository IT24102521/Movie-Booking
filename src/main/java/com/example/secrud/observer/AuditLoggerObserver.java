// AuditLoggerObserver.java
package com.example.secrud.observer;

import org.springframework.stereotype.Component;

@Component
public class AuditLoggerObserver implements CategoryObserver {

    public AuditLoggerObserver(CategoryObserverManager observerManager) {
        observerManager.addObserver(this);
    }

    @Override
    public void onCategoryChange(Long movieId, String movieTitle, String action, String categories) {
        System.out.println("🔔 OBSERVER PATTERN: Movie '" + movieTitle + "' (ID: " + movieId + ") - " +
                action + " - Categories: " + categories);

        // In real scenario, you could:
        // - Save to audit database table
        // - Send notifications
        // - Update search indexes
        // - Clear caches
    }
}