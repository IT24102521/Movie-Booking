<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MovieMate - My Bookings</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">
    <style>
        .booking-card {
            background: linear-gradient(135deg, #1a1a1a 0%, #2a2a2a 100%);
            border-radius: 10px;
            margin-bottom: 20px;
            overflow: hidden;
        }
        .booking-status {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
        }
        .status-confirmed {
            background: #28a745;
            color: white;
        }
        .status-cancelled {
            background: #dc3545;
            color: white;
        }
        .status-completed {
            background: #6c757d;
            color: white;
        }
        .movie-poster {
            width: 100px;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />

<div class="container mt-5">
    <h1 class="text-center mb-4" style="color: #e50914;">My Bookings</h1>

    <div class="row mb-4">
        <div class="col-md-6">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search bookings...">
                <button class="btn btn-danger">Search</button>
            </div>
        </div>
        <div class="col-md-6 text-end">
            <div class="btn-group">
                <button class="btn btn-outline-danger active">All</button>
                <button class="btn btn-outline-danger">Upcoming</button>
                <button class="btn btn-outline-danger">Completed</button>
                <button class="btn btn-outline-danger">Cancelled</button>
            </div>
        </div>
    </div>

    <!-- Sample Booking Cards -->
    <div class="booking-card">
        <div class="card-body">

            <div class="row">
                <div class="col-md-2">
                    <img src="https://media.gv.com.sg/imagesresize/img1307.jpg" alt="Movie" class="movie-poster">
                </div>
                <div class="col-md-6">
                    <h4>Marvel Studios' The Fantastic Four: First Steps</h4>
                    <p class="mb-1"><i class="fas fa-calendar me-2"></i>March 15, 2024</p>
                    <p class="mb-1"><i class="fas fa-clock me-2"></i>7:30 PM</p>
                    <p class="mb-1"><i class="fas fa-ticket me-2"></i>2 Tickets - Row D, Seats 5-6</p>
                    <p class="mb-0"><i class="fas fa-building me-2"></i>Downtown Cinema - Screen 3</p>
                </div>
                <div class="col-md-4 text-end">
                    <p class="h4" style="color: #e50914;">$32.00</p>
                    <p class="text-muted">Booking #MV123456</p>
                    <div class="btn-group mt-2">
                        <button class="btn btn-outline-danger btn-sm"><i class="fas fa-ticket-alt me-1"></i>View Tickets</button>
                        <button class="btn btn-danger btn-sm"><i class="fas fa-times me-1"></i>Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="booking-card">
        <div class="card-body">

            <div class="row">
                <div class="col-md-2">
                    <img src="https://media.gv.com.sg/imagesresize/img1295.jpg" alt="Movie" class="movie-poster">
                </div>
                <div class="col-md-6">
                    <h4>The Naked Gun</h4>
                    <p class="mb-1"><i class="fas fa-calendar me-2"></i>March 10, 2024</p>
                    <p class="mb-1"><i class="fas fa-clock me-2"></i>4:15 PM</p>
                    <p class="mb-1"><i class="fas fa-ticket me-2"></i>3 Tickets - Row F, Seats 8-10</p>
                    <p class="mb-0"><i class="fas fa-building me-2"></i>Mall Cinema - Screen 2</p>
                </div>
                <div class="col-md-4 text-end">
                    <p class="h4" style="color: #e50914;">$48.00</p>
                    <p class="text-muted">Booking #MV123457</p>
                    <div class="btn-group mt-2">
                        <button class="btn btn-outline-danger btn-sm"><i class="fas fa-receipt me-1"></i>View Receipt</button>
                        <button class="btn btn-danger btn-sm"><i class="fas fa-star me-1"></i>Rate Movie</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="booking-card">
        <div class="card-body">

            <div class="row">
                <div class="col-md-2">
                    <img src="https://media.gv.com.sg/imagesresize/img1281.jpg" alt="Movie" class="movie-poster">
                </div>
                <div class="col-md-6">
                    <h4>The Bad Guys 2</h4>
                    <p class="mb-1"><i class="fas fa-calendar me-2"></i>March 5, 2024</p>
                    <p class="mb-1"><i class="fas fa-clock me-2"></i>6:00 PM</p>
                    <p class="mb-1"><i class="fas fa-ticket me-2"></i>4 Tickets - Row G, Seats 12-15</p>
                    <p class="mb-0"><i class="fas fa-building me-2"></i>Riverside Cinema - Screen 1</p>
                </div>
                <div class="col-md-4 text-end">
                    <p class="h4" style="color: #e50914;">$64.00</p>
                    <p class="text-muted">Booking #MV123458</p>
                    <p class="text-danger"><i class="fas fa-info-circle me-1"></i>Cancelled on March 4, 2024</p>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center mt-4">
        <p class="text-muted">Showing 3 of 12 bookings</p>
        <button class="btn btn-outline-danger">Load More</button>
    </div>
</div>

<jsp:include page="partials/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>