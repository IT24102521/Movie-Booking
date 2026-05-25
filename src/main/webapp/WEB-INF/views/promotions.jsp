<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Promotions</title>
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

<jsp:include page="partials/navbar.jsp" />

<div class="relative bg-gradient-to-r from-red-900/50 to-purple-900/50 py-20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col gap-8 lg:flex-row lg:items-end lg:justify-between">
            <div class="max-w-2xl">
                <p class="mb-3 text-sm uppercase tracking-[0.35em] text-red-200">Current Offers</p>
                <h1 class="text-4xl md:text-5xl font-bold text-white">Unlock savings on your next movie night</h1>
                <p class="mt-4 text-lg text-gray-300">
                    Explore active promotions, save on booking totals, and apply the right code when you check out.
                </p>
            </div>
            <div class="grid gap-3 sm:grid-cols-3 lg:min-w-[380px]">
                <div class="rounded-2xl border border-white/10 bg-gray-950/60 px-4 py-3">
                    <p class="text-sm text-gray-400">Active promos</p>
                    <p class="mt-2 text-2xl font-bold text-white">${empty promotions ? 0 : promotions.size()}</p>
                </div>
                <div class="rounded-2xl border border-white/10 bg-gray-950/60 px-4 py-3">
                    <p class="text-sm text-gray-400">Offer types</p>
                    <p class="mt-2 text-2xl font-bold text-white">${not empty promotions ? 'Multiple' : 'None'}</p>
                </div>
                <div class="rounded-2xl border border-white/10 bg-gray-950/60 px-4 py-3">
                    <p class="text-sm text-gray-400">Use at checkout</p>
                    <p class="mt-2 text-2xl font-bold text-white">Always</p>
                </div>
            </div>
        </div>
    </div>
</div>

<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div class="mb-8 flex flex-wrap items-center justify-between gap-4">
        <div>
            <h2 class="text-2xl font-bold text-white">Available promotions</h2>
            <p class="text-gray-400">Browse the current offers and pick the one that fits your booking.</p>
        </div>
        <div class="inline-flex items-center gap-2 rounded-full border border-red-400/40 bg-red-500/10 px-4 py-2 text-sm text-red-100">
            <i class="fas fa-tags"></i>
            Enter the code during checkout
        </div>
    </div>

    <c:choose>
        <c:when test="${not empty promotions}">
            <div class="grid gap-6 lg:grid-cols-2 xl:grid-cols-3">
                <c:forEach var="promotion" items="${promotions}">
                    <div class="rounded-2xl border border-white/10 bg-gray-800/80 p-6 shadow-xl shadow-black/20">
                        <div class="flex items-start justify-between gap-4">
                            <div>
                                <p class="text-xs uppercase tracking-[0.3em] text-red-200">${promotion.promotionType}</p>
                                <h3 class="mt-3 text-2xl font-bold text-white">${promotion.promotionCode}</h3>
                            </div>
                            <span class="rounded-full bg-emerald-500/20 px-3 py-1 text-sm font-semibold text-emerald-200">Active</span>
                        </div>

                        <div class="mt-5 rounded-2xl border border-red-400/30 bg-gradient-to-br from-red-600/20 to-purple-600/20 p-4">
                            <p class="text-sm text-gray-200">Offer value</p>
                            <p class="mt-2 text-3xl font-bold text-white">
                                <c:choose>
                                    <c:when test="${promotion.valueType eq 'PERCENT'}">${promotion.value}% off</c:when>
                                    <c:when test="${promotion.valueType eq 'FIXED'}">$${promotion.value} off</c:when>
                                    <c:otherwise>Special offer</c:otherwise>
                                </c:choose>
                            </p>
                        </div>

                        <p class="mt-5 text-gray-300 leading-relaxed">${promotion.description}</p>

                        <div class="mt-6 space-y-3 text-sm text-gray-200">
                            <div class="flex items-center gap-3">
                                <span class="inline-flex h-8 w-8 items-center justify-center rounded-full bg-white/5 text-red-200">
                                    <i class="fas fa-calendar-alt"></i>
                                </span>
                                <span>Valid from ${promotion.startDate} to ${promotion.endDate}</span>
                            </div>
                            <div class="flex items-center gap-3">
                                <span class="inline-flex h-8 w-8 items-center justify-center rounded-full bg-white/5 text-purple-200">
                                    <i class="fas fa-ticket-alt"></i>
                                </span>
                                <span>Apply this code at checkout to reduce your total.</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="rounded-3xl border border-dashed border-white/15 bg-gray-800/60 px-8 py-16 text-center">
                <i class="fas fa-tags text-5xl text-gray-500"></i>
                <h3 class="mt-4 text-2xl font-bold text-white">No promotions available right now</h3>
                <p class="mt-3 text-gray-300">Check back later for new discounts and seasonal offers.</p>
            </div>
        </c:otherwise>
    </c:choose>
</main>

<jsp:include page="partials/footer.jsp" />
<script src="/js/index.js"></script>
</body>
</html>