<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MovieMate - Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}static/css/home.css">
</head>
<body>
<jsp:include page="partials/navbar.jsp" />
<c:if test="${not empty success}">
    <div class="alert alert-success alert-dismissible fade show" role="alert" style="margin: 20px auto; max-width: 1200px;">
            ${success}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>
<!-- Bootstrap Carousel -->
<div id="movieCarousel" class="carousel slide" data-bs-ride="carousel">
    <!-- Indicators will be auto-generated -->
    <div class="carousel-indicators"></div>

    <!-- Slides Container -->
    <div class="carousel-inner">
        <!-- Slide 1 - Pirates of the Caribbean -->
        <div class="carousel-item active">
            <img src="https://sm.ign.com/ign_pk/photo/h/how-to-wat/how-to-watch-the-pirates-of-the-caribbean-movies-in-chronolo_a6tk.jpg" alt="Pirates of the Caribbean">
            <div class="carousel-caption">
                <h2>Epic Adventures</h2>
                <p>Join Captain Jack Sparrow on thrilling high-seas adventures</p>
                <a href="#" class="btn btn-danger">Book Now</a>
            </div>
        </div>

        <!-- Slide 2 - The Hobbit -->
        <div class="carousel-item">
            <img src="https://alishahussain27.wordpress.com/wp-content/uploads/2014/11/the-hobbit-the-desolation-of-smaug-2013-movie-banner-poster.jpg" alt="The Hobbit">
            <div class="carousel-caption">
                <h2>Fantasy Epic</h2>
                <p>Embark on an unforgettable journey through Middle-earth</p>
                <a href="#" class="btn btn-danger">Book Now</a>
            </div>
        </div>

        <!-- Slide 3 - Zootopia 2 -->
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/static/images/movie3.jpg" alt="Zootopia 2">
            <div class="carousel-caption">
                <h2>Animated Fun</h2>
                <p>Return to the amazing city where animals live like humans</p>
                <a href="#" class="btn btn-danger">Book Now</a>
            </div>
        </div>

        <!-- Slide 4 - How to Train Your Dragon -->
        <div class="carousel-item">
            <img src="https://musicart.xboxlive.com/7/846d5100-0000-0000-0000-000000000002/504/image.jpg" alt="How to Train Your Dragon">
            <div class="carousel-caption">
                <h2>Dragon Fantasy</h2>
                <p>Soar through skies in this heartwarming tale of friendship</p>
                <a href="#" class="btn btn-danger">Book Now</a>
            </div>
        </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#movieCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#movieCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

<!-- Hero Section -->
<div class="hero text-center py-5">
    <h1>Welcome to MovieMate</h1>
    <p class="lead">Your gateway to the latest blockbusters</p>
</div>

<!-- Movie Categories -->
<div class="category-section">
    <h2 class="category-title">Now Showing</h2>
    <div class="movies">
        <div class="movie-card">
            <img src="https://media.gv.com.sg/imagesresize/img1307.jpg" alt="fast & furious">
            <h3>Marvel Studios' The Fantastic Four: First Steps</h3>
            <a href="#" class="book-btn">Book Now</a>
        </div>
        <div class="movie-card">
            <img src="https://media.gv.com.sg/imagesresize/img1295.jpg" alt="The Naked Gun">
            <h3>The Naked Gun</h3>
            <a href="#" class="book-btn">Book Now</a>
        </div>
        <div class="movie-card">
            <img src="https://media.gv.com.sg/imagesresize/img4295.jpg" alt="The Shadow's Edge">
            <h3>The Shadow's Edge 捕风追影</h3>
            <a href="#" class="book-btn">Book Now</a>
        </div>
        <div class="movie-card">
            <img src="https://media.gv.com.sg/imagesresize/img1281.jpg" alt="The Bad Guys 2">
            <h3>The Bad Guys 2</h3>
            <a href="#" class="book-btn">Book Now</a>
        </div>
        <div class="movie-card">
            <img src="https://media.gv.com.sg/imagesresize/img8434.jpg" alt="War 2">
            <h3>War 2</h3>
            <a href="#" class="book-btn">Book Now</a>
        </div>
        <div class="movie-card">
            <img src="https://lh4.googleusercontent.com/proxy/5J4Q5UEWheajL3esD7QNm2UdmSaoQMx8Mkpigv-hcaT4efnUliELBzdE0tA81LaGgR7s_ypsDB_MSop4Xmjl3aSiteYT" alt="IF">
            <h3>IF</h3>
            <a href="#" class="book-btn">Book Now</a>
        </div>
        <div class="movie-card">
            <img src="https://m.media-amazon.com/images/M/MV5BNzMyNWZlYmYtZDgxMC00ZTU3LWFiYzctNGE0ZDc0OTlhZTRlXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg" alt="paddington">
            <h3>Paddington in Peru</h3>
            <a href="#" class="book-btn">Book Now</a>
        </div>
        <div class="movie-card">
            <img src="https://upload.wikimedia.org/wikipedia/en/1/10/The_Chronicles_of_Narnia_-_The_Lion%2C_the_Witch_and_the_Wardrobe.jpg" alt="NARNIA">
            <h3>NARNIA</h3>
            <a href="#" class="book-btn">Book Now</a>
        </div>
        <div class="movie-card">
            <img src="https://upload.wikimedia.org/wikipedia/en/6/60/Yes_Day_film_poster.png" alt="YESDAY">
            <h3>YES DAY</h3>
            <a href="#" class="book-btn">Book Now</a>
        </div>
        <div class="movie-card">
            <img src="https://m.media-amazon.com/images/M/MV5BMjIwMDIwNjAyOF5BMl5BanBnXkFtZTgwNDE1MDc2NTM@._V1_FMjpg_UX1000_.jpg" alt="Moana 2">
            <h3>How To Train YOur Dragon The Hidden World</h3>
            <a href="#" class="book-btn">Book Now</a>
        </div>
    </div>
</div>

<div class="category-section">
    <h2 class="category-title">Coming Soon</h2>
    <div class="movies">
        <div class="movie-card">
            <img src="https://media.gv.com.sg/imagesresize/img2329.jpg" alt="four trails">
            <h3>Four Trails</h3>
        </div>
        <div class="movie-card">
            <img src="https://media.gv.com.sg/imagesresize/img4291.jpg" alt="daughter is a zombie">
            <h3>My Daughter is a Zombie</h3>
        </div>
        <div class="movie-card">
            <img src="https://media.gv.com.sg/imagesresize/img4301.jpg" alt="rompak">
            <h3>Magik Rompak</h3>
        </div>
        <div class="movie-card">
            <img src="https://media.gv.com.sg/imagesresize/img4300.jpg" alt="THARAE">
            <h3>THARAE</h3>
        </div>
        <div class="movie-card">
            <img src="https://media.gv.com.sg/imagesresize/img4299.jpg" alt="JALAN">
            <h3>JALAN PULANG</h3>
        </div>
    </div>
</div>
<jsp:include page="partials/footer.jsp" />

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}static/js/home.js"></script>
</body>
</html>