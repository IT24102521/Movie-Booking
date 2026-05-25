// CategoryObserver.java - Create in package com.example.secrud.observer
package com.example.secrud.observer;

public interface CategoryObserver {
    void onCategoryChange(Long movieId, String movieTitle, String action, String categories);
}