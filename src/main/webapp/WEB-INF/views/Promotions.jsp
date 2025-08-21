<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MovieMate - Promotions</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">
    <style>
        .promo-card {
            transition: transform 0.3s;
            border: none;
            overflow: hidden;
        }
        .promo-card:hover {
            transform: translateY(-5px);
        }
        .promo-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #e50914;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />

<div class="container mt-5">
    <h1 class="text-center mb-4" style="color: #e50914;">Special Promotions</h1>

    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card promo-card">
                <span class="promo-badge">50% OFF</span>
                <img src="https://via.placeholder.com/500x300?text=Weekday+Special" class="card-img-top" alt="Weekday Special">
                <div class="card-body">
                    <h5 class="card-title">Weekday Special</h5>
                    <p class="card-text">Get 50% off on all movies from Monday to Thursday. Valid until end of month.</p>
                    <a href="#" class="btn btn-danger">Claim Offer</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 mb-4">
            <div class="card promo-card">
                <span class="promo-badge">BUY 1 GET 1</span>
                <img src="https://via.placeholder.com/500x300?text=Student+Deal" class="card-img-top" alt="Student Deal">
                <div class="card-body">
                    <h5 class="card-title">Student Deal</h5>
                    <p class="card-text">Students get buy one ticket, get one free with valid student ID. Every Friday.</p>
                    <a href="#" class="btn btn-danger">Claim Offer</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 mb-4">
            <div class="card promo-card">
                <span class="promo-badge">FREE POPCORN</span>
                <img src="https://via.placeholder.com/500x300?text=Family+Package" class="card-img-top" alt="Family Package">
                <div class="card-body">
                    <h5 class="card-title">Family Package</h5>
                    <p class="card-text">Book 4 tickets and get free large popcorn and drinks. Weekends only.</p>
                    <a href="#" class="btn btn-danger">Claim Offer</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 mb-4">
            <div class="card promo-card">
                <span class="promo-badge">25% OFF</span>
                <img src="https://via.placeholder.com/500x300?text=Senior+Discount" class="card-img-top" alt="Senior Discount">
                <div class="card-body">
                    <h5 class="card-title">Senior Discount</h5>
                    <p class="card-text">Seniors aged 60+ get 25% off on all shows. Valid any day with ID proof.</p>
                    <a href="#" class="btn btn-danger">Claim Offer</a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="partials/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>