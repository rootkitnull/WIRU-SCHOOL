document.addEventListener('DOMContentLoaded', () => {
    // Splash screen functionality
    const splashScreen = document.getElementById('splash-screen');
    const mainContent = document.getElementById('main-content');

    // Hide splash screen after 2.5 seconds for faster feel
    setTimeout(() => {
        splashScreen.style.opacity = '0';
        setTimeout(() => {
            splashScreen.style.display = 'none';
            mainContent.classList.remove('hidden');
            mainContent.classList.add('visible');
            initializeGallery();
        }, 500);
    }, 2500);

    function initializeGallery() {
        const gallery = document.getElementById('image-gallery');
        const prevButton = document.getElementById('prev-btn');
        const nextButton = document.getElementById('next-btn');
        const pageInfo = document.getElementById('page-info');
        const aboutBtn = document.getElementById('about-btn');
        const modal = document.getElementById('about-modal');
        const closeBtn = document.querySelector('.close');
        const schoolBtn = document.getElementById('school-btn');
        const wallpaper = document.getElementById('wallpaper');
        const loadingIndicator = document.getElementById('loading-indicator');
        
        // Menu functionality
        const menuBtn = document.getElementById('menu-btn');
        const menuDropdown = document.getElementById('menu-dropdown');

        // Zoom modal elements
        const zoomModal = document.getElementById('zoom-modal');
        const zoomImage = document.getElementById('zoom-image');
        const zoomClose = document.querySelector('.zoom-close');
        const zoomInBtn = document.getElementById('zoom-in');
        const zoomOutBtn = document.getElementById('zoom-out');
        const zoomResetBtn = document.getElementById('zoom-reset');

        // Zoom variables
        let currentZoom = 1;
        let isDragging = false;
        let startX, startY, scrollLeft, scrollTop;
        let currentTranslateX = 0;
        let currentTranslateY = 0;

        // Load wallpaper if exists
        wallpaper.src = 'wallpaper/A.jpg';
        wallpaper.onerror = function() {
            // If wallpaper doesn't exist, use a gradient background
            wallpaper.style.display = 'none';
            document.querySelector('.wallpaper-container').style.background = 'var(--modern-gradient)';
        };

        // Menu dropdown functionality
        menuBtn.addEventListener('click', () => {
            menuDropdown.classList.toggle('active');
        });

        // Close menu when clicking outside
        document.addEventListener('click', (event) => {
            if (!menuBtn.contains(event.target) && !menuDropdown.contains(event.target)) {
                menuDropdown.classList.remove('active');
            }
        });

        // Modal functionality
        aboutBtn.addEventListener('click', () => {
            modal.style.display = 'block';
            menuDropdown.classList.remove('active');
        });

        closeBtn.addEventListener('click', () => {
            modal.style.display = 'none';
        });

        window.addEventListener('click', (event) => {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });

        // School button functionality - redirect to wgatsal.channel
        schoolBtn.addEventListener('click', () => {
            window.open('https://wiru2024-io.vercel.app/', '_blank');
            menuDropdown.classList.remove('active');
        });

        // Check for media files asynchronously
        async function checkMediaFiles() {
            const imageFiles = [];
            const videoFiles = [];

            // Check for images from 1.jpg to 100.jpg
            for (let i = 1; i <= 100; i++) {
                try {
                    const response = await fetch(`files/${i}.jpg`, { method: 'HEAD' });
                    if (response.ok) {
                        imageFiles.push(`${i}.jpg`);
                    }
                } catch (error) {
                    // File doesn't exist, continue
                }
            }

            // Check for videos from A.mp4 to Z.mp4
            const videoLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
            for (let i = 0; i < videoLetters.length; i++) {
                try {
                    const videoName = `${videoLetters[i]}.mp4`;
                    const response = await fetch(`files/${videoName}`, { method: 'HEAD' });
                    if (response.ok) {
                        videoFiles.push(videoName);
                    }
                } catch (error) {
                    // File doesn't exist, continue
                }
            }

            return [...imageFiles, ...videoFiles];
        }

        // Initialize gallery with media files
        checkMediaFiles().then(allMedia => {
            // Hide loading indicator
            loadingIndicator.style.display = 'none';

            // Gallery pagination
            const itemsPerPage = 6;
            let currentPage = 1;
            const totalPages = Math.ceil(allMedia.length / itemsPerPage);

            function displayPage(page) {
                gallery.innerHTML = ''; // Clear previous content
                const startIndex = (page - 1) * itemsPerPage;
                const endIndex = startIndex + itemsPerPage;
                const mediaToShow = allMedia.slice(startIndex, endIndex);

                mediaToShow.forEach(mediaName => {
                    const galleryItem = document.createElement('div');
                    galleryItem.className = 'gallery-item';

                    const fileExtension = mediaName.split('.').pop().toLowerCase();

                    if (fileExtension === 'mp4') {
                        const video = document.createElement('video');
                        video.src = `files/${mediaName}`;
                        video.alt = `Video ${mediaName}`;
                        video.controls = false;
                        video.muted = true;
                        video.loop = true;
                        video.autoplay = true; // Auto-play videos
                        video.loading = 'lazy';

                        // Play video on hover
                        galleryItem.addEventListener('mouseenter', () => {
                            video.play();
                        });

                        galleryItem.addEventListener('mouseleave', () => {
                            video.pause();
                        });

                        galleryItem.appendChild(video);

                        // Add click event for video to play/pause
                        galleryItem.addEventListener('click', (e) => {
                            e.preventDefault();
                            if (video.paused) {
                                video.play();
                            } else {
                                video.pause();
                            }
                        });
                    } else {
                        const img = document.createElement('img');
                        img.src = `files/${mediaName}`;
                        img.alt = `Picture ${mediaName}`;
                        img.loading = 'lazy'; // Lazy load images for performance

                        // Add click event for zoom
                        img.addEventListener('click', () => {
                            openZoomModal(`files/${mediaName}`);
                        });

                        galleryItem.appendChild(img);
                    }

                    gallery.appendChild(galleryItem);
                });

                updatePaginationControls();
            }

            function updatePaginationControls() {
                pageInfo.textContent = `Page ${currentPage} of ${totalPages}`;

                // Show/hide back button based on current page
                if (currentPage === 1) {
                    prevButton.style.display = 'none';
                } else {
                    prevButton.style.display = 'flex';
                }

                // Disable/Enable buttons based on current page
                prevButton.disabled = currentPage === 1;
                nextButton.disabled = currentPage === totalPages || totalPages === 0;
            }

            nextButton.addEventListener('click', () => {
                if (currentPage < totalPages) {
                    currentPage++;
                    displayPage(currentPage);
                }
            });

            prevButton.addEventListener('click', () => {
                if (currentPage > 1) {
                    currentPage--;
                    displayPage(currentPage);
                }
            });

            // Zoom modal functionality
            function openZoomModal(imageSrc) {
                zoomImage.src = imageSrc;
                zoomModal.style.display = 'block';
                currentZoom = 1;
                currentTranslateX = 0;
                currentTranslateY = 0;
                updateZoom();
            }

            function closeZoomModal() {
                zoomModal.style.display = 'none';
                currentZoom = 1;
                currentTranslateX = 0;
                currentTranslateY = 0;
                updateZoom();
            }

            function updateZoom() {
                zoomImage.style.transform = `translate(${currentTranslateX}px, ${currentTranslateY}px) scale(${currentZoom})`;
            }

            // Zoom controls
            zoomInBtn.addEventListener('click', () => {
                currentZoom = Math.min(currentZoom + 0.5, 3);
                updateZoom();
            });

            zoomOutBtn.addEventListener('click', () => {
                currentZoom = Math.max(currentZoom - 0.5, 0.5);
                updateZoom();
            });

            zoomResetBtn.addEventListener('click', () => {
                currentZoom = 1;
                currentTranslateX = 0;
                currentTranslateY = 0;
                updateZoom();
            });

            zoomClose.addEventListener('click', closeZoomModal);

            window.addEventListener('click', (event) => {
                if (event.target === zoomModal) {
                    closeZoomModal();
                }
            });

            // Image dragging functionality for zoomed images
            zoomImage.addEventListener('mousedown', (e) => {
                if (currentZoom > 1) {
                    isDragging = true;
                    zoomImage.style.cursor = 'grabbing';
                    startX = e.pageX - currentTranslateX;
                    startY = e.pageY - currentTranslateY;
                    e.preventDefault();
                }
            });

            document.addEventListener('mouseup', () => {
                isDragging = false;
                if (zoomImage) {
                    zoomImage.style.cursor = currentZoom > 1 ? 'move' : 'default';
                }
            });

            document.addEventListener('mousemove', (e) => {
                if (!isDragging) return;
                e.preventDefault();

                const x = e.pageX - startX;
                const y = e.pageY - startY;

                currentTranslateX = x;
                currentTranslateY = y;

                updateZoom();
            });

            // Handle touch events for mobile
            let touchStartX = 0;
            let touchStartY = 0;

            zoomImage.addEventListener('touchstart', (e) => {
                if (currentZoom > 1 && e.touches.length === 1) {
                    isDragging = true;
                    touchStartX = e.touches[0].pageX - currentTranslateX;
                    touchStartY = e.touches[0].pageY - currentTranslateY;
                    e.preventDefault();
                }
            });

            zoomImage.addEventListener('touchmove', (e) => {
                if (!isDragging || e.touches.length !== 1) return;
                e.preventDefault();

                const x = e.touches[0].pageX - touchStartX;
                const y = e.touches[0].pageY - touchStartY;

                currentTranslateX = x;
                currentTranslateY = y;

                updateZoom();
            });

            zoomImage.addEventListener('touchend', () => {
                isDragging = false;
            });

            // Initial display
            if (allMedia.length > 0) {
                displayPage(currentPage);
            } else {
                gallery.innerHTML = '<p>No media found in the /files directory. Please add some .jpg files (1.jpg to 100.jpg) or .mp4 files (A.mp4 to Z.mp4).</p>';
                pageInfo.textContent = 'Page 0 of 0';
                prevButton.style.display = 'none';
                nextButton.disabled = true;
            }
        }).catch(error => {
            console.error('Error loading media files:', error);
            loadingIndicator.style.display = 'none';
            gallery.innerHTML = '<p>Error loading media files. Please check your files directory.</p>';
        });
    }
});
