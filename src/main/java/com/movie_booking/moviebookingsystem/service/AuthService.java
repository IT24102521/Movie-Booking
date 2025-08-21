package com.movie_booking.moviebookingsystem.service;

import com.movie_booking.moviebookingsystem.model.User;
import com.movie_booking.moviebookingsystem.exception.*;
import com.movie_booking.moviebookingsystem.repository.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class AuthService {
    private final UserRepository userRepository;

    public AuthService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void registerUser(User user) throws EmailExistsException {
        if (userRepository.existsByEmail(user.getEmail())) {
            throw new EmailExistsException("Email already in use: " + user.getEmail());
        }

        // Validate password strength
        if (!isPasswordStrong(user.getPassword())) {
            throw new AuthException("Password must be at least 8 characters with uppercase, lowercase, and special characters");
        }

        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12))); // Increased salt rounds
        user.setEnabled(true);
        userRepository.save(user);
    }

    public User authenticate(String email, String password) throws AuthException {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new AuthException("Account not found. Please create an account."));

        if (!BCrypt.checkpw(password, user.getPassword())) {
            throw new AuthException("Incorrect password");
        }

        if (!user.isEnabled()) {
            throw new AuthException("Account not activated. Please check your email.");
        }

        return user;
    }

    private boolean isPasswordStrong(String password) {
        // At least 8 chars, 1 uppercase, 1 lowercase, 1 special char
        String pattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        return password.matches(pattern);
    }
}