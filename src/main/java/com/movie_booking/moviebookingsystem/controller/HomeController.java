package com.movie_booking.moviebookingsystem.controller;

import com.movie_booking.moviebookingsystem.model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping({"/", "/home"})
    public String home(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);

        if (session != null) {
            User user = (User) session.getAttribute("user");
            model.addAttribute("isLoggedIn", user != null);
            if (user != null) {
                model.addAttribute("username", user.getEmail());
                // Add user object to model for Thymeleaf access
                model.addAttribute("user", user);
            }
        } else {
            model.addAttribute("isLoggedIn", false);
        }

        return "home";
    }
}