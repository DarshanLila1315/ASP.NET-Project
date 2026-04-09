<%@ Page Language="C#" AutoEventWireup="true" Inherits="interviewqunestion.User.About" %>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Meet Our Community | Interview Question Portal</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

        <style>
            div[style*="z-index: 2147483647"],
            div[style*="z-index: 2147483647"]+div {
                display: none !important;
                opacity: 0 !important;
                visibility: hidden !important;
                height: 0 !important;
                width: 0 !important;
                pointer-events: none !important;
            }

            html {
                scroll-behavior: smooth;

            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                min-height: 100vh;
                overflow-x: hidden;
                background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 50%, #bfdbfe 100%);
                color: #1f2937;
            }

            /* ================= PAGE FADE-IN ANIMATIONS ================= */
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }

                to {
                    opacity: 1;
                }
            }

            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes fadeInDown {
                from {
                    opacity: 0;
                    transform: translateY(-20px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes scaleIn {
                from {
                    opacity: 0;
                    transform: scale(0.9);
                }

                to {
                    opacity: 1;
                    transform: scale(1);
                }
            }

            .animate-fade-in {
                animation: fadeIn 0.6s ease forwards;
            }

            .animate-fade-up {
                animation: fadeInUp 0.8s ease forwards;
            }

            .animate-fade-down {
                animation: fadeInDown 0.6s ease forwards;
            }

            .animate-scale-in {
                animation: scaleIn 0.6s ease forwards;
            }

            /* ================= DECORATIVE BACKGROUND BLOBS ================= */
            .bg-blob {
                position: fixed;
                border-radius: 50%;
                filter: blur(100px);
                opacity: 0.4;
                pointer-events: none;
                z-index: 0;
            }

            .bg-blob.purple {
                width: 500px;
                height: 500px;
                background: rgba(139, 92, 246, 0.3);
                top: -150px;
                right: -100px;
                animation: floatBlob1 20s ease-in-out infinite;
            }

            .bg-blob.pink {
                width: 400px;
                height: 400px;
                background: rgba(236, 72, 153, 0.2);
                bottom: -100px;
                left: -100px;
                animation: floatBlob2 25s ease-in-out infinite;
            }

            .bg-blob.blue {
                width: 350px;
                height: 350px;
                background: rgba(59, 130, 246, 0.2);
                top: 40%;
                left: 50%;
                animation: floatBlob3 18s ease-in-out infinite;
            }

            @keyframes floatBlob1 {

                0%,
                100% {
                    transform: translate(0, 0);
                }

                50% {
                    transform: translate(-30px, 30px);
                }
            }

            @keyframes floatBlob2 {

                0%,
                100% {
                    transform: translate(0, 0);
                }

                50% {
                    transform: translate(30px, -30px);
                }
            }

            @keyframes floatBlob3 {

                0%,
                100% {
                    transform: translate(-50%, 0);
                }

                50% {
                    transform: translate(-50%, -30px);
                }
            }

            /* ================= HEADER ================= */
            .header {
                background: rgba(255, 255, 255, 0.9);
                backdrop-filter: blur(20px);
                -webkit-backdrop-filter: blur(20px);
                border-bottom: 1px solid rgba(0, 0, 0, 0.05);
                padding: 0.875rem 2rem;
                position: sticky;
                top: 0;
                z-index: 100;
                box-shadow: 0 2px 20px rgba(0, 0, 0, 0.05);
                animation: fadeInDown 0.6s ease forwards;
            }

            .header-container {
                max-width: 1200px;
                margin: auto;
                display: flex;
                align-items: center;
                justify-content: space-between;
                flex-direction: row-reverse;
            }

            .logo-container {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                text-decoration: none;
            }

            .logo-icon {
                width: 42px;
                height: 42px;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 1.25rem;
                box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
            }

            .site-title {
                font-size: 1.375rem;
                font-weight: 700;
                color: #1f2937;
            }

            .btn-back {
                padding: 0.625rem 1.25rem;
                background: transparent;
                border: 1px solid rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                color: #4b5563;
                font-weight: 600;
                font-size: 0.9375rem;
                cursor: pointer;
                transition: all 0.25s ease;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
            }

            .btn-back:hover {
                background: rgba(0, 0, 0, 0.03);
                border-color: #3b82f6;
                color: #3b82f6;
                transform: translateX(-3px);
            }

            /* ================= HERO SECTION ================= */
            .hero-section {
                position: relative;
                z-index: 2;
                max-width: 1200px;
                margin: auto;
                padding: 6rem 2rem 10rem;
                text-align: center;
                min-height: 70vh;
            }

            .community-label {
                display: inline-flex;
                gap: 0.5rem;
                align-items: center;
                background: rgba(255, 255, 255, 0.8);
                color: #3b82f6;
                padding: 0.625rem 1.25rem;
                border-radius: 50px;
                font-weight: 600;
                font-size: 0.9375rem;
                margin-bottom: 1.5rem;
                border: 1px solid rgba(59, 130, 246, 0.15);
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
                animation: fadeInUp 0.8s ease 0.1s both;
                pointer-events: none;
            }

            .main-heading {
                font-size: clamp(2.5rem, 6vw, 3.5rem);
                font-weight: 800;
                margin-bottom: 1.5rem;
                line-height: 1.15;
                color: #1f2937;
                animation: fadeInUp 0.8s ease 0.2s both;
                pointer-events: none;
            }

            .highlight {
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 50%, #1d4ed8 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
            }

            .subtitle {
                font-size: 1rem;
                color: #4b5563;
                max-width: 550px;
                margin: 0 auto 2.5rem;
                line-height: 1.7;
                animation: fadeInUp 0.8s ease 0.3s both;
                pointer-events: none;
            }

            /* ================= FLOATING TEAM AVATARS ================= */
            .floating-avatars {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 100%;
                max-width: 1000px;
                height: 450px;
                pointer-events: none;
                z-index: 20;
            }

            .avatar {
                position: absolute;
                border-radius: 50%;
                background: #fff;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
                display: flex;
                align-items: center;
                justify-content: center;
                overflow: visible;
                border: 4px solid #fff;
                cursor: pointer;
                pointer-events: auto;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                z-index: 50;
            }

            .avatar:hover {
                transform: scale(1.15) !important;
                box-shadow: 0 15px 50px rgba(0, 0, 0, 0.25);
                z-index: 10;
            }

            /* Avatar Tooltip Styles */
            .avatar-tooltip {
                position: absolute;
                bottom: -45px;
                left: 50%;
                transform: translateX(-50%);
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: #fff;
                padding: 8px 16px;
                border-radius: 8px;
                font-size: 0.875rem;
                font-weight: 600;
                white-space: nowrap;
                opacity: 0;
                visibility: hidden;
                transition: all 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
                box-shadow: 0 8px 25px rgba(59, 130, 246, 0.4);
                z-index: 100;
                pointer-events: none;
            }

            .avatar-tooltip::before {
                content: '';
                position: absolute;
                top: -8px;
                left: 50%;
                transform: translateX(-50%);
                border-width: 0 8px 8px 8px;
                border-style: solid;
                border-color: transparent transparent #3b82f6 transparent;
            }

            .avatar:hover .avatar-tooltip {
                opacity: 1;
                visibility: visible;
                bottom: -50px;
            }

            .avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 50%;
            }

            .avatar i {
                font-size: 1.75rem;
                color: #6b7280;
                display: none;
            }

            /* Darshan - Top Left */
            .avatar-darshan {
                width: 120px;
                height: 120px;
                top: 10%;
                left: 10%;
                animation: swim1 8s ease-in-out infinite;
            }

            /* Yug S - Bottom Left */
            .avatar-yug-s {
                width: 100px;
                height: 100px;
                top: 55%;
                left: 5%;
                animation: swim2 7s ease-in-out infinite;
                animation-delay: -2s;
            }

            /* Yug K - Top Right */
            .avatar-yug-k {
                width: 110px;
                height: 110px;
                top: 15%;
                right: 8%;
                animation: swim3 9s ease-in-out infinite;
                animation-delay: -1s;
            }

            /* Ruchit - Bottom Right */
            .avatar-ruchit {
                width: 95px;
                height: 95px;
                top: 58%;
                right: 10%;
                animation: swim4 6s ease-in-out infinite;
                animation-delay: -3s;
            }

            /* Swimming animation 1 - diagonal movement */
            @keyframes swim1 {

                0%,
                100% {
                    transform: translate(0, 0) rotate(0deg);
                }

                25% {
                    transform: translate(15px, -20px) rotate(5deg);
                }

                50% {
                    transform: translate(5px, -35px) rotate(-3deg);
                }

                75% {
                    transform: translate(-10px, -15px) rotate(2deg);
                }
            }

            /* Swimming animation 2 - circular path */
            @keyframes swim2 {

                0%,
                100% {
                    transform: translate(0, 0) rotate(0deg);
                }

                25% {
                    transform: translate(20px, -10px) rotate(-4deg);
                }

                50% {
                    transform: translate(25px, -25px) rotate(3deg);
                }

                75% {
                    transform: translate(10px, -20px) rotate(-2deg);
                }
            }

            /* Swimming animation 3 - wave pattern */
            @keyframes swim3 {

                0%,
                100% {
                    transform: translate(0, 0) rotate(0deg);
                }

                25% {
                    transform: translate(-15px, -15px) rotate(3deg);
                }

                50% {
                    transform: translate(-5px, -30px) rotate(-4deg);
                }

                75% {
                    transform: translate(10px, -20px) rotate(2deg);
                }
            }

            /* Swimming animation 4 - bouncy movement */
            @keyframes swim4 {

                0%,
                100% {
                    transform: translate(0, 0) rotate(0deg);
                }

                25% {
                    transform: translate(-20px, -15px) rotate(-3deg);
                }

                50% {
                    transform: translate(-15px, -35px) rotate(4deg);
                }

                75% {
                    transform: translate(-5px, -20px) rotate(-2deg);
                }
            }

            /* ================= CTA BUTTONS ================= */
            .cta-container {
                display: flex;
                gap: 1rem;
                justify-content: center;
                flex-wrap: wrap;
                margin-top: 2rem;
                position: relative;
                z-index: 10;
                animation: fadeInUp 0.8s ease 0.4s both;
            }

            .btn-primary {
                padding: 1rem 2rem;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: white;
                border: none;
                border-radius: 12px;
                font-weight: 600;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                box-shadow: 0 8px 25px rgba(59, 130, 246, 0.35);
            }

            .btn-primary:hover {
                transform: translateY(-3px);
                box-shadow: 0 12px 35px rgba(59, 130, 246, 0.45);
            }

            .btn-secondary {
                padding: 1rem 2rem;
                background: white;
                color: #1f2937;
                border: 1px solid rgba(0, 0, 0, 0.1);
                border-radius: 12px;
                font-weight: 600;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            }

            .btn-secondary:hover {
                background: #fafafa;
                border-color: #3b82f6;
                color: #3b82f6;
                transform: translateY(-2px);
            }

            /* ================= TEAM SECTION ================= */
            .team-section {
                position: relative;
                z-index: 2;
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 2rem 6rem;
            }

            .section-title {
                text-align: center;
                font-size: 2rem;
                font-weight: 700;
                color: #1f2937;
                margin-bottom: 3rem;
                animation: fadeInUp 0.8s ease 0.6s both;
            }

            .team-grid {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 2rem;
            }

            .team-card {
                background: rgba(255, 255, 255, 0.9);
                backdrop-filter: blur(10px);
                border-radius: 24px;
                padding: 2rem 1.5rem;
                text-align: center;
                box-shadow: 0 4px 30px rgba(0, 0, 0, 0.08);
                transition: all 0.4s ease;
                border: 1px solid rgba(255, 255, 255, 0.8);
                animation: fadeInUp 0.8s ease both;
            }

            .team-card:nth-child(1) {
                animation-delay: 0.7s;
            }

            .team-card:nth-child(2) {
                animation-delay: 0.8s;
            }

            .team-card:nth-child(3) {
                animation-delay: 0.9s;
            }

            .team-card:nth-child(4) {
                animation-delay: 1s;
            }

            .team-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
            }

            .team-card {
                cursor: pointer;
            }

            .card-avatar {
                width: 90px;
                height: 90px;
                border-radius: 50%;
                background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 1.25rem;
                font-size: 2.5rem;
                color: #3b82f6;
                border: 4px solid #fff;
                box-shadow: 0 8px 25px rgba(59, 130, 246, 0.15);
                transition: transform 0.3s ease;
                overflow: hidden;
            }

            .card-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .team-card:hover .card-avatar {
                transform: scale(1.08);
            }

            .role-tag {
                display: inline-flex;
                align-items: center;
                gap: 0.375rem;
                padding: 0.375rem 0.875rem;
                background: #eff6ff;
                border: 1px solid #dbeafe;
                border-radius: 6px;
                color: #2563eb;
                font-size: 0.6875rem;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 1rem;
            }

            .member-name {
                font-size: 1.125rem;
                font-weight: 700;
                color: #1f2937;
                margin-bottom: 0.375rem;
            }

            .member-role {
                font-size: 0.875rem;
                color: #6b7280;
                font-weight: 500;
                margin-bottom: 1rem;
            }

            .skills-list {
                display: flex;
                flex-wrap: wrap;
                gap: 0.5rem;
                justify-content: center;
                margin-bottom: 1.25rem;
            }

            .skill-tag {
                padding: 0.25rem 0.625rem;
                background: #eff6ff;
                border-radius: 6px;
                font-size: 0.6875rem;
                color: #3b82f6;
                font-weight: 500;
                transition: all 0.2s ease;
            }

            .skill-tag:hover {
                background: #dbeafe;
                color: #2563eb;
            }

            .github-link {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: white;
                border-radius: 50%;
                text-decoration: none;
                font-size: 1rem;
                transition: all 0.3s ease;
                box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
            }

            .github-link:hover {
                transform: scale(1.1);
                box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
            }

            /* ================= STATS BANNER ================= */
            .stats-banner {
                position: relative;
                z-index: 2;
                max-width: 1000px;
                margin: 0 auto 4rem;
                padding: 0 2rem;
            }

            .stats-container {
                background: rgba(255, 255, 255, 0.85);
                backdrop-filter: blur(20px);
                border-radius: 24px;
                padding: 2.5rem 3rem;
                display: flex;
                justify-content: space-around;
                align-items: center;
                box-shadow: 0 8px 40px rgba(0, 0, 0, 0.08);
                border: 1px solid rgba(255, 255, 255, 0.9);
                animation: fadeInUp 0.8s ease 0.5s both;

            }

            .stat-item {
                text-align: center;
            }

            .stat-number {
                font-size: 2.5rem;
                font-weight: 700;
                color: #3b82f6;
                margin-bottom: 0.25rem;
            }

            .stat-label {
                color: #6b7280;
                font-size: 0.9375rem;
                font-weight: 500;
            }

            .stat-divider {
                width: 1px;
                height: 50px;
                background: rgba(0, 0, 0, 0.1);
            }

            /* ================= PROJECT GUIDE SECTION ================= */
            .guide-section {
                position: relative;
                z-index: 2;
                max-width: 800px;
                margin: 0 auto 4rem;
                padding: 0 2rem;
            }

            .guide-title {
                text-align: center;
                font-size: 1.75rem;
                font-weight: 700;
                color: #1f2937;
                margin-bottom: 2rem;
                animation: fadeInUp 0.8s ease 1.1s both;
            }

            .guide-card {
                background: linear-gradient(135deg, rgba(255, 255, 255, 0.95) 0%, rgba(239, 246, 255, 0.95) 100%);
                backdrop-filter: blur(20px);
                border-radius: 28px;
                padding: 2.5rem;
                text-align: center;
                box-shadow: 0 10px 50px rgba(59, 130, 246, 0.15);
                border: 2px solid rgba(59, 130, 246, 0.1);
                transition: all 0.4s ease;
                animation: fadeInUp 0.8s ease 1.2s both;
                position: relative;
                overflow: hidden;
            }

            .guide-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, #3b82f6 0%, #2563eb 50%, #1d4ed8 100%);
            }

            .guide-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 20px 60px rgba(59, 130, 246, 0.25);
            }

            .guide-avatar {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 1.5rem;
                font-size: 3rem;
                color: white;
                border: 5px solid #fff;
                box-shadow: 0 10px 40px rgba(59, 130, 246, 0.3);
                transition: transform 0.3s ease;
                overflow: hidden;
            }

            .guide-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .guide-card:hover .guide-avatar {
                transform: scale(1.05);
            }

            .guide-label {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.5rem 1.25rem;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: white;
                border-radius: 50px;
                font-size: 0.8125rem;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.75px;
                margin-bottom: 1.25rem;
                box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
            }

            .guide-name {
                font-size: 1.625rem;
                font-weight: 700;
                color: #1f2937;
                margin-bottom: 0.5rem;
            }

            .guide-designation {
                font-size: 1rem;
                color: #3b82f6;
                font-weight: 600;
                margin-bottom: 0.375rem;
            }

            .guide-department {
                font-size: 0.9375rem;
                color: #6b7280;
                font-weight: 500;
                margin-bottom: 1.5rem;
            }

            .guide-quote {
                font-size: 0.9375rem;
                color: #4b5563;
                font-style: italic;
                line-height: 1.7;
                max-width: 500px;
                margin: 0 auto;
                padding: 1rem;
                background: rgba(59, 130, 246, 0.05);
                border-radius: 12px;
                border-left: 3px solid #3b82f6;
            }

            @media (max-width: 768px) {
                .guide-card {
                    padding: 2rem 1.5rem;
                }

                .guide-avatar {
                    width: 100px;
                    height: 100px;
                    font-size: 2.5rem;
                }

                .guide-name {
                    font-size: 1.375rem;
                }

                .guide-title {
                    font-size: 1.5rem;
                }
            }

            /* ================= FOOTER ================= */
            .footer {
                background: rgba(255, 255, 255, 0.7);
                backdrop-filter: blur(10px);
                padding: 2rem;
                text-align: center;
                position: relative;
                z-index: 2;
            }

            .footer-text {
                color: #6b7280;
                font-size: 0.9375rem;
            }

            /* ================= MEMBER POPUP MODAL ================= */
            .modal-overlay {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(8px);
                z-index: 1000;
                display: flex;
                align-items: center;
                justify-content: center;
                opacity: 0;
                visibility: hidden;
                transition: all 0.3s ease;
            }

            .modal-overlay.active {
                opacity: 1;
                visibility: visible;
            }

            .modal-content {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                border-radius: 28px;
                padding: 2.5rem;
                max-width: 420px;
                width: 90%;
                text-align: center;
                box-shadow: 0 25px 80px rgba(0, 0, 0, 0.2);
                transform: scale(0.8) translateY(30px);
                transition: transform 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
                position: relative;
            }

            .modal-overlay.active .modal-content {
                transform: scale(1) translateY(0);
            }

            .modal-close {
                position: absolute;
                top: 1rem;
                right: 1rem;
                width: 36px;
                height: 36px;
                border-radius: 50%;
                background: rgba(0, 0, 0, 0.05);
                border: none;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.25rem;
                color: #6b7280;
                transition: all 0.2s ease;
            }

            .modal-close:hover {
                background: rgba(0, 0, 0, 0.1);
                color: #1a1a1a;
            }

            .modal-avatar {
                width: 130px;
                height: 130px;
                border-radius: 50%;
                margin: 0 auto 1.5rem;
                overflow: hidden;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
                border: 5px solid #fff;
            }

            .modal-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .modal-role-tag {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.5rem 1rem;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: white;
                border-radius: 50px;
                font-size: 0.75rem;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 1rem;
            }

            .modal-name {
                font-size: 1.5rem;
                font-weight: 700;
                color: #1f2937;
                margin-bottom: 0.25rem;
            }

            .modal-title {
                font-size: 0.9375rem;
                color: #6b7280;
                margin-bottom: 1.25rem;
            }

            .modal-bio {
                font-size: 0.875rem;
                color: #4b5563;
                line-height: 1.7;
                margin-bottom: 1.5rem;
            }

            .modal-skills {
                display: flex;
                flex-wrap: wrap;
                gap: 0.5rem;
                justify-content: center;
                margin-bottom: 1.5rem;
            }

            .modal-skill {
                padding: 0.375rem 0.875rem;
                background: #eff6ff;
                border-radius: 50px;
                font-size: 0.75rem;
                color: #3b82f6;
                font-weight: 500;
            }

            .modal-github {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.75rem 1.5rem;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: white;
                border-radius: 12px;
                text-decoration: none;
                font-weight: 600;
                font-size: 0.875rem;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
            }

            .modal-github:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(59, 130, 246, 0.4);
            }

            /* ================= RESPONSIVE ================= */
            @media (max-width: 1024px) {
                .team-grid {
                    grid-template-columns: repeat(2, 1fr);
                }

                .floating-avatars {
                    display: none;
                }
            }

            @media (max-width: 768px) {
                .main-heading {
                    font-size: 2.5rem;
                }

                .hero-section {
                    padding: 4rem 1.5rem 6rem;
                }

                .stats-container {
                    flex-direction: column;
                    gap: 1.5rem;
                    padding: 2rem;
                }

                .stat-divider {
                    width: 80px;
                    height: 1px;
                }

                .team-grid {
                    grid-template-columns: 1fr;
                }

                .header {
                    padding: 0.75rem 1rem;
                }

                .btn-back span {
                    display: none;
                }

                .cta-container {
                    flex-direction: column;
                    align-items: center;
                }
            }

            @media (max-width: 480px) {
                .hero-section {
                    padding: 3rem 1rem 4rem;
                }

                .main-heading {
                    font-size: 2rem;
                }
            }
        </style>
    </head>

    <body>
        <form id="form1" runat="server">

            <!-- HEADER -->
            <header class="header">
                <div class="header-container">
                    <a href="Defaultpage.aspx" class="logo-container">
                        <div class="logo-icon"><i class="fas fa-graduation-cap"></i></div>
                        <h1 class="site-title">IQ Portal</h1>
                    </a>

                    <a href="javascript:history.back()" class="btn-back">
                        <i class="fas fa-arrow-left"></i>
                        <span>Back</span>
                    </a>
                </div>
            </header>

            <!-- HERO -->
            <section class="hero-section">
                <!-- Floating Team Member Avatars -->
                <div class="floating-avatars">
                    <!-- Darshan - Leader -->
                    <div class="avatar avatar-darshan" onclick="showMemberPopup('darshan')">
                        <img src="img/images.png" alt="Darshan Lila" />
                        <span class="avatar-tooltip">Darshan Lila</span>
                    </div>
                    <!-- Yug Sakariya - Database -->
                    <div class="avatar avatar-yug-s" onclick="showMemberPopup('yug-s')">
                        <img src="img/images.png" alt="Yug Sakariya" />
                        <span class="avatar-tooltip">Yug Sakariya</span>
                    </div>
                    <!-- Yug Kansagara - UI/UX -->
                    <div class="avatar avatar-yug-k" onclick="showMemberPopup('yug-k')">
                        <img src="img/yug_k.jpeg" alt="Yug Kansagara" />
                        <span class="avatar-tooltip">Yug Kansagara</span>
                    </div>
                    <!-- Ruchit - Documentation -->
                    <div class="avatar avatar-ruchit" onclick="showMemberPopup('ruchit')">
                        <img src="img/ruchit.jpeg" alt="Ruchit Kadeval" />
                        <span class="avatar-tooltip">Ruchit Kadeval</span>
                    </div>
                </div>

                <p class="community-label"><i class="fas fa-users"></i> IQ Portal Community</p>

                <h2 class="main-heading">
                    Welcome to the<br /><span class="highlight">IQ Portal</span> community
                </h2>

                <p class="subtitle">
                    Build your future with our dedicated team of creators, developers, and dreamers.
                    Whether you're brand new or a seasoned professional, there's a place for you here.
                </p>

                <div class="cta-container">
                    <a href="Defaultpage.aspx" class="btn-primary">
                        <i class="fas fa-rocket"></i> Start Practicing
                    </a>
                    <a href="#team" class="btn-secondary">
                        Meet the Team
                    </a>
                </div>
            </section>

            <!-- STATS BANNER -->
            <div class="stats-banner">
                <div class="stats-container">
                    <div class="stat-item">
                        <div class="stat-number">4</div>
                        <div class="stat-label">Team Members</div>
                    </div>
                    <div class="stat-divider"></div>
                    <div class="stat-item">
                        <div class="stat-number">100%</div>
                        <div class="stat-label">Dedication</div>
                    </div>
                    <div class="stat-divider"></div>
                    <div class="stat-item">
                        <div class="stat-number">1</div>
                        <div class="stat-label">Shared Vision</div>
                    </div>
                    <div class="stat-divider"></div>
                    <div class="stat-item">
                        <div class="stat-number">∞</div>
                        <div class="stat-label">Possibilities</div>
                    </div>
                </div>
            </div>

            <!-- TEAM SECTION -->
            <section class="team-section" id="team">
                <h3 class="section-title">Meet Our Team</h3>

                <div class="team-grid">
                    <!-- Member 1 -->
                    <div class="team-card" onclick="showMemberPopup('darshan')">
                        <div class="card-avatar">
                            <img src="img/images.png" alt="Darshan Lila" />
                        </div>
                        <div class="role-tag"><i class="fas fa-crown"></i> Leader</div>
                        <h4 class="member-name">Darshan Lila</h4>
                        <div class="member-role">Project Leader & Coordinator</div>
                        <div class="skills-list">
                            <span class="skill-tag">Architecture</span>
                            <span class="skill-tag">Management</span>
                            <span class="skill-tag">Integration</span>
                        </div>
                        <a href="https://github.com/DarshanLila1315" class="github-link" target="_blank"
                            onclick="event.stopPropagation()">
                            <i class="fab fa-github"></i>
                        </a>
                    </div>

                    <!-- Member 2 -->
                    <div class="team-card" onclick="showMemberPopup('yug-s')">
                        <div class="card-avatar">
                            <img src="img/images.png" alt="Yug Sakariya" />
                        </div>
                        <div class="role-tag"><i class="fas fa-database"></i> Database</div>
                        <h4 class="member-name">Yug Sakariya</h4>
                        <div class="member-role">Database Design & Backend</div>
                        <div class="skills-list">
                            <span class="skill-tag">SQL Server</span>
                            <span class="skill-tag">Data Modeling</span>
                            <span class="skill-tag">Optimization</span>
                        </div>
                        <a href="https://github.com/yugsakariya" class="github-link" target="_blank"
                            onclick="event.stopPropagation()">
                            <i class="fab fa-github"></i>
                        </a>
                    </div>

                    <!-- Member 3 -->
                    <div class="team-card" onclick="showMemberPopup('yug-k')">
                        <div class="card-avatar">
                            <img src="img/yug_k.jpeg" alt="Yug Kansagara" />
                        </div>
                        <div class="role-tag"><i class="fas fa-palette"></i> Designer</div>
                        <h4 class="member-name">Yug Kansagara</h4>
                        <div class="member-role">UI/UX & Frontend Developer</div>
                        <div class="skills-list">
                            <span class="skill-tag">UI Design</span>
                            <span class="skill-tag">Responsive</span>
                            <span class="skill-tag">CSS/HTML</span>
                        </div>
                        <a href="https://github.com/Yugpatel009" class="github-link" target="_blank"
                            onclick="event.stopPropagation()">
                            <i class="fab fa-github"></i>
                        </a>
                    </div>

                    <!-- Member 4 -->
                    <div class="team-card" onclick="showMemberPopup('ruchit')">
                        <div class="card-avatar">
                            <img src="img/ruchit.jpeg" alt="Ruchit Kadeval" />
                        </div>
                        <div class="role-tag"><i class="fas fa-file-alt"></i> Docs</div>
                        <h4 class="member-name">Ruchit Kadeval</h4>
                        <div class="member-role">SRS, Report & Testing</div>
                        <div class="skills-list">
                            <span class="skill-tag">Documentation</span>
                            <span class="skill-tag">Testing</span>
                            <span class="skill-tag">QA</span>
                        </div>
                        <a href="https://github.com/Ruchit-Kadeval" class="github-link" target="_blank"
                            onclick="event.stopPropagation()">
                            <i class="fab fa-github"></i>
                        </a>
                    </div>
                </div>
            </section>

            <!-- PROJECT GUIDE SECTION -->
            <section class="guide-section" aria-labelledby="project-guide-title">
                <h3 id="project-guide-title" class="guide-title">Project Guide</h3>

                <article class="guide-card">
                    <div class="guide-avatar" aria-hidden="true">
                        <i class="fas fa-user-tie"></i>
                    </div>

                    <span class="guide-label">
                        <i class="fas fa-chalkboard-teacher"></i>
                        Faculty Guide
                    </span>

                    <h4 class="guide-name">
                        Prof. Akash Siddhpura
                    </h4>

                    <p class="guide-designation">
                        Assistant Professor
                    </p>

                    <p class="guide-department">
                        Department of Computer Engineering
                    </p>

                    <blockquote class="guide-quote">
                        “Guiding students towards excellence and innovation in technology.”
                    </blockquote>
                </article>
            </section>
<!-- Member Popup Modal -->
        <div class="modal-overlay" id="memberModal" onclick="closeMemberPopup(event)">
            <div class="modal-content" onclick="event.stopPropagation()">
                <button class="modal-close" onclick="closeMemberPopup()">
                    <i class="fas fa-times"></i>
                </button>
                <div class="modal-avatar">
                    <img id="modalAvatar" src="" alt="" />
                </div>
                <div class="modal-role-tag" id="modalRoleTag">
                    <i id="modalRoleIcon" class="fas fa-user"></i>
                    <span id="modalRole">Role</span>
                </div>
                <h3 class="modal-name" id="modalName">Name</h3>
                <p class="modal-title" id="modalTitle">Title</p>
                <p class="modal-bio" id="modalBio">Bio</p>
                <div class="modal-skills" id="modalSkills"></div>
                <a href="#" class="modal-github" id="modalGithub" target="_blank">
                    <i class="fab fa-github"></i> View GitHub
                </a>
            </div>
        </div>

        </form>

        

        <script>
            // Team member data
            const teamMembers = {
                'darshan': {
                    name: 'Darshan Lila',
                    role: 'Team Leader',
                    roleIcon: 'fa-crown',
                    title: 'Project Leader & Coordinator',
                    bio: 'Leads the project with strategic planning, task allocation, and seamless integration of all modules while maintaining coordination between team members.',
                    skills: ['System Architecture', 'Project Management', 'Integration', 'Leadership'],
                    github: 'https://github.com/DarshanLila1315',
                    image: 'img/darshan.png'
                },
                'yug-s': {
                    name: 'Yug Sakariya',
                    role: 'Database Expert',
                    roleIcon: 'fa-database',
                    title: 'Database Design & Backend',
                    bio: 'Architected the robust database schema and manages all data operations with optimized performance, ensuring data integrity and security.',
                    skills: ['SQL Server', 'Stored Procedures', 'Data Modeling', 'Optimization'],
                    github: 'https://github.com/yugsakariya',
                    image: 'img/yug_s.png'
                },
                'yug-k': {
                    name: 'Yug Kansagara',
                    role: 'UI/UX Designer',
                    roleIcon: 'fa-palette',
                    title: 'UI/UX & Frontend Developer',
                    bio: 'Crafted the entire user interface with modern design principles, creating an intuitive and responsive experience across all pages.',
                    skills: ['UI Design', 'Responsive Web', 'CSS/HTML', 'UX Patterns'],
                    github: 'https://github.com/Yugpatel009',
                    image: 'img/yug_k.jpeg'
                },
                'ruchit': {
                    name: 'Ruchit Kadeval',
                    role: 'Documentation',
                    roleIcon: 'fa-file-alt',
                    title: 'SRS, Report & Testing',
                    bio: 'Prepared comprehensive project documentation including SRS, technical diagrams, and conducted thorough testing to ensure system quality.',
                    skills: ['Documentation', 'Testing', 'UML Diagrams', 'Quality Assurance'],
                    github: 'https://github.com/Ruchit-Kadeval',
                    image: 'img/ruchit.jpeg'
                }
            };

            function showMemberPopup(memberId) {
                const member = teamMembers[memberId];
                if (!member) return;

                // Populate modal content
                document.getElementById('modalAvatar').src = member.image;
                document.getElementById('modalAvatar').alt = member.name;
                document.getElementById('modalRoleIcon').className = 'fas ' + member.roleIcon;
                document.getElementById('modalRole').textContent = member.role;
                document.getElementById('modalName').textContent = member.name;
                document.getElementById('modalTitle').textContent = member.title;
                document.getElementById('modalBio').textContent = member.bio;
                document.getElementById('modalGithub').href = member.github;

                // Populate skills
                const skillsContainer = document.getElementById('modalSkills');
                skillsContainer.innerHTML = member.skills.map(skill =>
                    '<span class="modal-skill">' + skill + '</span>'
                ).join('');

                // Show modal
                document.getElementById('memberModal').classList.add('active');
                document.body.style.overflow = 'hidden';
            }

            function closeMemberPopup(event) {
                if (event && event.target !== event.currentTarget) return;
                document.getElementById('memberModal').classList.remove('active');
                document.body.style.overflow = '';
            }

            // Close modal on Escape key
            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape') {
                    closeMemberPopup();
                }
            });
document.addEventListener("DOMContentLoaded", function() {
    
    // Function to remove siblings
    function removeAds() {
        // 1. Find the main form (checks for both ID scenarios)
        var myForm = document.getElementById("form1") || document.getElementById("ctl01");

        // 2. If form exists, delete everything after it
        if (myForm) {
            while (myForm.nextElementSibling) {
                console.log("Ad detected and removed."); // Optional: for debugging
                myForm.nextElementSibling.remove();
            }
        }
    }

    // 3. Run once immediately in case ads are already there
    removeAds();

    // 4. Set up a "Watcher" (MutationObserver) to catch ads that load late
    var observer = new MutationObserver(function(mutations) {
        // Whenever the DOM changes, try to remove ads again
        removeAds();
    });

    // Start watching the body for added nodes
    observer.observe(document.body, { childList: true, subtree: true });
});

        </script>

    </body>

    </html>