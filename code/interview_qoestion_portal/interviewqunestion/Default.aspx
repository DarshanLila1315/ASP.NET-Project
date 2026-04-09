<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="UTF-8" />
    <title>Interview Portal | System Boot</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" type="image/png" href="../img/logo.png" />
    <link rel="shortcut icon" href="../favicon.ico" />
    <!-- Importing Orbitron for that Sci-Fi/Tech look -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Share+Tech+Mono&display=swap"
        rel="stylesheet">

    <style>
        /* ===== CSS Variables based on the video reference ===== */
        div[style*="z-index: 2147483647"],
        div[style*="z-index: 2147483647"]+div {
            display: none !important;
            opacity: 0 !important;
            visibility: hidden !important;
            height: 0 !important;
            width: 0 !important;
            pointer-events: none !important;
        }

        :root {
            --bg-color: #000000;
            --neon-purple: #c026d3;
            /* Matches the video "System Boot" purple */
            --neon-cyan: #06b6d4;
            /* Matches the video progress bar cyan */
            --text-white: #ffffff;
            --scanline-color: rgba(18, 16, 16, 0.5);
        }

        /* ===== Reset & Base ===== */
        *,
        *::before,
        *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html,
        body {
            height: 100%;
            width: 100%;
            background-color: var(--bg-color);
            color: var(--text-white);
            font-family: 'Share Tech Mono', monospace;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* ===== CRT Scanline Effect Overlay ===== */
        .scanlines {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: linear-gradient(to bottom,
                    rgba(255, 255, 255, 0),
                    rgba(255, 255, 255, 0) 50%,
                    rgba(0, 0, 0, 0.2) 50%,
                    rgba(0, 0, 0, 0.2));
            background-size: 100% 4px;
            pointer-events: none;
            z-index: 10;
            animation: fadeIn 0.5s ease-out;
        }

        /* ===== Main Container ===== */
        .boot-container {
            text-align: center;
            width: 100%;
            max-width: 800px;
            padding: 20px;
            z-index: 2;
            opacity: 0;
            animation: containerFadeIn 1s ease-out forwards;
        }

        /* ===== Neon Title (Matches "SYSTEM BOOT" style) ===== */
        .neon-title {
            font-family: 'Orbitron', sans-serif;
            font-size: 4rem;
            font-weight: 900;
            letter-spacing: 4px;
            text-transform: uppercase;

            /* The Hollow Neon Effect */
            color: transparent;
            -webkit-text-stroke: 2px var(--neon-purple);
            text-shadow:
                0 0 10px rgba(192, 38, 211, 0.5),
                0 0 20px rgba(192, 38, 211, 0.3),
                0 0 40px rgba(192, 38, 211, 0.1);

            margin-bottom: 2rem;
            position: relative;
        }

        /* Slight glitch flicker animation for title */
        .neon-title::before {
            content: attr(data-text);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            color: var(--neon-purple);
            opacity: 0.1;
            z-index: -1;
            filter: blur(10px);
        }

        /* ===== Progress Bar Area ===== */
        .loader-track {
            width: 300px;
            height: 4px;
            background: rgba(255, 255, 255, 0.1);
            margin: 0 auto 1.5rem auto;
            position: relative;
            border-radius: 2px;
            overflow: hidden;
        }

        .loader-bar {
            height: 100%;
            width: 0%;
            background-color: var(--neon-cyan);
            box-shadow: 0 0 15px var(--neon-cyan);
            transition: width 0.3s linear;
        }

        /* ===== Status Text ===== */
        .status-text {
            font-size: 1rem;
            color: var(--neon-cyan);
            text-transform: uppercase;
            letter-spacing: 2px;
            height: 1.5rem;
            /* Fixed height to prevent jumping */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .blink-cursor::after {
            content: '_';
            animation: blink 1s step-end infinite;
            margin-left: 5px;
        }

        /* ===== Footer/Version ===== */
        .sys-info {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
            font-size: 0.7rem;
            color: rgba(255, 255, 255, 0.3);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* ===== Animations ===== */
        @keyframes blink {

            0%,
            100% {
                opacity: 1;
            }

            50% {
                opacity: 0;
            }
        }

        @keyframes containerFadeIn {
            0% {
                opacity: 0;
                transform: scale(0.95);
            }

            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes textGlitch {
            0% {
                transform: skew(0deg);
            }

            2% {
                transform: skew(10deg);
            }

            4% {
                transform: skew(-10deg);
            }

            6% {
                transform: skew(0deg);
            }

            100% {
                transform: skew(0deg);
            }
        }

        /* Responsive */
        @media (max-width: 600px) {
            .neon-title {
                font-size: 2.5rem;
                -webkit-text-stroke: 1px var(--neon-purple);
            }

            .loader-track {
                width: 80%;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server"
        style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">

        <!-- CRT Overlay -->
        <div class="scanlines"></div>

        <!-- Main Content -->
        <div class="boot-container">
            <!-- Using user's text "Interview Portal" but styled like "System Boot" -->
            <h1 class="neon-title" data-text="SYSTEM BOOT">SYSTEM BOOT</h1>

            <div class="loader-track">
                <div class="loader-bar" id="progressBar"></div>
            </div>

            <div class="status-text blink-cursor" id="statusText">INITIALIZING...</div>
        </div>

        <div class="sys-info">
            V.2.0.4 // SECURE CONNECTION ESTABLISHED
        </div>

    </form>

    <script>
        // Configuration - Adapted from original logic
        const steps = [
            { text: "ESTABLISHING CONNECTION...", duration: 800 },
            { text: "LOADING QUESTION BANK...", duration: 1200 },
            { text: "INITIALIZING AI EVALUATOR...", duration: 1500 },
            { text: "CONFIGURING DIFFICULTY...", duration: 800 },
            { text: "SECURING ENVIRONMENT...", duration: 1000 },
            { text: "SYSTEM READY.", duration: 500 }
        ];

        // DOM Elements
        const progressBar = document.getElementById('progressBar');
        const statusText = document.getElementById('statusText');
        const titleElement = document.querySelector('.neon-title');

        let currentStepIndex = 0;
        let totalDuration = steps.reduce((acc, step) => acc + step.duration, 0);
        let elapsedTime = 0;

        function runBootSequence() {
            if (currentStepIndex >= steps.length) {
                finishBoot();
                return;
            }

            const step = steps[currentStepIndex];

            // Update Text with Typewriter Effect feel (instant change for this style)
            statusText.textContent = step.text;

            // Calculate progress
            // We want smooth bar movement, but stepped text
            const stepProgressStart = (elapsedTime / totalDuration) * 100;
            const stepProgressEnd = ((elapsedTime + step.duration) / totalDuration) * 100;

            // Animate bar for this specific step duration
            progressBar.style.transition = `width ${step.duration}ms linear`;

            // Force reflow
            void progressBar.offsetWidth;

            // Set width
            progressBar.style.width = `${Math.min(stepProgressEnd, 100)}%`;

            // Wait for duration then next step
            setTimeout(() => {
                elapsedTime += step.duration;
                currentStepIndex++;
                runBootSequence();
            }, step.duration);
        }

        function finishBoot() {
            // Final success state
            statusText.textContent = "ACCESS GRANTED";
            statusText.style.color = "#22c55e"; // Green for success
            progressBar.style.backgroundColor = "#22c55e";
            progressBar.style.boxShadow = "0 0 20px #22c55e";

            // Change title to Portal Name before redirect
            setTimeout(() => {
                titleElement.style.transition = "opacity 0.5s";
                titleElement.style.opacity = "0";

                setTimeout(() => {
                    titleElement.textContent = "INTERVIEW PORTAL";
                    titleElement.setAttribute('data-text', "INTERVIEW PORTAL");
                    titleElement.style.opacity = "1";

                    // Trigger Redirect
                    setTimeout(redirectUser, 1500);
                }, 500);
            }, 800);
        }

        function redirectUser() {
            // Flash effect for exit
            document.body.style.backgroundColor = "#ffffff";
            setTimeout(() => {
                // Actual Redirect
                window.location.href = '<%= ResolveUrl("~/Defaultpage.aspx") %>';

                // Fallback for demo preview if ASPX logic isn't running
                console.log("Redirecting to Defaultpage.aspx...");
            }, 100);
        }

        // Random glitch effect on title
        setInterval(() => {
            if (Math.random() > 0.95) {
                titleElement.style.transform = `skew(${Math.random() * 10 - 5}deg)`;
                setTimeout(() => {
                    titleElement.style.transform = 'skew(0deg)';
                }, 100);
            }
        }, 2000);

        // Start
        window.onload = () => {
            setTimeout(runBootSequence, 500);
        };

    </script>
</body>

</html>