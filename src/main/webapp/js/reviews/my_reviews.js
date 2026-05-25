const reviewsUserApi = "/api/reviews";

window.scrollTo({ top: 0, behavior: "auto" });

function getCurrentUserEmail() {
    return localStorage.getItem("movieUserEmail") || localStorage.getItem("email") || "";
}

function syncNavbarAuthState() {
    const loginBtn = document.getElementById("login-tag");
    const myBookingsBtn = document.getElementById("my-bookings-tag");
    const profileBtn = document.getElementById("profile-tag");

    if (!loginBtn || !myBookingsBtn || !profileBtn) {
        return;
    }

    if (localStorage.getItem("movieUserId")) {
        loginBtn.classList.add("hidden");
        myBookingsBtn.classList.remove("hidden");
        profileBtn.classList.remove("hidden");
    } else {
        loginBtn.classList.remove("hidden");
        myBookingsBtn.classList.add("hidden");
        profileBtn.classList.add("hidden");
    }
}

const container = document.getElementById("reviewsContainer");
const loading = document.getElementById("loading");
const reviewsCount = document.getElementById("reviewsCount");
const averageRating = document.getElementById("averageRating");

function formatDate(value) {
    if (!value) return "Unknown date";
    const date = new Date(value);
    if (Number.isNaN(date.getTime())) {
        return value;
    }
    return date.toLocaleDateString(undefined, {
        year: "numeric",
        month: "short",
        day: "numeric"
    });
}

function renderReviews(list) {
    loading.style.display = "none";
    container.innerHTML = "";

    reviewsCount.textContent = String(list.length);
    const avg = list.length === 0 ? 0 : list.reduce((sum, item) => sum + Number(item.rating || 0), 0) / list.length;
    averageRating.textContent = avg.toFixed(1);

    if (list.length === 0) {
        container.innerHTML = `
            <div class="md:col-span-2 xl:col-span-3 rounded-3xl border border-dashed border-white/15 bg-gray-800/60 px-8 py-16 text-center">
                <i class="fas fa-comments text-5xl text-gray-500"></i>
                <h2 class="mt-4 text-2xl font-bold text-white">No reviews yet</h2>
                <p class="mt-3 text-gray-300">Write your first review to start building your movie history and manage it here.</p>
            </div>`;
        return;
    }

    list.forEach(review => {
        const card = document.createElement("div");
        card.className = "rounded-2xl border border-white/10 bg-gray-950/85 p-6 shadow-xl shadow-black/25";

        card.innerHTML = `
            <div class="flex items-start justify-between gap-4">
                <div>
                    <p class="text-xs uppercase tracking-[0.3em] text-red-200">Review</p>
                    <h3 class="mt-3 text-2xl font-bold text-white">${review.movieName || "Untitled movie"}</h3>
                </div>
                <div class="rounded-full bg-yellow-400/20 px-3 py-1 text-sm font-semibold text-yellow-100">
                    <i class="fas fa-star mr-1"></i>
                    ${review.rating || 0} / 5
                </div>
            </div>

            <p class="mt-5 text-gray-200 leading-relaxed">${review.comment || "No comment provided."}</p>

            <div class="mt-6 flex flex-wrap items-center gap-3 text-sm text-gray-300">
                <span class="inline-flex items-center gap-2 rounded-full bg-white/5 px-3 py-1">
                    <i class="fas fa-user"></i>
                    ${review.userEmail || "Guest"}
                </span>
                <span class="inline-flex items-center gap-2 rounded-full bg-white/5 px-3 py-1">
                    <i class="fas fa-calendar-alt"></i>
                    ${formatDate(review.createdAt)}
                </span>
            </div>

            <div class="mt-6 flex flex-wrap gap-3">
                <a href="/reviews/edit?id=${review.id}" class="inline-flex items-center gap-2 rounded-full bg-blue-600 px-4 py-2 text-sm font-semibold text-white transition hover:bg-blue-500">
                    <i class="fas fa-pen"></i>
                    Edit
                </a>
                <button data-id="${review.id}" class="delete-review inline-flex items-center gap-2 rounded-full bg-red-600 px-4 py-2 text-sm font-semibold text-white transition hover:bg-red-700">
                    <i class="fas fa-trash"></i>
                    Delete
                </button>
            </div>`;

        container.appendChild(card);
    });

    document.querySelectorAll(".delete-review").forEach(button => {
        button.addEventListener("click", async () => {
            const id = button.getAttribute("data-id");
            if (!confirm("Delete this review?")) return;

            try {
                await fetch(`${reviewsUserApi}/${id}`, { method: "DELETE" });
                const email = getCurrentUserEmail();
                if (email) {
                    loadMyReviews(email);
                } else {
                    renderReviews([]);
                }
            } catch (error) {
                console.error("Failed to delete review", error);
                alert("Unable to delete the review right now.");
            }
        });
    });
}

async function loadMyReviews(email) {
    try {
        const res = await fetch(`${reviewsUserApi}/user/${encodeURIComponent(email)}`);
        const list = await res.json();
        renderReviews(Array.isArray(list) ? list : []);
    } catch (error) {
        console.error("Failed to load user reviews", error);
        loading.style.display = "none";
        container.innerHTML = `
            <div class="md:col-span-2 xl:col-span-3 rounded-3xl border border-dashed border-white/15 bg-gray-800/60 px-8 py-16 text-center">
                <i class="fas fa-exclamation-triangle text-5xl text-amber-400"></i>
                <h2 class="mt-4 text-2xl font-bold text-white">Unable to load your reviews</h2>
                <p class="mt-3 text-gray-300">Please refresh the page and try again.</p>
            </div>`;
    }
}

document.addEventListener("DOMContentLoaded", () => {
    syncNavbarAuthState();

    const email = getCurrentUserEmail();

    if (!email) {
        loading.style.display = "none";
        container.innerHTML = `
            <div class="md:col-span-2 xl:col-span-3 rounded-3xl border border-dashed border-white/15 bg-gray-800/60 px-8 py-16 text-center">
                <i class="fas fa-lock text-5xl text-gray-500"></i>
                <h2 class="mt-4 text-2xl font-bold text-white">Sign in to manage your reviews</h2>
                <p class="mt-3 text-gray-300">Log in to see the reviews you’ve written and edit or delete them from here.</p>
                <div class="mt-6 flex justify-center gap-3">
                    <a href="/login" class="rounded-full bg-red-600 px-5 py-3 font-semibold text-white transition hover:bg-red-700">Go to login</a>
                    <a href="/reviews" class="rounded-full border border-white/15 px-5 py-3 font-semibold text-white transition hover:border-red-400 hover:bg-red-600/10">Browse public reviews</a>
                </div>
            </div>`;
        reviewsCount.textContent = "0";
        averageRating.textContent = "0.0";
        return;
    }

    loadMyReviews(email);
});


