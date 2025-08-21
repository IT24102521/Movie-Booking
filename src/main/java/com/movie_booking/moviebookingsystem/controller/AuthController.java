package com.movie_booking.moviebookingsystem.controller;

import com.movie_booking.moviebookingsystem.model.User;
import com.movie_booking.moviebookingsystem.service.AuthService;
import com.movie_booking.moviebookingsystem.exception.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/auth")
public class AuthController {
    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
    }

    @PostMapping("/login")
    public String loginUser(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        try {
            User user = authService.authenticate(email, password);
            session.setAttribute("user", user);
            session.setAttribute("authenticated", true);
            redirectAttributes.addFlashAttribute("success", "Sign in successful!");
            return "redirect:/home";
        } catch (AuthException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/auth/login";
        }
    }


    @GetMapping("/register")
    public String showRegisterForm(@RequestParam(required = false) String error,
                                   Model model) {
        model.addAttribute("user", new User());
        if (error != null) {
            model.addAttribute("error", error);
        }
        return "auth/register";
    }

    @PostMapping("/register")
    public String registerUser (
            @ModelAttribute User user,
            RedirectAttributes redirectAttributes) {
        try {
            authService.registerUser (user);
            redirectAttributes.addFlashAttribute("success", "Registration successful! Please login.");
            return "redirect:/auth/login";
        } catch (EmailExistsException e) {
            redirectAttributes.addAttribute("error", e.getMessage());
            return "redirect:/auth/register";
        } catch (AuthException e) {
            redirectAttributes.addAttribute("error", e.getMessage());
            return "redirect:/auth/register";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/auth/login?logout=true";
    }

    @GetMapping("/login")
    public String showLoginForm(@RequestParam(required = false) String error,
                                @RequestParam(required = false) String logout,
                                Model model) {
        if (error != null) {
            model.addAttribute("error", "Invalid email or password");
        }
        if (logout != null) {
            model.addAttribute("success", "You have been logged out successfully");
        }
        return "auth/login";
    }
}
