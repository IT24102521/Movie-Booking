package com.movie_booking.moviebookingsystem.service;

import com.movie_booking.moviebookingsystem.model.User;
import com.movie_booking.moviebookingsystem.repository.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProfileService {
    private final UserRepository userRepository;

    public ProfileService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // Update user profile
    public User updateProfile(Long userId, String firstName, String lastName, String email) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Check if email is already taken by another user
        if (!user.getEmail().equals(email)) {
            userRepository.findByEmail(email).ifPresent(existingUser -> {
                if (!existingUser.getId().equals(userId)) {
                    throw new RuntimeException("Email already in use");
                }
            });
        }

        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);

        return userRepository.save(user);
    }

    // Change password
    public void changePassword(Long userId, String currentPassword, String newPassword) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Verify current password
        if (!BCrypt.checkpw(currentPassword, user.getPassword())) {
            throw new RuntimeException("Current password is incorrect");
        }

        // Validate new password strength
        if (!isPasswordStrong(newPassword)) {
            throw new RuntimeException("Password must be at least 8 characters with uppercase, lowercase, number, and special characters");
        }

        // Hash and set new password
        user.setPassword(BCrypt.hashpw(newPassword, BCrypt.gensalt(12)));
        userRepository.save(user);
    }

    // Delete account
    @Transactional
    public void deleteAccount(Long userId, String password) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Verify password before deletion
        if (!BCrypt.checkpw(password, user.getPassword())) {
            throw new RuntimeException("Password is incorrect");
        }

        userRepository.delete(user);
    }

    private boolean isPasswordStrong(String password) {
        // At least 8 chars, 1 uppercase, 1 lowercase, 1 number, 1 special char
        String pattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        return password.matches(pattern);
    }
}
