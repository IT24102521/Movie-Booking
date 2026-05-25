// CategoryObserverManager.java
package com.example.secrud.observer;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CategoryObserverManager {
    private final List<CategoryObserver> observers = new ArrayList<>();

    public void addObserver(CategoryObserver observer) {
        observers.add(observer);
    }

    public void notifyCategoryAssigned(Long movieId, String movieTitle, List<String> categories) {
        for (CategoryObserver observer : observers) {
            observer.onCategoryChange(movieId, movieTitle, "CATEGORY_ASSIGNED",
                    String.join(", ", categories));
        }
    }

    public void notifyCategoryRemoved(Long movieId, String movieTitle, String category) {
        for (CategoryObserver observer : observers) {
            observer.onCategoryChange(movieId, movieTitle, "CATEGORY_REMOVED", category);
        }
    }
}