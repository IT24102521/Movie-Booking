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

window.scrollTo({ top: 0, behavior: "auto" });

document.addEventListener("DOMContentLoaded", async () => {
    syncNavbarAuthState();

    const container = document.getElementById("bookings-container");
    const loading = document.getElementById("loading");
    const bookingsCount = document.getElementById("bookingsCount");
    const activeBookingsCount = document.getElementById("activeBookingsCount");

    const userEmail = localStorage.getItem("email") || localStorage.getItem("movieUserEmail");

    if (!userEmail) {
        loading.style.display = "none";
        container.innerHTML = `
            <div class="md:col-span-2 xl:col-span-3 rounded-3xl border border-dashed border-white/15 bg-gray-800/60 px-8 py-16 text-center">
                <i class="fas fa-lock text-5xl text-gray-500"></i>
                <h2 class="mt-4 text-2xl font-bold text-white">Sign in to view your bookings</h2>
                <p class="mt-3 text-gray-300">Log in to access your reserved tickets, receipts, and cancellation options.</p>
                <div class="mt-6 flex justify-center gap-3">
                    <a href="/login" class="rounded-full bg-red-600 px-5 py-3 font-semibold text-white transition hover:bg-red-700">Go to login</a>
                    <a href="/browse-movies" class="rounded-full border border-white/15 px-5 py-3 font-semibold text-white transition hover:border-red-400 hover:bg-red-600/10">Browse movies</a>
                </div>
            </div>`;
        bookingsCount.textContent = "0";
        activeBookingsCount.textContent = "0";
        return;
    }

    try {
        const response = await fetch(`/api/bookings/email/${encodeURIComponent(userEmail)}`);
        const bookings = await response.json();

        loading.style.display = "none";
        bookingsCount.textContent = String(bookings.length);
        activeBookingsCount.textContent = String(bookings.filter(booking => booking.status && booking.status.toLowerCase() !== "cancelled").length);

        if (!Array.isArray(bookings) || bookings.length === 0) {
            container.innerHTML = `
                <div class="md:col-span-2 xl:col-span-3 rounded-3xl border border-dashed border-white/15 bg-gray-800/60 px-8 py-16 text-center">
                    <i class="fas fa-ticket-alt text-5xl text-gray-500"></i>
                    <h2 class="mt-4 text-2xl font-bold text-white">No bookings yet</h2>
                    <p class="mt-3 text-gray-300">Reserve a movie to see your booking details and manage them here.</p>
                </div>`;
            return;
        }

        bookings.forEach(booking => {
            const card = document.createElement("div");
            card.className = "rounded-2xl border border-white/10 bg-gray-950/85 p-6 shadow-xl shadow-black/25";
            const isCancelled = String(booking.status || "").toLowerCase() === "cancelled";
            const seats = Array.isArray(booking.seats) && booking.seats.length > 0
                ? booking.seats.map(seat => `${seat.rowNumber || ""}${seat.seatNumber || ""}`).join(", ")
                : "Not assigned";

            card.innerHTML = `
                <div class="flex items-start justify-between gap-4">
                    <div>
                        <p class="text-xs uppercase tracking-[0.3em] text-red-200">Booking</p>
                        <h3 class="mt-3 text-2xl font-bold text-white">${booking.movieName || "Untitled movie"}</h3>
                    </div>
                    <span class="rounded-full px-3 py-1 text-sm font-semibold ${isCancelled ? 'bg-rose-500/20 text-rose-100' : 'bg-emerald-500/20 text-emerald-100'}">
                        ${isCancelled ? 'Cancelled' : booking.status || 'Active'}
                    </span>
                </div>

                <div class="mt-5 space-y-3 text-sm text-gray-200">
                    <div class="flex items-center justify-between gap-4">
                        <span class="text-gray-400">Booking ID</span>
                        <span class="font-semibold text-white">${booking.id ?? 'N/A'}</span>
                    </div>
                    <div class="flex items-center justify-between gap-4">
                        <span class="text-gray-400">Payment</span>
                        <span class="font-semibold text-white">${booking.paymentStatus || 'Pending'}</span>
                    </div>
                    <div class="flex items-center justify-between gap-4">
                        <span class="text-gray-400">Total</span>
                        <span class="font-semibold text-white">$${Number(booking.totalPayment || 0).toFixed(2)}</span>
                    </div>
                    <div class="flex items-start justify-between gap-4">
                        <span class="text-gray-400">Seats</span>
                        <span class="text-right font-semibold text-white">${seats}</span>
                    </div>
                </div>

                <div class="mt-6 flex flex-wrap items-center gap-3">
                    ${booking.receiptUrl ? `<a href="${booking.receiptUrl}" target="_blank" class="inline-flex items-center gap-2 rounded-full border border-white/10 px-4 py-2 text-sm font-semibold text-white transition hover:border-red-400 hover:bg-red-600/10"><i class="fas fa-receipt"></i> View receipt</a>` : '<span class="inline-flex items-center gap-2 rounded-full bg-white/5 px-4 py-2 text-sm text-gray-300"><i class="fas fa-receipt"></i> Receipt unavailable</span>'}
                    ${isCancelled ? '<span class="inline-flex items-center gap-2 rounded-full bg-gray-700/80 px-4 py-2 text-sm font-semibold text-gray-100"><i class="fas fa-ban"></i> Cancellation unavailable</span>' : `<button data-id="${booking.id}" class="cancel-btn inline-flex items-center gap-2 rounded-full bg-red-600 px-4 py-2 text-sm font-semibold text-white transition hover:bg-red-700"><i class="fas fa-times"></i> Cancel</button>`}
                </div>`;

            container.appendChild(card);
        });

        document.querySelectorAll(".cancel-btn").forEach(btn => {
            btn.addEventListener("click", async () => {
                const id = btn.getAttribute("data-id");

                if (!confirm("Are you sure you want to cancel this booking?")) return;

                try {
                    const res = await fetch(`/api/bookings/${id}/status`, {
                        method: "PATCH",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify({ status: "CANCELLED" })
                    });

                    if (!res.ok) {
                        alert("Failed to cancel booking.");
                        return;
                    }

                    const card = btn.closest("div");
                    btn.remove();
                    const badge = card.querySelector("span.rounded-full");
                    if (badge) {
                        badge.className = "rounded-full px-3 py-1 text-sm font-semibold bg-rose-500/20 text-rose-100";
                        badge.textContent = "Cancelled";
                    }
                    const actionWrap = card.querySelector("div.mt-6");
                    if (actionWrap) {
                        actionWrap.innerHTML = '<span class="inline-flex items-center gap-2 rounded-full bg-gray-700/80 px-4 py-2 text-sm font-semibold text-gray-100"><i class="fas fa-ban"></i> Cancellation unavailable</span>';
                    }
                    activeBookingsCount.textContent = String(Math.max(0, Number(activeBookingsCount.textContent) - 1));
                    alert("Booking cancelled successfully!");
                } catch (err) {
                    console.error(err);
                    alert("Error while cancelling booking.");
                }
            });
        });
    } catch (err) {
        console.error(err);
        loading.style.display = "none";
        container.innerHTML = `
            <div class="md:col-span-2 xl:col-span-3 rounded-3xl border border-dashed border-white/15 bg-gray-800/60 px-8 py-16 text-center">
                <i class="fas fa-exclamation-triangle text-5xl text-amber-400"></i>
                <h2 class="mt-4 text-2xl font-bold text-white">Unable to load bookings</h2>
                <p class="mt-3 text-gray-300">Please refresh the page or try again in a moment.</p>
            </div>`;
    }
});
