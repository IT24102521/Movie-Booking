<!-- Carousel Enhancement Script -->

    document.addEventListener('DOMContentLoaded', function() {
    const carousel = document.getElementById('movieCarousel');
    const carouselInner = carousel.querySelector('.carousel-inner');
    const indicatorsContainer = carousel.querySelector('.carousel-indicators');

    // Function to update indicators
    function updateIndicators() {
    indicatorsContainer.innerHTML = '';
    const items = carouselInner.querySelectorAll('.carousel-item');

    items.forEach((item, index) => {
    const indicator = document.createElement('button');
    indicator.type = 'button';
    indicator.setAttribute('data-bs-target', '#movieCarousel');
    indicator.setAttribute('data-bs-slide-to', index);
    indicator.setAttribute('aria-label', `Slide ${index + 1}`);

    if (item.classList.contains('active')) {
    indicator.classList.add('active');
    indicator.setAttribute('aria-current', 'true');
}

    indicatorsContainer.appendChild(indicator);
});
}

    // Function to handle image sizing
    function handleImageSizing() {
    const carouselItems = carouselInner.querySelectorAll('.carousel-item');

    carouselItems.forEach(item => {
    const img = item.querySelector('img');

    // Reset styles first
    img.style.width = '';
    img.style.height = '';

    // Maintain aspect ratio while fitting container
    const containerRatio = carousel.clientWidth / carousel.clientHeight;
    const imageRatio = img.naturalWidth / img.naturalHeight;

    if (imageRatio > containerRatio) {
    img.style.width = '100%';
    img.style.height = 'auto';
} else {
    img.style.width = 'auto';
    img.style.height = '100%';
}
});
}

    // Initialize carousel
    const bsCarousel = new bootstrap.Carousel(carousel, {
    interval: 5000,
    wrap: true,
    touch: true
});

    // Update when images load
    carouselInner.querySelectorAll('img').forEach(img => {
    img.onload = function() {
    handleImageSizing();
};
    if (img.complete) img.onload();
});

    // Initial setup
    updateIndicators();
    handleImageSizing();

    // Handle window resize
    window.addEventListener('resize', handleImageSizing);

    // Auto-update when slides are added dynamically
    const observer = new MutationObserver(function(mutations) {
    updateIndicators();
    handleImageSizing();
});

    observer.observe(carouselInner, { childList: true, subtree: true });
});
