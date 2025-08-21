<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MovieMate - Cinemas</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">
</head>
<body>
<jsp:include page="partials/navbar.jsp" />

<div class="container mt-5">
    <h1 class="text-center mb-4" style="color: #e50914;">Our Cinemas</h1>

    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card cinema-card">
                <img src="https://via.placeholder.com/300x200?text=Cinema+1" class="card-img-top" alt="Cinema 1">
                <div class="card-body">
                    <h5 class="card-title">Downtown Cinema</h5>
                    <p class="card-text">123 Main Street, City Center</p>
                    <p class="card-text"><i class="fas fa-phone me-2"></i> (555) 123-4567</p>
                    <a href="#" class="btn btn-danger">View Showtimes</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card cinema-card">
                <img src="https://via.placeholder.com/300x200?text=Cinema+2" class="card-img-top" alt="Cinema 2">
                <div class="card-body">
                    <h5 class="card-title">Mall Cinema</h5>
                    <p class="card-text">456 Shopping Avenue, Mall Level 3</p>
                    <p class="card-text"><i class="fas fa-phone me-2"></i> (555) 987-6543</p>
                    <a href="#" class="btn btn-danger">View Showtimes</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card cinema-card">
                <img src="https://via.placeholder.com/300x200?text=Cinema+3" class="card-img-top" alt="Cinema 3">
                <div class="card-body">
                    <h5 class="card-title">Riverside Cinema</h5>
                    <p class="card-text">789 River Road, Waterside District</p>
                    <p class="card-text"><i class="fas fa-phone me-2"></i> (555) 456-7890</p>
                    <a href="#" class="btn btn-danger">View Showtimes</a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="partials/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>