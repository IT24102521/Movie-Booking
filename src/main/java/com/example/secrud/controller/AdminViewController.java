package com.example.secrud.controller;

import com.example.secrud.services.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminViewController {

    @Autowired
    private ReviewService reviewService;

    // 🔹 ADMIN DASHBOARD VIEW - Support multiple route patterns
    @GetMapping({"/admin/dashboard", "/admin-dashboard"})
    public String adminDashboard(Model model) {
        // Add any dashboard data here if needed
        return "admin_dashboard";
    }

    // 🔹 ADMIN ROOT REDIRECT
    @GetMapping("/admin")
    public String adminRoot() {
        return "redirect:/admin-dashboard";
    }

    // 🔹 ADMIN LIST VIEW - Ensure accessibility
    @GetMapping("/admin-list")
    public String adminList() {
        return "admin_list";
    }

    // Note: Review management views are handled by ReviewViews class
    // to avoid route conflicts
}
