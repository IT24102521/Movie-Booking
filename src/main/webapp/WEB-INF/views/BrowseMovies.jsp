<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Browser</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #1a1a2e;
            color: #f0f0f0;
            line-height: 1.6;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            text-align: center;
            padding: 30px 0;
            background: linear-gradient(to right, #16213e, #0f3460);
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
        }

        h1 {
            font-size: 2.8rem;
            margin-bottom: 10px;
            color: #e94560;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .tagline {
            font-size: 1.2rem;
            color: #8fe3cf;
            margin-bottom: 20px;
        }

        .search-container {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .search-box {
            display: flex;
            width: 80%;
            max-width: 600px;
        }

        .search-input {
            flex: 1;
            padding: 15px;
            border: none;
            border-radius: 5px 0 0 5px;
            font-size: 1rem;
            background: #0f3460;
            color: white;
        }

        .search-input::placeholder {
            color: #8da0bc;
        }

        .search-btn {
            padding: 15px 25px;
            background: #e94560;
            color: white;
            border: none;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
        }

        .search-btn:hover {
            background: #ff577f;
        }

        .filters {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 30px;
        }

        .filter-btn {
            padding: 10px 20px;
            background: #16213e;
            color: #8fe3cf;
            border: 2px solid #0f3460;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .filter-btn:hover, .filter-btn.active {
            background: #e94560;
            color: white;
            border-color: #e94560;
        }

        .movies-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }

        .movie-card {
            background: #16213e;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .movie-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.4);
        }

        .movie-poster {
            width: 100%;
            height: 350px;
            object-fit: cover;
            display: block;
        }

        .movie-info {
            padding: 20px;
        }

        .movie-title {
            font-size: 1.2rem;
            margin-bottom: 10px;
            color: #8fe3cf;
        }

        .movie-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            color: #8da0bc;
        }

        .movie-rating {
            color: #e94560;
            font-weight: bold;
        }

        .movie-description {
            color: #c2c2c2;
            font-size: 0.9rem;
            margin-bottom: 15px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .read-more {
            color: #e94560;
            text-decoration: none;
            font-weight: bold;
            font-size: 0.9rem;
        }

        footer {
            text-align: center;
            padding: 20px;
            background: #16213e;
            border-radius: 10px;
            color: #8da0bc;
            margin-top: 30px;
        }

        @media (max-width: 768px) {
            .movies-grid {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                gap: 20px;
            }

            h1 {
                font-size: 2.2rem;
            }

            .search-box {
                width: 100%;
            }
        }

        @media (max-width: 480px) {
            .movies-grid {
                grid-template-columns: 1fr;
            }

            h1 {
                font-size: 1.8rem;
            }

            .filters {
                flex-direction: column;
                align-items: center;
            }

            .filter-btn {
                width: 80%;
            }
        }
    </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />
<div class="container">
    <header>
        <h1>Movie Browser</h1>
        <p class="tagline">Discover your next favorite movie</p>
    </header>

    <div class="search-container">
        <div class="search-box">
            <input type="text" class="search-input" placeholder="Search for movies...">
            <button class="search-btn">Search</button>
        </div>
    </div>

    <div class="filters">
        <button class="filter-btn active">All</button>
        <button class="filter-btn">Action</button>
        <button class="filter-btn">Comedy</button>
        <button class="filter-btn">Drama</button>
        <button class="filter-btn">Sci-Fi</button>
        <button class="filter-btn">Horror</button>
    </div>

    <div class="movies-grid">
        <!-- Movie 1 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450/16213e/8da0bc?text=Inception" alt="Inception" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">Inception</h3>
                <div class="movie-details">
                    <span>2010</span>
                    <span class="movie-rating">★ 8.8</span>
                </div>
                <p class="movie-description">A thief who steals corporate secrets through dream-sharing technology is given the task of planting an idea into the mind of a C.E.O.</p>
                <a href="#" class="read-more">Read more</a>
            </div>
        </div>

        <!-- Movie 2 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450/16213e/8da0bc?text=The+Shawshank+Redemption" alt="The Shawshank Redemption" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">The Shawshank Redemption</h3>
                <div class="movie-details">
                    <span>1994</span>
                    <span class="movie-rating">★ 9.3</span>
                </div>
                <p class="movie-description">Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.</p>
                <a href="#" class="read-more">Read more</a>
            </div>
        </div>

        <!-- Movie 3 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450/16213e/8da0bc?text=The+Dark+Knight" alt="The Dark Knight" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">The Dark Knight</h3>
                <div class="movie-details">
                    <span>2008</span>
                    <span class="movie-rating">★ 9.0</span>
                </div>
                <p class="movie-description">When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests.</p>
                <a href="#" class="read-more">Read more</a>
            </div>
        </div>

        <!-- Movie 4 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450/16213e/8da0bc?text=Pulp+Fiction" alt="Pulp Fiction" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">Pulp Fiction</h3>
                <div class="movie-details">
                    <span>1994</span>
                    <span class="movie-rating">★ 8.9</span>
                </div>
                <p class="movie-description">The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.</p>
                <a href="#" class="read-more">Read more</a>
            </div>
        </div>

        <!-- Movie 5 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450/16213e/8da0bc?text=Interstellar" alt="Interstellar" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">Interstellar</h3>
                <div class="movie-details">
                    <span>2014</span>
                    <span class="movie-rating">★ 8.6</span>
                </div>
                <p class="movie-description">A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.</p>
                <a href="#" class="read-more">Read more</a>
            </div>
        </div>

        <!-- Movie 6 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450/16213e/8da0bc?text=The+Godfather" alt="The Godfather" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">The Godfather</h3>
                <div class="movie-details">
                    <span>1972</span>
                    <span class="movie-rating">★ 9.2</span>
                </div>
                <p class="movie-description">The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.</p>
                <a href="#" class="read-more">Read more</a>
            </div>
        </div>
    </div>

    <footer>
        <p>Movie Browser &copy; 2023 | Browse your favorite films</p>
    </footer>
</div>
<jsp:include page="partials/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>