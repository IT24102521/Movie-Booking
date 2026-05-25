const reviewsApiBase = "/api/reviews";
const userEmailInput = document.getElementById("userEmail");
const savedUserEmail = localStorage.getItem("movieUserEmail") || localStorage.getItem("email");

if (savedUserEmail && userEmailInput && !userEmailInput.value) {
    userEmailInput.value = savedUserEmail;
}

document.getElementById("createReviewForm").addEventListener("submit", async (e) => {
    e.preventDefault();
    const emailVal = userEmailInput.value;
    const payload = {
        movieName: document.getElementById("movieName").value,
        userEmail: emailVal && emailVal.length > 0 ? emailVal : savedUserEmail,
        rating: parseInt(document.getElementById("rating").value, 10),
        comment: document.getElementById("comment").value
    };
    try {
        const response = await fetch(reviewsApiBase, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(payload)
        });

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(errorText || "Unable to save review");
        }

        if (payload.userEmail) {
            localStorage.setItem("movieUserEmail", payload.userEmail);
        }

        window.location.href = "/my-reviews";
    } catch (e) {
        console.error("Failed to create review", e);
        alert(e.message || "Failed to create review");
    }
});


