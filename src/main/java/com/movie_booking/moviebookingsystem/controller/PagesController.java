package com.movie_booking.moviebookingsystem.controller;

import com.movie_booking.moviebookingsystem.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PagesController {

    @GetMapping("/browse-movies")
    public String browseMovies() {
        return "BrowseMovies"; // Your existing JSP file
    }

    @GetMapping("/cinemas")
    public String cinemas() {
        return "Cinemas"; // This will render Cinemas.jsp
    }

    @GetMapping("/promotions")
    public String promotions() {
        return "Promotions"; // This will render Promotions.jsp
    }

    @GetMapping("/vouchers")
    public String vouchers() {
        return "Vouchers"; // This will render Vouchers.jsp
    }

    @GetMapping("/my-bookings")
    public String myBookings(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/auth/login";
        }
        model.addAttribute("user", user);
        // In a real app, you would fetch bookings from a service
        return "MyBookings"; // This will render MyBookings.jsp
    }
}
