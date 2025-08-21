<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/navbar.css">
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-moviemate">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/static/images/logo.png" alt="MovieMate Logo" width="258" height="120">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">
                        <i class="fas fa-home me-1"></i> Home
                    </a>
                </li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/browse-movies"><i class="fas fa-film me-1"></i> Browse Movies</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/cinemas"><i class="fas fa-building me-1"></i> Cinemas</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/promotions"><i class="fas fa-percentage me-1"></i> Promotions</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/vouchers"><i class="fas fa-ticket-alt me-1"></i> Vouchers</a></li>

                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li class="nav-item dropdown">

                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user me-1"></i> ${user.displayName}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">
                                    <i class="fas fa-user-circle me-2"></i>Profile
                                </a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/my-bookings">
                                    <i class="fas fa-ticket-alt me-2"></i>My Bookings
                                </a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/auth/logout"
                                       onclick="return confirm('Are you sure you want to logout?')">
                                        <i class="fas fa-sign-out-alt me-2"></i>Logout
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/auth/login">
                                <i class="fas fa-sign-in-alt me-1"></i> Login
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/auth/register">
                                <i class="fas fa-user-plus me-1"></i> Register
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>