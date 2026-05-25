const readApi = "/api/reviews";

document.addEventListener("DOMContentLoaded", () => {
    loadAll();
    document.getElementById("searchReviews").addEventListener("input", filter);
});

let cached = [];

async function loadAll() {
    try {
        const res = await fetch(readApi);
        cached = await res.json();
        render(cached);
    } catch (e) {
        console.error("Failed to load reviews", e);
        render([]);
    }
}

function formatDate(value) {
    if (!value) return "Unknown date";
    const date = new Date(value);
    if (Number.isNaN(date.getTime())) {
        return value;
    }
    return date.toLocaleString();
}

function render(list) {
    const container = document.getElementById("reviewsContainer");
    const countLabel = document.getElementById("reviewsCountLabel");
    container.innerHTML = "";

    if (list.length === 0) {
        countLabel.textContent = "No reviews found";
        container.innerHTML = `
            <div class="md:col-span-2 rounded-3xl border border-dashed border-white/15 bg-gray-800/60 px-8 py-16 text-center">
                <i class="fas fa-comments text-5xl text-gray-500"></i>
                <h3 class="mt-4 text-2xl font-bold text-white">No reviews match your search</h3>
                <p class="mt-3 text-gray-300">Try another movie title or a different keyword.</p>
            </div>`;
        return;
    }

    countLabel.textContent = `${list.length} review${list.length === 1 ? "" : "s"} available`;

    list.forEach(r => {
        const card = document.createElement("div");
        card.className = "rounded-2xl border border-white/10 bg-gray-800/80 p-6 shadow-xl shadow-black/20";
        card.innerHTML = `
            <div class="flex items-start justify-between gap-4">
                <div>
                    <p class="text-xs uppercase tracking-[0.3em] text-red-200">Community review</p>
                    <h3 class="mt-3 text-2xl font-bold text-white">${r.movieName || "Untitled movie"}</h3>
                </div>
                <div class="rounded-full bg-yellow-400/20 px-3 py-1 text-sm font-semibold text-yellow-100">
                    <i class="fa-solid fa-star mr-1"></i>
                    ${r.rating || 0} / 5
                </div>
            </div>
            <p class="mt-5 text-gray-200 leading-relaxed">${r.comment || "No comment provided."}</p>
            <div class="mt-6 flex flex-wrap items-center gap-3 text-sm text-gray-300">
                <span class="inline-flex items-center gap-2 rounded-full bg-white/5 px-3 py-1">
                    <i class="fas fa-user"></i>
                    ${r.userEmail ? r.userEmail : 'Guest'}
                </span>
                <span class="inline-flex items-center gap-2 rounded-full bg-white/5 px-3 py-1">
                    <i class="fas fa-calendar-alt"></i>
                    ${formatDate(r.createdAt)}
                </span>
            </div>
        `;
        container.appendChild(card);
    });
}

function filter() {
    const term = document.getElementById("searchReviews").value.toLowerCase();
    const filtered = cached.filter(r =>
        (r.movieName && r.movieName.toLowerCase().includes(term)) ||
        (r.comment && r.comment.toLowerCase().includes(term))
    );
    render(filtered);
}
