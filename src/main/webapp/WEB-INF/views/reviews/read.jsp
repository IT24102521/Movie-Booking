<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Read Reviews</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-900 text-white min-h-screen">
<jsp:include page="../partials/navbar.jsp" />

<div class="relative bg-gradient-to-r from-red-900/50 to-purple-900/50 py-20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col gap-6 lg:flex-row lg:items-end lg:justify-between">
            <div class="max-w-2xl">
                <p class="mb-3 text-sm uppercase tracking-[0.35em] text-red-200">Community Voices</p>
                <h1 class="text-4xl md:text-5xl font-bold text-white">Read reviews from movie lovers</h1>
                <p class="mt-4 text-lg text-gray-300">
                    Discover what others are saying, search by movie title or comment, and find your next favorite film faster.
                </p>
            </div>
            <div class="flex flex-wrap gap-3">
                <a href="/reviews/create" class="inline-flex items-center gap-2 rounded-full bg-red-600 px-5 py-3 font-semibold text-white transition hover:bg-red-700">
                    <i class="fas fa-pen"></i>
                    Write a Review
                </a>
                <a href="/" class="inline-flex items-center gap-2 rounded-full border border-white/20 px-5 py-3 font-semibold text-white transition hover:border-red-400 hover:bg-red-600/10">
                    <i class="fas fa-home"></i>
                    Back to Home
                </a>
            </div>
        </div>
    </div>
</div>

<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div class="mb-8 flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between">
        <div>
            <h2 class="text-2xl font-bold text-white">Browse the latest reviews</h2>
            <p class="text-gray-400">Use the search bar below to filter reviews by movie title or comment text.</p>
        </div>
        <div class="flex items-center gap-3 rounded-full border border-white/10 bg-gray-950/60 px-4 py-3 w-full max-w-xl">
            <i class="fas fa-search text-gray-400"></i>
            <input id="searchReviews" placeholder="Search by movie or text" class="w-full bg-transparent text-white placeholder-gray-500 outline-none"/>
        </div>
    </div>

    <div class="mb-4 flex items-center justify-between text-sm text-gray-300">
        <span id="reviewsCountLabel">Loading reviews...</span>
        <span class="inline-flex items-center gap-2 rounded-full border border-white/10 bg-gray-950/60 px-3 py-1">
            <i class="fas fa-star text-yellow-400"></i>
            Community feedback
        </span>
    </div>

    <div id="reviewsContainer" class="grid grid-cols-1 md:grid-cols-2 gap-6"></div>
</main>

<script src="/js/reviews/read.js"></script>
<script src="/js/index.js"></script>
</body>
</html>


