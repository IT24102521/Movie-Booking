<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Reviews</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap');
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>
<body class="min-h-screen bg-gray-900 text-white">
<jsp:include page="../partials/navbar.jsp"/>

<div class="relative bg-gradient-to-r from-red-900/50 to-purple-900/50 pt-24 pb-20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col gap-8 lg:flex-row lg:items-end lg:justify-between">
            <div class="max-w-2xl">
                <p class="mb-3 text-sm uppercase tracking-[0.35em] text-red-200">Your feedback</p>
                <h1 class="text-4xl md:text-5xl font-bold text-white">My Reviews</h1>
                <p class="mt-4 text-lg text-gray-300">
                    Keep track of the reviews you’ve written, edit them anytime, and manage your movie opinions in one place.
                </p>
            </div>
            <div class="flex flex-wrap gap-3">
                <a href="/" class="inline-flex items-center gap-2 rounded-full border border-white/15 bg-white/5 px-5 py-3 font-semibold text-white transition hover:border-red-400 hover:bg-red-600/10">
                    <i class="fas fa-home"></i>
                    Back to home
                </a>
                <a href="/reviews/create" class="inline-flex items-center gap-2 rounded-full bg-red-600 px-5 py-3 font-semibold text-white transition hover:bg-red-700">
                    <i class="fas fa-pen"></i>
                    Write a review
                </a>
            </div>
        </div>

        <div class="mt-8 grid gap-4 sm:grid-cols-3">
            <div class="rounded-2xl border border-white/10 bg-gray-950/60 px-5 py-4 backdrop-blur-sm">
                <p class="text-sm text-gray-300">Reviews saved</p>
                <p id="reviewsCount" class="mt-2 text-2xl font-bold text-white">0</p>
            </div>
            <div class="rounded-2xl border border-white/10 bg-gray-950/60 px-5 py-4 backdrop-blur-sm">
                <p class="text-sm text-gray-300">Average rating</p>
                <p id="averageRating" class="mt-2 text-2xl font-bold text-yellow-200">0.0</p>
            </div>
            <div class="rounded-2xl border border-white/10 bg-gray-950/60 px-5 py-4 backdrop-blur-sm">
                <p class="text-sm text-gray-300">Quick actions</p>
                <p class="mt-2 text-sm text-gray-200">Edit, delete, and keep your review list up to date.</p>
            </div>
        </div>
    </div>
</div>

<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div id="loading" class="grid gap-6 md:grid-cols-2 xl:grid-cols-3">
        <div class="rounded-2xl border border-white/10 bg-white/5 p-6 animate-pulse">
            <div class="h-4 w-28 rounded bg-white/10"></div>
            <div class="mt-4 h-5 w-2/3 rounded bg-white/10"></div>
            <div class="mt-6 h-3 w-full rounded bg-white/10"></div>
            <div class="mt-3 h-3 w-5/6 rounded bg-white/10"></div>
        </div>
        <div class="rounded-2xl border border-white/10 bg-white/5 p-6 animate-pulse">
            <div class="h-4 w-28 rounded bg-white/10"></div>
            <div class="mt-4 h-5 w-2/3 rounded bg-white/10"></div>
            <div class="mt-6 h-3 w-full rounded bg-white/10"></div>
            <div class="mt-3 h-3 w-5/6 rounded bg-white/10"></div>
        </div>
        <div class="rounded-2xl border border-white/10 bg-white/5 p-6 animate-pulse"></div>
    </div>

    <div id="reviewsContainer" class="mt-8 grid gap-6 md:grid-cols-2 xl:grid-cols-3"></div>
</main>

<script src="/js/reviews/my_reviews.js"></script>
<jsp:include page="../partials/footer.jsp" />
<script src="/js/index.js"></script>
</body>
</html>


