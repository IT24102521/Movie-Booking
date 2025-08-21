package com.movie_booking.moviebookingsystem.controller;

import com.movie_booking.moviebookingsystem.model.User;
import com.movie_booking.moviebookingsystem.service.ProfileService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/profile")
public class ProfileController {
    private final ProfileService profileService;

    public ProfileController(ProfileService profileService) {
        this.profileService = profileService;
    }

    // Show profile page
    @GetMapping
    public String showProfile(HttpSession httpSession, Model model) {
        User user = (User) httpSession.getAttribute("user");
        if (user == null) {
            return "redirect:/auth/login";
        }
        model.addAttribute("user", user);
        return "Profile";
    }

    // Update profile
    @PostMapping("/update")
    public String updateProfile(
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam String email,
            HttpSession httpSession,
            RedirectAttributes redirectAttributes) {

        try {
            User currentUser = (User) httpSession.getAttribute("user");
            if (currentUser == null) {
                return "redirect:/auth/login";
            }

            User updatedUser = profileService.updateProfile(
                    currentUser.getId(), firstName, lastName, email
            );

            // Update user in session
            httpSession.setAttribute("user", updatedUser);
            redirectAttributes.addFlashAttribute("success", "Profile updated successfully!");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }

        return "redirect:/profile";
    }

    // Change password
    @PostMapping("/change-password")
    public String changePassword(
            @RequestParam String currentPassword,
            @RequestParam String newPassword,
            @RequestParam String confirmPassword,
            HttpSession httpSession,
            RedirectAttributes redirectAttributes) {

        try {
            User user = (User) httpSession.getAttribute("user");
            if (user == null) {
                return "redirect:/auth/login";
            }

            // Validate password confirmation
            if (!newPassword.equals(confirmPassword)) {
                throw new RuntimeException("New passwords do not match");
            }

            profileService.changePassword(user.getId(), currentPassword, newPassword);
            redirectAttributes.addFlashAttribute("success", "Password changed successfully!");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
        }

        return "redirect:/profile";
    }

    // Delete account
    @PostMapping("/delete")
    public String deleteAccount(
            @RequestParam String password,
            HttpSession httpSession,
            RedirectAttributes redirectAttributes) {

        try {
            User user = (User) httpSession.getAttribute("user");
            if (user == null) {
                return "redirect:/auth/login";
            }

            profileService.deleteAccount(user.getId(), password);
            httpSession.invalidate();
            redirectAttributes.addFlashAttribute("success", "Account deleted successfully!");
            return "redirect:/auth/login";

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/profile";
        }
    }
}