<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${category} Movies - MovieMate</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        .movie-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .movie-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body class="bg-gray-900 text-white min-h-screen">

<jsp:include page="partials/navbar.jsp" />

<div class="relative bg-gradient-to-r from-red-900/50 to-purple-900/50 py-16">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col gap-6 lg:flex-row lg:items-end lg:justify-between">
            <div>
                <p class="text-sm uppercase tracking-[0.3em] text-red-200 mb-3">Browse Movies</p>
                <h1 class="text-4xl md:text-5xl font-bold mb-4 text-white">${category} Movies</h1>
                <p class="text-lg text-gray-300 max-w-2xl">
                    Explore all published movies in the <span class="font-semibold text-red-200">${category}</span> category.
                </p>
            </div>
            <div class="flex flex-wrap gap-3">
                <a href="/browse-movies" class="inline-flex items-center gap-2 rounded-full border border-white/20 px-5 py-2.5 font-semibold text-white transition hover:border-red-400 hover:bg-red-600/20">
                    <i class="fas fa-arrow-left"></i>
                    Back to Browse
                </a>
                <a href="#movies" class="inline-flex items-center gap-2 rounded-full bg-red-600 px-5 py-2.5 font-semibold text-white transition hover:bg-red-700">
                    View Movies
                    <i class="fas fa-arrow-down"></i>
                </a>
            </div>
        </div>
    </div>
</div>

<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <c:choose>
        <c:when test="${not empty movies}">
            <div id="movies" class="mb-6 flex items-center justify-between">
                <div>
                    <p class="text-gray-300"><span class="font-semibold text-white">${movies.size()}</span> movies found</p>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-6">
                <c:forEach var="movie" items="${movies}">
                    <div class="movie-card bg-gray-800 rounded-xl overflow-hidden border border-gray-700 hover:border-red-500 transition-all duration-300">
                        <c:if test="${not empty movie.imageUrl}">
                            <div class="h-56 w-full bg-black flex items-center justify-center overflow-hidden">
                                <img src="${movie.imageUrl}" alt="${movie.title} poster" class="max-h-full max-w-full object-contain"/>
                            </div>
                        </c:if>
                        <div class="p-6">
                            <div class="flex justify-between items-start mb-3">
                                <h3 class="text-lg font-bold text-white line-clamp-2 flex-1 mr-2">${movie.title}</h3>
                                <span class="px-2 py-1 bg-red-600 text-white text-xs rounded-full whitespace-nowrap">
                                    ${category}
                                </span>
                            </div>

                            <div class="space-y-2">
                                <p class="text-gray-300 text-sm flex items-center">
                                    <i class="fas fa-film mr-2 text-red-400"></i>
                                    ${movie.genre}
                                </p>
                                <p class="text-gray-300 text-sm flex items-center">
                                    <i class="fas fa-user mr-2 text-red-400"></i>
                                    ${movie.director}
                                </p>
                                <p class="text-gray-300 text-sm flex items-center">
                                    <i class="fas fa-clock mr-2 text-red-400"></i>
                                    ${movie.duration} min
                                </p>
                                <p class="text-gray-300 text-sm flex items-center">
                                    <i class="fas fa-calendar mr-2 text-red-400"></i>
                                    ${movie.releaseDate}
                                </p>
                                <div class="flex items-center justify-between pt-2">
                                    <span class="text-yellow-400 font-semibold">
                                        <c:choose>
                                            <c:when test="${not empty movie.price}">$ ${movie.price}</c:when>
                                            <c:otherwise>Price: N/A</c:otherwise>
                                        </c:choose>
                                    </span>
                                    <span class="text-sm text-gray-300 movie-rating" data-movie-id="${movie.id}" data-movie-title="${movie.title}">
                                        <i class="fa-solid fa-star text-yellow-400 mr-1"></i>
                                        <span class="rating-value">0.0</span>
                                    </span>
                                </div>
                            </div>

                            <div class="mt-4 pt-4 border-t border-gray-700">
                                <button class="w-full bg-red-600 hover:bg-red-700 text-white py-3 px-6 rounded-lg font-semibold transition-all duration-300 hover:transform hover:scale-105 hover:shadow-lg flex items-center justify-center group book-now-btn"
                                        data-title="${movie.title}"
                                        data-price="${movie.price != null ? movie.price : 15.99}">
                                    <i class="fas fa-ticket-alt mr-2 group-hover:animate-pulse"></i>
                                    Book Now
                                </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="text-center py-16">
                <i class="fas fa-film text-7xl text-gray-600 mb-6"></i>
                <h2 class="text-3xl font-bold text-gray-300 mb-3">No movies found</h2>
                <p class="text-gray-400 mb-6">There are currently no published movies in this category.</p>
                <a href="/browse-movies" class="inline-flex items-center gap-2 rounded-full bg-red-600 px-5 py-3 font-semibold text-white transition hover:bg-red-700">
                    <i class="fas fa-arrow-left"></i>
                    Back to Browse
                </a>
            </div>
        </c:otherwise>
    </c:choose>
</main>

<jsp:include page="partials/footer.jsp" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.body.addEventListener('click', function(e) {
            const btn = e.target.closest('.book-now-btn');
            if (btn) {
                const title = btn.getAttribute('data-title') || '';
                const price = btn.getAttribute('data-price') || '15.99';
                if (typeof bookMovie === 'function') {
                    bookMovie(title, price);
                } else {
                    const encoded = encodeURIComponent(title);
                    window.location.href = `/create-booking?movieName=${encoded}&price=${price}`;
                }
            }
        });

        const ratings = JSON.parse(sessionStorage.getItem('movieRatings') || '{}');
        document.querySelectorAll('.movie-rating').forEach(el => {
            const key = el.getAttribute('data-movie-id') || el.getAttribute('data-movie-title');
            if (!key) return;
            if (!ratings[key]) {
                const val = Math.round((3.5 + Math.random() * 1.5) * 10) / 10;
                ratings[key] = val.toFixed(1);
            }
            const span = el.querySelector('.rating-value');
            if (span) span.textContent = ratings[key];
        });
        sessionStorage.setItem('movieRatings', JSON.stringify(ratings));

        const movieCards = document.querySelectorAll('.movie-card');
        movieCards.forEach((card, index) => {
            card.style.animationDelay = `${index * 0.1}s`;
            card.classList.add('animate-fade-in-up');
        });
    });

    const style = document.createElement('style');
    style.textContent = `
    @keyframes fade-in-up {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    .animate-fade-in-up {
        animation: fade-in-up 0.6s ease-out forwards;
    }
    .line-clamp-2 {
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }
`;
    document.head.appendChild(style);
</script>
<script src="/js/index.js"></script>
</body>
</html>
