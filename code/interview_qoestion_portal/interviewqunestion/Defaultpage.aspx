<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Defaultpage.aspx.cs"
    Inherits="interviewqunestion.User.Defaultpage" %>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" type="image/png" href="img/logo.png" />
        <link rel="shortcut icon" href="favicon.ico" />
        <title>Interview Question Portal | Master Your Interview</title>

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

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            html,
            body {
                width: 100%;
                overflow-x: hidden;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 50%, #bfdbfe 100%);
                color: #1f2937;
                min-height: 100vh;
                position: relative;
            }

            /* Decorative Background Blobs */
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
                animation: float1 20s ease-in-out infinite;
            }

            .bg-blob.pink {
                width: 400px;
                height: 400px;
                background: rgba(236, 72, 153, 0.2);
                bottom: -100px;
                left: -100px;
                animation: float2 25s ease-in-out infinite;
            }

            .bg-blob.blue {
                width: 350px;
                height: 350px;
                background: rgba(59, 130, 246, 0.2);
                top: 40%;
                left: 50%;
                animation: float3 18s ease-in-out infinite;
            }

            @keyframes float1 {

                0%,
                100% {
                    transform: translate(0, 0);
                }

                50% {
                    transform: translate(-30px, 30px);
                }
            }

            @keyframes float2 {

                0%,
                100% {
                    transform: translate(0, 0);
                }

                50% {
                    transform: translate(30px, -30px);
                }
            }

            @keyframes float3 {

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
            }

            .header-container {
                max-width: 1200px;
                margin: auto;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .logo-container {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                cursor: pointer;
                z-index: 101;
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
                flex-shrink: 0;
            }

            .site-title {
                font-size: 1.375rem;
                font-weight: 700;
                color: #1f2937;
                white-space: nowrap;
            }

            /* Mobile Menu Toggle Button */
            .mobile-menu-toggle {
                display: none;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                width: 44px;
                height: 44px;
                background: transparent;
                border: none;
                cursor: pointer;
                padding: 0.5rem;
                z-index: 101;
                border-radius: 8px;
                transition: background 0.3s ease;
            }

            .mobile-menu-toggle:hover {
                background: rgba(59, 130, 246, 0.1);
            }

            .mobile-menu-toggle span {
                display: block;
                width: 24px;
                height: 3px;
                background: #1f2937;
                border-radius: 3px;
                transition: all 0.3s ease;
                margin: 3px 0;
            }

            .mobile-menu-toggle.active span:nth-child(1) {
                transform: rotate(45deg) translate(5px, 5px);
            }

            .mobile-menu-toggle.active span:nth-child(2) {
                opacity: 0;
                transform: translateX(-10px);
            }

            .mobile-menu-toggle.active span:nth-child(3) {
                transform: rotate(-45deg) translate(7px, -7px);
            }

            .nav-buttons {
                display: flex;
                gap: 0.75rem;
                align-items: center;
            }

            .btn-nav {
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
                white-space: nowrap;
            }

            .btn-nav:hover {
                background: rgba(0, 0, 0, 0.03);
                border-color: #3b82f6;
                color: #3b82f6;
            }

            .btn-nav-primary {
                padding: 0.625rem 1.5rem;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                border: none;
                border-radius: 10px;
                color: white;
                font-weight: 600;
                font-size: 0.9375rem;
                cursor: pointer;
                transition: all 0.25s ease;
                text-decoration: none;
                box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
                white-space: nowrap;
            }

            .btn-nav-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
            }

            /* Mobile Overlay */
            .mobile-overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 99;
                opacity: 0;
                transition: opacity 0.3s ease;
                pointer-events: none;
                /* Fix: Prevent blocking clicks when not active */
            }

            .mobile-overlay.active {
                opacity: 1;
                pointer-events: auto;
                /* Fix: Enable clicks when active */
            }

            /* ================= HERO SECTION ================= */
            .hero-section {
                max-width: 1200px;
                margin: auto;
                padding: 5rem 2rem 6rem;
                text-align: center;
                position: relative;
                z-index: 2;
            }

            .tagline {
                display: inline-flex;
                gap: 0.5rem;
                align-items: center;
                background: rgba(255, 255, 255, 0.8);
                color: #3b82f6;
                padding: 0.625rem 1.25rem;
                border-radius: 50px;
                font-weight: 600;
                font-size: 0.9375rem;
                margin-bottom: 2rem;
                border: 1px solid rgba(59, 130, 246, 0.15);
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
                animation: fadeUp 0.8s ease;
            }

            @keyframes fadeUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .main-heading {
                font-size: 3.5rem;
                font-weight: 800;
                margin-bottom: 1.5rem;
                line-height: 1.15;
                color: #1f2937;
                animation: fadeUp 0.8s ease 0.1s both;
            }

            .highlight {
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 50%, #1d4ed8 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
            }

            .subtitle {
                font-size: 1.25rem;
                color: #4b5563;
                max-width: 680px;
                margin: auto auto 3rem;
                line-height: 1.7;
                animation: fadeUp 0.8s ease 0.2s both;
            }

            .cta-buttons {
                display: flex;
                gap: 1rem;
                justify-content: center;
                flex-wrap: wrap;
                margin-bottom: 5rem;
                animation: fadeUp 0.8s ease 0.3s both;
            }

            .btn-primary {
                padding: 1rem 2.25rem;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                border-radius: 12px;
                color: white;
                font-weight: 600;
                font-size: 1.0625rem;
                border: none;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 8px 25px rgba(59, 130, 246, 0.35);
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
            }

            .btn-primary:hover {
                transform: translateY(-3px);
                box-shadow: 0 12px 35px rgba(59, 130, 246, 0.45);
            }

            .btn-primary i {
                transition: transform 0.3s;
            }

            .btn-primary:hover i {
                transform: translateX(4px);
            }

            .btn-secondary {
                padding: 1rem 2.25rem;
                background: white;
                border-radius: 12px;
                color: #1f2937;
                font-weight: 600;
                font-size: 1.0625rem;
                border: 1px solid rgba(0, 0, 0, 0.1);
                cursor: pointer;
                transition: all 0.3s ease;
                text-decoration: none;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            }

            .btn-secondary:hover {
                background: #fafafa;
                border-color: #3b82f6;
                color: #3b82f6;
                transform: translateY(-2px);
            }

            /* ================= STAT CARDS ================= */
            .stats-section {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 1.5rem;
                max-width: 1000px;
                margin: auto;
                padding: 0 2rem;
                animation: fadeUp 0.8s ease 0.4s both;
            }

            .stat-card {
                background: rgba(255, 255, 255, 0.95);
                border-radius: 16px;
                padding: 1.5rem;
                display: flex;
                align-items: center;
                gap: 1.25rem;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06);
                transition: all 0.3s ease;
                border: 1px solid rgba(255, 255, 255, 0.8);
            }

            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            }

            .stat-icon {
                width: 60px;
                height: 60px;
                border-radius: 14px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                flex-shrink: 0;
            }

            .stat-icon.pink {
                background: linear-gradient(135deg, #fce7f3 0%, #fbcfe8 100%);
                color: #ec4899;
            }

            .stat-icon.orange {
                background: linear-gradient(135deg, #ffedd5 0%, #fed7aa 100%);
                color: #f59e0b;
            }

            .stat-icon.green {
                background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
                color: #3b82f6;
            }

            .stat-icon.blue {
                background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
                color: #3b82f6;
            }

            .stat-content {
                flex: 1;
                min-width: 0;
            }

            .stat-number {
                font-size: 1.75rem;
                font-weight: 700;
                color: #1f2937;
                margin-bottom: 0.25rem;
            }

            .stat-label {
                color: #6b7280;
                font-size: 0.9375rem;
                font-weight: 500;
            }

            .stat-badge {
                font-size: 0.75rem;
                padding: 0.25rem 0.625rem;
                border-radius: 6px;
                font-weight: 500;
                margin-top: 0.5rem;
                display: inline-block;
            }

            .stat-badge.green {
                background: #dbeafe;
                color: #2563eb;
            }

            .stat-badge.blue {
                background: #dbeafe;
                color: #2563eb;
            }

            /* ================= FOOTER ================= */
            .footer {
                background: rgba(255, 255, 255, 0.8);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border-top: 1px solid rgba(0, 0, 0, 0.05);
                padding: 1.5rem;
                text-align: center;
                margin-top: 5rem;
            }

            .footer-text {
                color: #6b7280;
                font-size: 0.9375rem;
            }

            /* ================= RESPONSIVE - TABLET (768px) ================= */
            @media (max-width: 768px) {
                .header {
                    padding: 0.75rem 1rem;
                }

                .mobile-menu-toggle {
                    display: flex;
                }

                .mobile-overlay {
                    display: block;
                }

                .nav-buttons {
                    position: fixed;
                    top: 0;
                    right: -280px;
                    width: 280px;
                    height: 100vh;
                    background: rgba(255, 255, 255, 0.98);
                    backdrop-filter: blur(20px);
                    -webkit-backdrop-filter: blur(20px);
                    flex-direction: column;
                    justify-content: flex-start;
                    align-items: stretch;
                    padding: 5rem 1.5rem 2rem;
                    gap: 0.75rem;
                    box-shadow: -5px 0 30px rgba(0, 0, 0, 0.1);
                    transition: right 0.3s ease;
                    z-index: 100;
                    overflow-y: auto;
                }

                .nav-buttons.active {
                    right: 0;
                }

                .btn-nav,
                .btn-nav-primary {
                    width: 100%;
                    padding: 1rem 1.5rem;
                    font-size: 1rem;
                    text-align: center;
                    justify-content: center;
                }

                .main-heading {
                    font-size: 2.25rem;
                }

                .hero-section {
                    padding: 2.5rem 1.25rem 3rem;
                }

                .tagline {
                    font-size: 0.875rem;
                    padding: 0.5rem 1rem;
                    margin-bottom: 1.5rem;
                }

                .subtitle {
                    font-size: 1rem;
                    margin-bottom: 2rem;
                    padding: 0 0.5rem;
                }

                .cta-buttons {
                    flex-direction: column;
                    padding: 0;
                    gap: 0.875rem;
                    margin-bottom: 3rem;
                }

                .btn-primary,
                .btn-secondary {
                    width: 100%;
                    justify-content: center;
                    padding: 1rem 1.5rem;
                    font-size: 1rem;
                }

                .stats-section {
                    grid-template-columns: 1fr;
                    padding: 0 1rem;
                    gap: 1rem;
                }

                .stat-card {
                    padding: 1.25rem;
                }

                .stat-icon {
                    width: 54px;
                    height: 54px;
                    font-size: 1.35rem;
                }

                .stat-number {
                    font-size: 1.5rem;
                }

                .stat-label {
                    font-size: 0.875rem;
                }

                .footer {
                    margin-top: 3rem;
                    padding: 1.25rem 1rem;
                }

                .footer-text {
                    font-size: 0.875rem;
                }

                /* Adjust blobs for mobile */
                .bg-blob.purple {
                    width: 300px;
                    height: 300px;
                    top: -100px;
                    right: -80px;
                }

                .bg-blob.pink {
                    width: 250px;
                    height: 250px;
                    bottom: -80px;
                    left: -80px;
                }

                .bg-blob.blue {
                    width: 200px;
                    height: 200px;
                }
            }

            /* ================= RESPONSIVE - SMALL TABLET (600px) ================= */
            @media (max-width: 600px) {
                .main-heading {
                    font-size: 2rem;
                }

                .site-title {
                    font-size: 1.25rem;
                }

                .logo-icon {
                    width: 38px;
                    height: 38px;
                    font-size: 1.125rem;
                }

                .hero-section {
                    padding: 2rem 1rem 2.5rem;
                }

                .subtitle {
                    font-size: 0.9375rem;
                    line-height: 1.6;
                }

                .stat-card {
                    padding: 1rem;
                    gap: 1rem;
                }

                .stat-icon {
                    width: 50px;
                    height: 50px;
                    font-size: 1.25rem;
                }

                .stat-number {
                    font-size: 1.375rem;
                }

                .stat-badge {
                    font-size: 0.6875rem;
                    padding: 0.2rem 0.5rem;
                }
            }

            /* ================= RESPONSIVE - MOBILE LARGE (480px) ================= */
            @media (max-width: 480px) {
                .header {
                    padding: 0.625rem 0.875rem;
                }

                .logo-container {
                    gap: 0.5rem;
                }

                .site-title {
                    font-size: 1.125rem;
                }

                .logo-icon {
                    width: 36px;
                    height: 36px;
                    font-size: 1rem;
                    border-radius: 8px;
                }

                .nav-buttons {
                    width: 100%;
                    right: -100%;
                    padding: 4.5rem 1.25rem 2rem;
                }

                .main-heading {
                    font-size: 1.75rem;
                    line-height: 1.2;
                    margin-bottom: 1rem;
                }

                .hero-section {
                    padding: 1.75rem 0.875rem 2rem;
                }

                .tagline {
                    font-size: 0.8125rem;
                    padding: 0.4375rem 0.875rem;
                    margin-bottom: 1.25rem;
                }

                .subtitle {
                    font-size: 0.875rem;
                    margin-bottom: 1.75rem;
                    line-height: 1.55;
                }

                .cta-buttons {
                    gap: 0.75rem;
                    margin-bottom: 2.5rem;
                }

                .btn-primary,
                .btn-secondary {
                    padding: 0.875rem 1.25rem;
                    font-size: 0.9375rem;
                    border-radius: 10px;
                }

                .btn-primary i {
                    font-size: 0.875rem;
                }

                .stats-section {
                    padding: 0 0.875rem;
                    gap: 0.875rem;
                }

                .stat-card {
                    padding: 1rem;
                    border-radius: 14px;
                    gap: 0.875rem;
                }

                .stat-icon {
                    width: 48px;
                    height: 48px;
                    font-size: 1.125rem;
                    border-radius: 12px;
                }

                .stat-number {
                    font-size: 1.25rem;
                }

                .stat-label {
                    font-size: 0.8125rem;
                }

                .stat-badge {
                    font-size: 0.625rem;
                    padding: 0.1875rem 0.4375rem;
                }

                .footer {
                    margin-top: 2.5rem;
                    padding: 1rem 0.875rem;
                }

                .footer-text {
                    font-size: 0.8125rem;
                }

                /* Smaller blobs on mobile */
                .bg-blob.purple {
                    width: 200px;
                    height: 200px;
                    top: -60px;
                    right: -60px;
                }

                .bg-blob.pink {
                    width: 180px;
                    height: 180px;
                    bottom: -50px;
                    left: -50px;
                }

                .bg-blob.blue {
                    width: 150px;
                    height: 150px;
                }
            }

            /* ================= RESPONSIVE - MOBILE SMALL (375px) ================= */
            @media (max-width: 375px) {
                .header {
                    padding: 0.5rem 0.75rem;
                }

                .site-title {
                    font-size: 1rem;
                }

                .logo-icon {
                    width: 34px;
                    height: 34px;
                    font-size: 0.9375rem;
                }

                .mobile-menu-toggle {
                    width: 40px;
                    height: 40px;
                }

                .mobile-menu-toggle span {
                    width: 22px;
                    height: 2.5px;
                    margin: 2.5px 0;
                }

                .main-heading {
                    font-size: 1.5rem;
                }

                .hero-section {
                    padding: 1.5rem 0.75rem 1.75rem;
                }

                .tagline {
                    font-size: 0.75rem;
                    padding: 0.375rem 0.75rem;
                }

                .subtitle {
                    font-size: 0.8125rem;
                    margin-bottom: 1.5rem;
                }

                .cta-buttons {
                    margin-bottom: 2rem;
                }

                .btn-primary,
                .btn-secondary {
                    padding: 0.8125rem 1rem;
                    font-size: 0.875rem;
                }

                .stat-card {
                    padding: 0.875rem;
                }

                .stat-icon {
                    width: 44px;
                    height: 44px;
                    font-size: 1rem;
                }

                .stat-number {
                    font-size: 1.125rem;
                }

                .stat-label {
                    font-size: 0.75rem;
                }

                .footer-text {
                    font-size: 0.75rem;
                }
            }

            /* ================= RESPONSIVE - EXTRA SMALL (320px) ================= */
            @media (max-width: 320px) {
                .header {
                    padding: 0.5rem 0.625rem;
                }

                .logo-container {
                    gap: 0.375rem;
                }

                .site-title {
                    font-size: 0.9375rem;
                }

                .logo-icon {
                    width: 32px;
                    height: 32px;
                    font-size: 0.875rem;
                }

                .main-heading {
                    font-size: 1.375rem;
                }

                .hero-section {
                    padding: 1.25rem 0.625rem 1.5rem;
                }

                .tagline {
                    font-size: 0.6875rem;
                    padding: 0.3125rem 0.625rem;
                }

                .subtitle {
                    font-size: 0.75rem;
                    line-height: 1.5;
                }

                .btn-primary,
                .btn-secondary {
                    padding: 0.75rem 0.875rem;
                    font-size: 0.8125rem;
                }

                .stats-section {
                    padding: 0 0.625rem;
                    gap: 0.75rem;
                }

                .stat-card {
                    padding: 0.75rem;
                    border-radius: 12px;
                    gap: 0.75rem;
                }

                .stat-icon {
                    width: 40px;
                    height: 40px;
                    font-size: 0.9375rem;
                    border-radius: 10px;
                }

                .stat-number {
                    font-size: 1rem;
                }

                .stat-label {
                    font-size: 0.6875rem;
                }

                .stat-badge {
                    font-size: 0.5625rem;
                }

                .footer {
                    margin-top: 2rem;
                    padding: 0.875rem 0.625rem;
                }

                .footer-text {
                    font-size: 0.6875rem;
                }

                /* Minimal blobs on very small screens */
                .bg-blob.purple,
                .bg-blob.pink,
                .bg-blob.blue {
                    opacity: 0.25;
                }

                .bg-blob.purple {
                    width: 150px;
                    height: 150px;
                }

                .bg-blob.pink {
                    width: 120px;
                    height: 120px;
                }

                .bg-blob.blue {
                    width: 100px;
                    height: 100px;
                }
            }

            /* Prevent body scroll when mobile menu is open */
            body.menu-open {
                overflow: hidden;
            }

            /* Touch-friendly improvements */
            @media (hover: none) and (pointer: coarse) {

                .btn-nav:active,
                .btn-nav-primary:active,
                .btn-primary:active,
                .btn-secondary:active {
                    transform: scale(0.98);
                }

                .stat-card:active {
                    transform: scale(0.99);
                }
            }

            /* Landscape orientation on mobile */
            @media (max-width: 812px) and (orientation: landscape) {
                .hero-section {
                    padding: 1.5rem 2rem 2rem;
                }

                .main-heading {
                    font-size: 1.75rem;
                    margin-bottom: 1rem;
                }

                .tagline {
                    margin-bottom: 1rem;
                }

                .subtitle {
                    margin-bottom: 1.5rem;
                }

                .cta-buttons {
                    flex-direction: row;
                    margin-bottom: 2rem;
                }

                .btn-primary,
                .btn-secondary {
                    width: auto;
                }

                .stats-section {
                    grid-template-columns: repeat(3, 1fr);
                }

                .nav-buttons {
                    height: 100vh;
                    width: 250px;
                    padding-top: 4rem;
                }
            }
        </style>
    </head>

    <body>
        <div class="bg-blob purple"></div>
        <div class="bg-blob pink"></div>
        <div class="bg-blob blue"></div>

        <form id="form1" runat="server">

            <!-- Mobile Overlay -->
            <div class="mobile-overlay" id="mobileOverlay"></div>

            <!-- HEADER -->
            <header class="header">
                <div class="header-container">
                    <div class="logo-container">
                        <div class="logo-icon"><i class="fas fa-graduation-cap"></i></div>
                        <h1 class="site-title">IQ Portal</h1>
                    </div>

                    <div class="nav-buttons" id="navButtons">
                        <asp:LinkButton ID="btnAbout" runat="server" CssClass="btn-nav" Text="About"
                            OnClick="btnAbout_Click" />

                        <asp:LinkButton ID="btnLoginNav" runat="server" CssClass="btn-nav" Text="Login"
                            OnClick="btnLoginNav_Click" />

                        <asp:LinkButton ID="btnRegisterNav" runat="server" CssClass="btn-nav-primary" Text="Register"
                            OnClick="btnRegisterNav_Click" />
                    </div>

                    <!-- Mobile Menu Toggle -->
                    <button class="mobile-menu-toggle" id="mobileMenuToggle" type="button"
                        aria-label="Toggle navigation menu">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                </div>
            </header>

            <!-- HERO -->
            <section class="hero-section">
                <div class="tagline">
                    🎯 Ace your next interview
                </div>

                <h2 class="main-heading">
                    Master Interview Questions<br />
                    with <span class="highlight">Confidence</span>
                </h2>

                <p class="subtitle">
                    Practice MCQs from top companies, take quizzes and mock tests,
                    track your progress, and prepare smarter for your dream job.
                </p>

                <div class="cta-buttons">
                    <asp:LinkButton ID="btnGetStarted" runat="server" CssClass="btn-primary"
                        OnClick="btnGetStarted_Click">
                        Get Started Free <i class="fas fa-arrow-right"></i>
                    </asp:LinkButton>

                    <asp:LinkButton ID="btnHaveAccount" runat="server" CssClass="btn-secondary" Text="I have an account"
                        OnClick="btnHaveAccount_Click" />
                </div>

                <!-- Stats Section -->
                <div class="stats-section">
                    <div class="stat-card">
                        <div class="stat-icon pink">
                            <i class="fas fa-question-circle"></i>
                        </div>
                        <div class="stat-content">
                            <div class="stat-number">10K+</div>
                            <div class="stat-label">Practice Questions</div>
                            <span class="stat-badge green">+8% from yesterday</span>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon orange">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-content">
                            <div class="stat-number">5K+</div>
                            <div class="stat-label">Active Users</div>
                            <span class="stat-badge green">+5% from yesterday</span>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon green">
                            <i class="fas fa-building"></i>
                        </div>
                        <div class="stat-content">
                            <div class="stat-number">100+</div>
                            <div class="stat-label">Top Companies</div>
                            <span class="stat-badge blue">Growing daily</span>
                        </div>
                    </div>
                </div>
            </section>

            <!-- FOOTER -->
            <footer class="footer">
                <p class="footer-text">
                    © 2025 Interview Question Portal. All rights reserved.
                </p>
            </footer>

        </form>

        <!-- Mobile Menu JavaScript -->
        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', function () {
                const mobileMenuToggle = document.getElementById('mobileMenuToggle');
                const navButtons = document.getElementById('navButtons');
                const mobileOverlay = document.getElementById('mobileOverlay');
                const body = document.body;

                // Toggle mobile menu
                function toggleMobileMenu() {
                    const isOpen = navButtons.classList.contains('active');

                    if (isOpen) {
                        closeMobileMenu();
                    } else {
                        openMobileMenu();
                    }
                }

                // Open mobile menu
                function openMobileMenu() {
                    navButtons.classList.add('active');
                    mobileMenuToggle.classList.add('active');
                    mobileOverlay.classList.add('active');
                    body.classList.add('menu-open');
                }

                // Close mobile menu
                function closeMobileMenu() {
                    navButtons.classList.remove('active');
                    mobileMenuToggle.classList.remove('active');
                    mobileOverlay.classList.remove('active');
                    body.classList.remove('menu-open');
                }

                // Event listeners
                if (mobileMenuToggle) {
                    mobileMenuToggle.addEventListener('click', function (e) {
                        e.preventDefault();
                        toggleMobileMenu();
                    });
                }

                // Close menu when clicking overlay
                if (mobileOverlay) {
                    mobileOverlay.addEventListener('click', closeMobileMenu);
                }

                // Close menu on escape key
                document.addEventListener('keydown', function (e) {
                    if (e.key === 'Escape' && navButtons.classList.contains('active')) {
                        closeMobileMenu();
                    }
                });

                // Close menu when clicking nav links (for better UX)
                const navLinks = navButtons.querySelectorAll('.btn-nav, .btn-nav-primary');
                navLinks.forEach(function (link) {
                    link.addEventListener('click', function () {
                        // Small delay to allow link action
                        setTimeout(closeMobileMenu, 100);
                    });
                });

                // Handle window resize
                let resizeTimer;
                window.addEventListener('resize', function () {
                    clearTimeout(resizeTimer);
                    resizeTimer = setTimeout(function () {
                        if (window.innerWidth > 768) {
                            closeMobileMenu();
                        }
                    }, 100);
                });
            });
        </script>

    </body>

    </html>