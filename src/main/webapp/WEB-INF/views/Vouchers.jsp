<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MovieMate - Vouchers</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">
    <style>
        .voucher-card {
            border: 2px dashed #e50914;
            border-radius: 10px;
            background: linear-gradient(135deg, #1a1a1a 0%, #2a2a2a 100%);
            transition: transform 0.3s;
        }
        .voucher-card:hover {
            transform: scale(1.02);
        }
        .voucher-code {
            background: #e50914;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-family: monospace;
            font-size: 1.2rem;
            letter-spacing: 2px;
        }
    </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />

<div class="container mt-5">
    <h1 class="text-center mb-4" style="color: #e50914;">Gift Vouchers</h1>

    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card voucher-card p-4 text-center">
                <h3>$25 Gift Voucher</h3>
                <div class="voucher-code my-3">MOVIE25</div>
                <p>Perfect for a movie night with treats!</p>
                <p class="text-muted">Valid for 6 months from purchase</p>
                <button class="btn btn-danger">Purchase Now</button>
            </div>
        </div>

        <div class="col-md-6 mb-4">
            <div class="card voucher-card p-4 text-center">
                <h3>$50 Gift Voucher</h3>
                <div class="voucher-code my-3">MOVIE50</div>
                <p>Great for a couple's movie date!</p>
                <p class="text-muted">Valid for 6 months from purchase</p>
                <button class="btn btn-danger">Purchase Now</button>
            </div>
        </div>

        <div class="col-md-6 mb-4">
            <div class="card voucher-card p-4 text-center">
                <h3>$100 Gift Voucher</h3>
                <div class="voucher-code my-3">MOVIE100</div>
                <p>Ideal for family movie outings!</p>
                <p class="text-muted">Valid for 12 months from purchase</p>
                <button class="btn btn-danger">Purchase Now</button>
            </div>
        </div>

        <div class="col-md-6 mb-4">
            <div class="card voucher-card p-4 text-center">
                <h3>Premium Experience</h3>
                <div class="voucher-code my-3">PREMIUMVIP</div>
                <p>2 tickets + premium seating + gourmet snacks</p>
                <p class="text-muted">Valid for 3 months from purchase</p>
                <button class="btn btn-danger">Purchase Now</button>
            </div>
        </div>
    </div>

    <div class="alert alert-info mt-4">
        <h4><i class="fas fa-info-circle me-2"></i>How to Use Vouchers</h4>
        <p>1. Purchase a voucher from this page</p>
        <p>2. You will receive a code via email</p>
        <p>3. Enter the code during checkout when booking tickets</p>
        <p>4. The voucher amount will be deducted from your total</p>
    </div>
</div>

<jsp:include page="partials/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>