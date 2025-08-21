package com.movie_booking.moviebookingsystem.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        String requestURI = request.getRequestURI();

        // Allow public endpoints
        if (requestURI.startsWith("/auth") ||
                requestURI.startsWith("/static") ||
                requestURI.equals("/login") ||
                requestURI.equals("/") ||
                requestURI.equals("/home") ||
                requestURI.equals("/browse-movies") ||
                requestURI.equals("/cinemas") ||
                requestURI.equals("/promotions") ||
                requestURI.equals("/vouchers")) {
            return true;
        }

        // Check session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("authenticated") == null) {
            response.sendRedirect("/auth/login");
            return false;
        }

        // Check session for protected routes (profile and bookings)
        if (requestURI.equals("/profile") || requestURI.equals("/my-bookings")) {
            session = request.getSession(false);
            if (session == null || session.getAttribute("authenticated") == null) {
                response.sendRedirect("/auth/login");
                return false;
            }
        }

        // Check session for protected routes
        if (requestURI.startsWith("/profile")) {
            HttpSession httpSession = request.getSession(false);
            if (httpSession == null || httpSession.getAttribute("authenticated") == null) {
                response.sendRedirect("/auth/login");
                return false;
            }
        }

        return true;
    }

}