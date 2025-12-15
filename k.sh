#!/bin/bash

# --- Picture Gallery Setup Script ---
# This script creates a beautiful, mobile-friendly image gallery with dark gamer theme.

echo "🎮 Starting WIRU CLASS OF 2024 Gallery Setup..."

# 1. Create the necessary directories
echo "📁 Creating directories..."
mkdir -p files wallpaper

echo "✅ Directories created successfully."

# 2. Create the main HTML file
echo "📄 Creating index.html..."
cat << 'EOF' > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WIRU CLASS OF 2024 WEB</title>
    <link rel="stylesheet" href="style.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- Preload critical resources for faster loading -->
    <link rel="preload" href="script.js" as="script">
</head>
<body>
    <!-- Splash Screen -->
    <div id="splash-screen" class="splash-screen">
        <div class="splash-logo">
            <div class="logo-text">WIRU CLASS OF 2024 WEB</div>
            <div class="loading-bar">
                <div class="loading-progress"></div>
            </div>
        </div>
    </div>

    <!-- Main Content (Initially Hidden) -->
    <div id="main-content" class="main-content hidden">
        <!-- Sliding Text Banner -->
        <div class="text-banner">
            <div class="sliding-text">THIS WEB WAS DEVELOPED BY VIKI</div>
        </div>

        <!-- Modern Menu Button -->
        <div class="menu-container">
            <button id="menu-btn" class="menu-btn">
                <i class="fas fa-bars"></i>
            </button>
            <div id="menu-dropdown" class="menu-dropdown">
                <button id="about-btn" class="menu-item">
                    <i class="fas fa-info-circle"></i> About
                </button>
                <button id="school-btn" class="menu-item">
                    <i class="fas fa-graduation-cap"></i> School
                </button>
            </div>
        </div>

        <div class="wallpaper-container">
            <img id="wallpaper" src="" alt="Wallpaper">
            <div class="overlay"></div>
        </div>

        <header>
            <div class="header-content">
                <h1 class="title">GAMER ARCHIVE</h1>
            </div>
        </header>

        <div id="about-modal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <div class="about-info">
                    <div class="info-box">
                        <strong>CREATED BY</strong>
                        <p>Gamer Name</p>
                    </div>
                    <div class="info-box">
                        <strong>CREATED FOR</strong>
                        <p>Gaming Showcase</p>
                    </div>
                    <div class="info-box">
                        <strong>CREATED WHY?</strong>
                        <p>To showcase epic gaming moments.</p>
                    </div>
                    <div class="info-box date-box">
                         <strong>CREATED ON 🎮</strong>
                        <p>2024-05-21</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Image Zoom Modal -->
        <div id="zoom-modal" class="modal">
            <div class="zoom-content">
                <span class="zoom-close">&times;</span>
                <img id="zoom-image" src="" alt="Zoomed Image">
                <div class="zoom-controls">
                    <button id="zoom-out" class="zoom-btn"><i class="fas fa-search-minus"></i></button>
                    <button id="zoom-reset" class="zoom-btn"><i class="fas fa-compress"></i></button>
                    <button id="zoom-in" class="zoom-btn"><i class="fas fa-search-plus"></i></button>
                </div>
            </div>
        </div>

        <main>
            <!-- Loading Indicator -->
            <div id="loading-indicator" class="loading-indicator">
                <div class="loading-circle">
                    <div class="circle"></div>
                    <div class="circle"></div>
                    <div class="circle"></div>
                </div>
                <div class="loading-text">Loading</div>
            </div>

            <div id="image-gallery" class="gallery-grid">
                <!-- Images and videos will be dynamically inserted here by JavaScript -->
            </div>

            <div class="pagination-controls">
                <button id="prev-btn" class="pagination-btn prev-btn" style="display: none;">
                    <i class="fa-solid fa-chevron-left"></i> Previous Page
                </button>
                <span id="page-info"></span>
                <button id="next-btn" class="pagination-btn next-btn">
                    Next Page <i class="fa-solid fa-chevron-right"></i>
                </button>
            </div>
        </main>

        <footer>
            <a href="https://t.me/rootkitnull" target="_blank" title="Contact on Telegram">
                <i class="fa-brands fa-telegram"></i>
            </a>
            <a href="https://wa.me/44753575273" target="_blank" title="Contact on WhatsApp">
                <i class="fa-brands fa-whatsapp"></i>
            </a>
            <p>&copy; 2024 Gamer Archive. All Rights Reserved.</p>
        </footer>
    </div>

    <script src="script.js"></script>
</body>
</html>
EOF

# 3. Create the CSS file for styling
echo "🎨 Creating style.css..."
cat << 'EOF' > style.css
:root {
    --primary-color: #121212;
    --secondary-color: #8B0000;
    --accent-color: #FF4500;
    --tertiary-color: #9400D3;
    --background-color: #0a0a0a;
    --text-color: #e0e0e0;
    --box-bg-color: rgba(20, 20, 20, 0.8);
    --shadow: 0 4px 8px rgba(0,0,0,0.5);
    --glow: 0 0 10px var(--accent-color);
    --gradient: linear-gradient(135deg, var(--secondary-color), var(--tertiary-color));
    --modern-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    --modern-accent: #667eea;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: var(--background-color);
    color: var(--text-color);
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    overflow-x: hidden;
}

/* Splash Screen Styles */
.splash-screen {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: var(--modern-gradient);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
    transition: opacity 0.5s ease-out;
}

.splash-logo {
    text-align: center;
}

.logo-text {
    background: linear-gradient(45deg, #fff, #f0f0f0);
    color: #333;
    padding: 15px 30px;
    border-radius: 30px;
    font-weight: bold;
    font-size: 2rem;
    text-transform: uppercase;
    letter-spacing: 2px;
    box-shadow: 0 0 20px rgba(255, 255, 255, 0.3);
    animation: pulse 2s infinite, float 3s ease-in-out infinite;
    margin-bottom: 30px;
}

.loading-bar {
    width: 300px;
    height: 10px;
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: 5px;
    overflow: hidden;
}

.loading-progress {
    height: 100%;
    width: 0;
    background: linear-gradient(90deg, #fff, #f0f0f0);
    animation: loading 2.5s ease-out forwards;
}

@keyframes loading {
    0% { width: 0; }
    100% { width: 100%; }
}

@keyframes float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-20px); }
}

@keyframes pulse {
    0% { box-shadow: 0 0 20px rgba(255, 255, 255, 0.3); }
    50% { box-shadow: 0 0 30px rgba(255, 255, 255, 0.5), 0 0 40px rgba(255, 255, 255, 0.3); }
    100% { box-shadow: 0 0 20px rgba(255, 255, 255, 0.3); }
}

/* Main Content Styles */
.main-content {
    opacity: 0;
    transition: opacity 0.5s ease-in;
}

.main-content.visible {
    opacity: 1;
}

.main-content.hidden {
    display: none;
}

/* Modern Menu Button */
.menu-container {
    position: fixed;
    top: 20px;
    left: 20px;
    z-index: 100;
}

.menu-btn {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: var(--modern-gradient);
    border: none;
    color: white;
    font-size: 1.5rem;
    cursor: pointer;
    box-shadow: var(--shadow);
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
}

.menu-btn:hover {
    transform: scale(1.1);
    box-shadow: 0 0 15px rgba(102, 126, 234, 0.7);
}

.menu-dropdown {
    position: absolute;
    top: 60px;
    left: 0;
    background: rgba(30, 30, 30, 0.95);
    border-radius: 10px;
    box-shadow: var(--shadow);
    overflow: hidden;
    opacity: 0;
    visibility: hidden;
    transform: translateY(-10px);
    transition: all 0.3s ease;
    min-width: 150px;
}

.menu-dropdown.active {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}

.menu-item {
    display: flex;
    align-items: center;
    width: 100%;
    padding: 12px 15px;
    background: transparent;
    border: none;
    color: var(--text-color);
    cursor: pointer;
    transition: all 0.2s ease;
    font-size: 1rem;
}

.menu-item i {
    margin-right: 10px;
    color: var(--modern-accent);
}

.menu-item:hover {
    background: rgba(102, 126, 234, 0.2);
}

/* Loading Indicator */
.loading-indicator {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 3rem;
    color: var(--text-color);
    text-align: center;
}

.loading-circle {
    display: flex;
    gap: 15px;
    margin-bottom: 20px;
}

.circle {
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background: var(--modern-gradient);
    animation: circleAnimation 1.5s infinite ease-in-out;
}

.circle:nth-child(1) { animation-delay: -0.32s; }
.circle:nth-child(2) { animation-delay: -0.16s; }
.circle:nth-child(3) { animation-delay: 0s; }

@keyframes circleAnimation {
    0%, 80%, 100% {
        transform: scale(0.8);
        opacity: 0.5;
    }
    40% {
        transform: scale(1.2);
        opacity: 1;
    }
}

.loading-text {
    font-size: 1.5rem;
    color: var(--modern-accent);
    text-shadow: 0 0 5px var(--modern-accent);
    animation: textPulse 1.5s infinite;
}

@keyframes textPulse {
    0%, 100% { opacity: 0.7; }
    50% { opacity: 1; }
}

/* Sliding Text Banner */
.text-banner {
    position: relative;
    width: 100%;
    height: 30px;
    background-color: var(--primary-color);
    overflow: hidden;
    border-bottom: 1px solid var(--modern-accent);
}

.sliding-text {
    position: absolute;
    white-space: nowrap;
    animation: slideText 5s linear infinite;
    line-height: 30px;
    font-weight: bold;
    font-size: 1rem;
    background: linear-gradient(90deg, var(--modern-accent), #764ba2, var(--modern-accent));
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
    text-shadow: 0 0 5px rgba(102, 126, 234, 0.5);
}

@keyframes slideText {
    0% { transform: translateX(100%); }
    100% { transform: translateX(-100%); }
}

.wallpaper-container {
    position: relative;
    height: 300px;
    width: 100%;
    overflow: hidden;
}

.wallpaper-container #wallpaper {
    width: 100%;
    height: 100%;
    object-fit: cover;
    filter: blur(5px);
    transform: scale(1.1);
}

.wallpaper-container .overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to bottom, rgba(0,0,0,0.2), rgba(0,0,0,0.8));
}

header {
    position: relative;
    background-color: var(--primary-color);
    color: white;
    padding: 1rem;
    box-shadow: var(--shadow);
    z-index: 10;
}

.header-content {
    display: flex;
    justify-content: center;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
}

.title {
    font-size: 2rem;
    font-weight: bold;
    text-transform: uppercase;
    letter-spacing: 2px;
    background: var(--modern-gradient);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
    text-shadow: 0 0 10px rgba(102, 126, 234, 0.5);
    animation: pulse 2s infinite;
}

.modal {
    display: none;
    position: fixed;
    z-index: 100;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.8);
    animation: fadeIn 0.3s;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

.modal-content {
    background-color: var(--box-bg-color);
    margin: 10% auto;
    padding: 20px;
    border: 1px solid var(--modern-accent);
    width: 80%;
    max-width: 600px;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(102, 126, 234, 0.5);
    animation: slideIn 0.3s;
}

@keyframes slideIn {
    from { transform: translateY(-50px); opacity: 0; }
    to { transform: translateY(0); opacity: 1; }
}

.close, .zoom-close {
    color: var(--modern-accent);
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
    position: absolute;
    top: 10px;
    right: 15px;
}

.close:hover, .zoom-close:hover {
    color: white;
}

.about-info {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1rem;
    margin-top: 20px;
}

.info-box {
    background-color: rgba(102, 126, 234, 0.1);
    padding: 15px;
    border-radius: 10px;
    border: 1px solid var(--modern-accent);
    transition: all 0.3s ease;
}

.info-box:hover {
    transform: translateY(-5px);
    box-shadow: 0 0 15px rgba(102, 126, 234, 0.5);
    background-color: rgba(102, 126, 234, 0.2);
}

.info-box strong {
    display: block;
    font-size: 0.9em;
    color: var(--modern-accent);
    margin-bottom: 5px;
}

.info-box p {
    font-size: 1.1em;
    font-weight: bold;
}

/* Zoom Modal Styles */
.zoom-content {
    position: relative;
    width: 90%;
    height: 90%;
    margin: 5% auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

#zoom-image {
    max-width: 100%;
    max-height: 80%;
    transform-origin: center center;
    transition: transform 0.3s ease;
    cursor: move;
    user-select: none;
    -webkit-user-drag: none;
    -khtml-user-drag: none;
    -moz-user-drag: none;
    -o-user-drag: none;
}

.zoom-controls {
    position: absolute;
    bottom: 20px;
    display: flex;
    gap: 15px;
}

.zoom-btn {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: var(--modern-gradient);
    border: none;
    color: white;
    font-size: 1.2rem;
    cursor: pointer;
    box-shadow: var(--shadow);
    transition: all 0.3s ease;
}

.zoom-btn:hover {
    transform: scale(1.1);
    box-shadow: 0 0 15px rgba(102, 126, 234, 0.7);
}

main {
    flex-grow: 1;
    padding: 2rem;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.gallery-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 1.5rem;
    width: 100%;
    max-width: 1200px;
}

.gallery-item {
    position: relative;
    overflow: hidden;
    border-radius: 15px;
    box-shadow: var(--shadow);
    transition: all 0.3s ease;
    cursor: pointer;
    height: 250px;
    background-color: #222;
}

.gallery-item:hover {
    transform: scale(1.05);
    box-shadow: 0 0 20px rgba(102, 126, 234, 0.5);
}

.gallery-item img,
.gallery-item video {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: all 0.5s ease;
    user-select: none;
    -webkit-user-drag: none;
    -khtml-user-drag: none;
    -moz-user-drag: none;
    -o-user-drag: none;
}

.gallery-item:hover img,
.gallery-item:hover video {
    transform: scale(1.1);
    filter: brightness(1.2) contrast(1.1);
}

.gallery-item::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(45deg, transparent, rgba(102, 126, 234, 0.3), transparent);
    transform: translateX(-100%);
    transition: transform 0.6s;
}

.gallery-item:hover::before {
    transform: translateX(100%);
}

.pagination-controls {
    margin-top: 2rem;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 1rem;
}

.pagination-btn {
    background: var(--modern-gradient);
    color: white;
    border: none;
    padding: 12px 24px;
    border-radius: 50px;
    cursor: pointer;
    font-size: 1rem;
    font-weight: bold;
    transition: all 0.3s ease;
    box-shadow: var(--shadow);
    position: relative;
    overflow: hidden;
}

.pagination-btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
    transition: left 0.5s;
}

.pagination-btn:hover::before {
    left: 100%;
}

.pagination-btn:hover:not(:disabled) {
    transform: translateY(-3px);
    box-shadow: 0 0 15px rgba(102, 126, 234, 0.7);
}

.pagination-btn:disabled {
    background: linear-gradient(45deg, #333, #444);
    cursor: not-allowed;
    opacity: 0.5;
}

#page-info {
    font-size: 1.1rem;
    font-weight: bold;
    color: var(--modern-accent);
    text-shadow: 0 0 5px var(--modern-accent);
}

footer {
    background-color: var(--primary-color);
    color: white;
    text-align: center;
    padding: 1.5rem;
    margin-top: auto;
    border-top: 1px solid var(--modern-accent);
}

footer a {
    color: white;
    margin: 0 15px;
    font-size: 1.8rem;
    text-decoration: none;
    transition: all 0.3s ease;
}

footer a:hover {
    color: var(--modern-accent);
    transform: translateY(-3px);
    text-shadow: 0 0 10px rgba(102, 126, 234, 0.7);
}

footer p {
    margin-top: 1rem;
    font-size: 0.9em;
    color: #aaa;
}

/* Mobile Responsiveness */
@media (max-width: 768px) {
    .logo-text {
        font-size: 1.5rem;
        padding: 10px 20px;
    }

    .loading-bar {
        width: 200px;
    }

    .text-banner {
        height: 25px;
    }

    .sliding-text {
        font-size: 0.8rem;
        line-height: 25px;
    }

    .wallpaper-container {
        height: 200px;
    }

    .header-content {
        flex-direction: row;
        justify-content: center;
    }

    .title {
        font-size: 1.5rem;
        text-align: center;
    }

    .gallery-grid {
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: 1rem;
    }

    main {
        padding: 1rem;
    }

    .modal-content {
        width: 95%;
        margin: 20% auto;
    }

    .about-info {
        grid-template-columns: 1fr;
    }
}
EOF

# 4. Create the JavaScript file for functionality
echo "⚙️ Creating script.js..."
cat << 'EOF' > script.js
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
            window.open('https://www.wgatsal.channel', '_blank');
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
EOF

echo ""
echo "🎮 WIRU CLASS OF 2024 Gallery Setup Complete!"
echo "-------------------------------------------"
echo "To view your gallery:"
echo "1. Add your own .jpg files (1.jpg to 100.jpg) to the 'files' directory."
echo "2. Add your own .mp4 files (A.mp4 to Z.mp4) to the 'files' directory."
echo "3. Add a custom wallpaper as 'A.jpg' to the 'wallpaper' directory."
echo "4. Open the 'index.html' file in your web browser."
echo "-------------------------------------------"
echo ""
echo "📝 Setup Summary:"
echo "✅ Created index.html"
echo "✅ Created style.css"
echo "✅ Created script.js"
echo "✅ Created directories: files/ wallpaper/"
echo ""
echo "🎯 Your gallery is ready! Add your media files and open index.html in a browser."
echo ""
echo "🚀 New Features:"
echo "✅ Modern UI with updated color scheme"
echo "✅ Animated loading indicator with circles"
echo "✅ Slower sliding text animation (5 seconds)"
echo "✅ Single menu button in top-left corner"
