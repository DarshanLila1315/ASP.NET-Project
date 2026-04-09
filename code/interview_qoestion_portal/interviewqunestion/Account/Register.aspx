<%@ Page Title="Register" Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs"
    Inherits="interviewqunestion.Account.Register" %>

    <!DOCTYPE html>
    <html lang="en">

    <head runat="server">
        <title>Create Account - IQ Portal</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta name="description"
            content="Create your IQ Portal account and start your learning journey with 10K+ interview questions." />
        <meta name="theme-color" content="#2563eb" />
        <link rel="icon" type="image/png" href="../img/logo.png" />
        <link rel="shortcut icon" href="../favicon.ico" />

        <!-- Preconnect for performance -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Poppins:wght@600;700;800&display=swap"
            rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

        <!-- Responsive Design System -->
        <link rel="stylesheet" href="~/Styles/Responsive.css" />

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

            /* ==========================================================================
           REGISTER PAGE - PIXEL PERFECT RESPONSIVE STYLES
           ========================================================================== */

            :root {
                /* Color System */
                --primary-50: #eff6ff;
                --primary-100: #dbeafe;
                --primary-200: #bfdbfe;
                --primary-300: #93c5fd;
                --primary-400: #60a5fa;
                --primary-500: #3b82f6;
                --primary-600: #2563eb;
                --primary-700: #1d4ed8;
                --primary-800: #1e40af;
                --primary-900: #1e3a8a;

                /* Semantic Colors */
                --accent-color: #2563eb;
                --success-color: #10b981;
                --error-color: #ef4444;
                --warning-color: #f59e0b;

                /* Background */
                --bg-gradient: linear-gradient(135deg, #eff6ff 0%, #dbeafe 50%, #bfdbfe 100%);
                --bg-card: rgba(255, 255, 255, 0.25);
                --bg-card-solid: #ffffff;

                /* Text */
                --text-primary: #1f2937;
                --text-secondary: #4b5563;
                --text-muted: #6b7280;
                --text-light: #9ca3af;

                /* Borders & Shadows */
                --border-light: rgba(255, 255, 255, 0.4);
                --border-subtle: rgba(0, 0, 0, 0.06);
                --shadow-soft: 0 4px 24px rgba(0, 0, 0, 0.06);
                --shadow-medium: 0 8px 32px rgba(0, 0, 0, 0.1);
                --shadow-glow: 0 0 80px rgba(59, 130, 246, 0.15);

                /* Spacing (Fluid) */
                --space-xs: clamp(0.25rem, 0.5vw, 0.5rem);
                --space-sm: clamp(0.5rem, 1vw, 0.75rem);
                --space-md: clamp(0.75rem, 1.5vw, 1rem);
                --space-lg: clamp(1rem, 2vw, 1.5rem);
                --space-xl: clamp(1.5rem, 3vw, 2rem);
                --space-2xl: clamp(2rem, 4vw, 3rem);
                --space-3xl: clamp(3rem, 6vw, 4rem);

                /* Typography (Fluid) */
                --text-xs: clamp(0.6875rem, 0.65rem + 0.2vw, 0.75rem);
                --text-sm: clamp(0.75rem, 0.7rem + 0.25vw, 0.875rem);
                --text-base: clamp(0.875rem, 0.8rem + 0.3vw, 1rem);
                --text-lg: clamp(1rem, 0.9rem + 0.4vw, 1.125rem);
                --text-xl: clamp(1.125rem, 1rem + 0.5vw, 1.25rem);
                --text-2xl: clamp(1.25rem, 1.1rem + 0.6vw, 1.5rem);
                --text-3xl: clamp(1.5rem, 1.3rem + 0.8vw, 1.875rem);
                --text-4xl: clamp(1.75rem, 1.4rem + 1vw, 2.25rem);

                /* Transitions */
                --transition-fast: 150ms cubic-bezier(0.4, 0, 0.2, 1);
                --transition-normal: 250ms cubic-bezier(0.4, 0, 0.2, 1);
                --transition-slow: 400ms cubic-bezier(0.4, 0, 0.2, 1);

                /* Touch Targets */
                --touch-target: 44px;
                --touch-target-comfortable: 48px;

                /* Safe Areas */
                --safe-top: env(safe-area-inset-top, 0px);
                --safe-right: env(safe-area-inset-right, 0px);
                --safe-bottom: env(safe-area-inset-bottom, 0px);
                --safe-left: env(safe-area-inset-left, 0px);
            }

            /* Reset & Base */
            *,
            *::before,
            *::after {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            html {
                -webkit-text-size-adjust: 100%;
                -webkit-tap-highlight-color: transparent;
                scroll-behavior: smooth;
            }

            body {
                width: 100%;
                min-height: 100vh;
                min-height: 100dvh;
                /* Dynamic viewport height for mobile */
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                background: var(--bg-gradient);
                color: var(--text-primary);
                line-height: 1.5;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
                overflow-x: hidden;
            }

            /* Animated Background Blobs */
            .bg-blob {
                position: fixed;
                border-radius: 50%;
                filter: blur(80px);
                z-index: 0;
                pointer-events: none;
                will-change: transform;
            }

            .bg-blob-1 {
                top: -15%;
                right: -10%;
                width: clamp(300px, 50vw, 600px);
                height: clamp(300px, 50vw, 600px);
                background: linear-gradient(135deg, rgba(59, 130, 246, 0.4) 0%, rgba(37, 99, 235, 0.3) 100%);
                animation: floatBlob1 15s ease-in-out infinite;
            }

            .bg-blob-2 {
                bottom: -15%;
                left: -10%;
                width: clamp(280px, 45vw, 550px);
                height: clamp(280px, 45vw, 550px);
                background: linear-gradient(135deg, rgba(37, 99, 235, 0.35) 0%, rgba(147, 197, 253, 0.25) 100%);
                animation: floatBlob2 18s ease-in-out infinite;
            }

            .bg-blob-3 {
                top: 35%;
                right: 5%;
                width: clamp(200px, 35vw, 400px);
                height: clamp(200px, 35vw, 400px);
                background: linear-gradient(135deg, rgba(59, 130, 246, 0.25) 0%, rgba(37, 99, 235, 0.2) 100%);
                animation: floatBlob3 20s ease-in-out infinite;
            }

            @keyframes floatBlob1 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(-30px, 40px) scale(1.05);
                }
            }

            @keyframes floatBlob2 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(40px, -30px) scale(1.08);
                }
            }

            @keyframes floatBlob3 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(-20px, -40px) scale(1.03);
                }
            }

            /* Page Wrapper */
            .page-wrapper {
                position: relative;
                z-index: 1;
                min-height: 100vh;
                min-height: 100dvh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: var(--space-lg);
                padding-top: calc(var(--space-lg) + var(--safe-top));
                padding-bottom: calc(var(--space-lg) + var(--safe-bottom));
                padding-left: calc(var(--space-lg) + var(--safe-left));
                padding-right: calc(var(--space-lg) + var(--safe-right));
            }

            /* Logo Header */
            .logo-header {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                margin-bottom: var(--space-xl);
            }

            .logo-icon {
                width: clamp(40px, 8vw, 52px);
                height: clamp(40px, 8vw, 52px);
                border-radius: clamp(10px, 2vw, 14px);
                background: linear-gradient(135deg, var(--primary-500) 0%, var(--primary-600) 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: clamp(1rem, 2vw, 1.375rem);
                color: white;
                box-shadow: 0 4px 15px rgba(37, 99, 235, 0.35);
                transition: transform var(--transition-normal), box-shadow var(--transition-normal);
            }

            .logo-header:hover .logo-icon {
                transform: scale(1.05);
                box-shadow: 0 6px 20px rgba(37, 99, 235, 0.45);
            }

            .logo-text {
                font-family: 'Poppins', sans-serif;
                font-weight: 700;
                font-size: clamp(1.25rem, 3vw, 1.625rem);
                color: var(--text-primary);
                letter-spacing: -0.01em;
            }

            /* Main Card */
            .combined-card {
                display: flex;
                flex-direction: column;
                background: var(--bg-card);
                backdrop-filter: blur(25px);
                -webkit-backdrop-filter: blur(25px);
                border: 1px solid var(--border-light);
                border-radius: clamp(16px, 3vw, 28px);
                box-shadow: var(--shadow-medium), var(--shadow-glow);
                overflow: hidden;
                width: 100%;
                max-width: 100%;
                animation: fadeInUp 0.5s var(--transition-normal);
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

            /* Form Section */
            .login-section {
                flex: 1;
                padding: var(--space-xl);
                min-width: 0;
            }

            .login-title {
                font-family: 'Poppins', sans-serif;
                font-size: var(--text-4xl);
                font-weight: 800;
                color: var(--text-primary);
                margin-bottom: 0.375rem;
                letter-spacing: -0.02em;
                line-height: 1.2;
            }

            .login-subtitle {
                font-size: var(--text-base);
                color: var(--text-muted);
                margin-bottom: var(--space-xl);
            }

            .login-subtitle .highlight {
                color: var(--accent-color);
                font-weight: 600;
            }

            /* Form Elements */
            .form-row {
                display: flex;
                flex-direction: column;
                gap: 0;
            }

            .form-group {
                margin-bottom: var(--space-lg);
            }

            .form-label {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                font-size: var(--text-sm);
                font-weight: 600;
                color: var(--text-secondary);
                margin-bottom: 0.5rem;
            }

            .form-label i {
                color: var(--primary-500);
                font-size: 0.875em;
            }

            .form-input {
                width: 100%;
                padding: var(--space-md);
                min-height: var(--touch-target-comfortable);
                background: var(--bg-card-solid);
                border: 1px solid #e5e7eb;
                border-radius: clamp(8px, 1.5vw, 12px);
                font-size: 16px;
                /* Prevents iOS zoom */
                color: var(--text-primary);
                font-family: inherit;
                transition: border-color var(--transition-fast), box-shadow var(--transition-fast);
            }

            .form-input:hover {
                border-color: var(--primary-300);
            }

            .form-input:focus {
                outline: none;
                border-color: var(--primary-500);
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.12);
            }

            .form-input::placeholder {
                color: var(--text-light);
            }

            /* Password Input with Toggle */
            .password-wrapper {
                position: relative;
            }

            .password-wrapper .form-input {
                padding-right: 48px;
            }

            .password-toggle {
                position: absolute;
                right: 0;
                top: 0;
                height: 100%;
                width: 48px;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                color: var(--text-muted);
                transition: color var(--transition-fast);
                background: none;
                border: none;
                font-size: 1rem;
            }

            .password-toggle:hover {
                color: var(--primary-600);
            }

            /* Submit Button */
            .submit-btn {
                width: 100%;
                padding: var(--space-md) var(--space-lg);
                min-height: var(--touch-target-comfortable);
                background: linear-gradient(135deg, var(--primary-500) 0%, var(--primary-600) 100%);
                color: white;
                border: none;
                border-radius: clamp(8px, 1.5vw, 12px);
                font-size: var(--text-base);
                font-weight: 600;
                cursor: pointer;
                transition: transform var(--transition-normal), box-shadow var(--transition-normal);
                font-family: inherit;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
                box-shadow: 0 4px 15px rgba(37, 99, 235, 0.3);
                margin-top: var(--space-sm);
            }

            .submit-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(37, 99, 235, 0.4);
            }

            .submit-btn:active {
                transform: translateY(0);
            }

            .submit-btn:disabled {
                opacity: 0.7;
                cursor: not-allowed;
                transform: none;
            }

            /* Signup Link */
            .signup-link {
                text-align: center;
                margin-top: var(--space-lg);
                padding-top: var(--space-lg);
                border-top: 1px solid var(--border-subtle);
                font-size: var(--text-sm);
                color: var(--text-muted);
            }

            .signup-link a {
                color: var(--accent-color);
                font-weight: 600;
                text-decoration: none;
                transition: color var(--transition-fast);
            }

            .signup-link a:hover {
                text-decoration: underline;
            }

            /* Messages */
            .message {
                padding: var(--space-md);
                border-radius: 10px;
                font-size: var(--text-sm);
                margin-bottom: var(--space-lg);
                display: none;
                align-items: center;
                gap: 0.625rem;
                animation: slideIn 0.3s ease;
            }

            @keyframes slideIn {
                from {
                    opacity: 0;
                    transform: translateY(-10px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .message.error {
                background: rgba(239, 68, 68, 0.1);
                border: 1px solid rgba(239, 68, 68, 0.2);
                color: #dc2626;
            }

            .message.success {
                background: rgba(16, 185, 129, 0.1);
                border: 1px solid rgba(16, 185, 129, 0.2);
                color: #059669;
            }

            .message.show {
                display: flex;
            }

            /* Form Steps */
            .form-step {
                display: none;
            }

            .form-step.active {
                display: block;
                animation: fadeIn 0.3s ease;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }

                to {
                    opacity: 1;
                }
            }

            .back-link {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                font-size: var(--text-sm);
                color: var(--text-muted);
                text-decoration: none;
                margin-bottom: var(--space-lg);
                font-weight: 500;
                transition: color var(--transition-fast);
                min-height: var(--touch-target);
            }

            .back-link:hover {
                color: var(--primary-600);
            }

            /* OTP Container */
            .otp-container {
                display: flex;
                gap: clamp(0.5rem, 1.5vw, 0.75rem);
                justify-content: center;
                margin-bottom: var(--space-lg);
            }

            .otp-input {
                width: clamp(40px, 10vw, 52px);
                height: clamp(48px, 12vw, 60px);
                text-align: center;
                font-size: clamp(1.125rem, 2.5vw, 1.375rem);
                font-weight: 700;
                background: var(--bg-card-solid);
                border: 2px solid #e5e7eb;
                border-radius: clamp(8px, 1.5vw, 12px);
                color: var(--text-primary);
                font-family: inherit;
                transition: all var(--transition-fast);
            }

            .otp-input:focus {
                outline: none;
                border-color: var(--primary-500);
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.12);
            }

            .otp-input.filled {
                border-color: var(--primary-400);
                background: var(--primary-50);
            }

            .resend-otp {
                text-align: center;
                font-size: var(--text-sm);
                color: var(--text-muted);
                margin-top: var(--space-md);
            }

            .resend-otp a {
                color: var(--primary-600);
                font-weight: 500;
                text-decoration: none;
                transition: color var(--transition-fast);
            }

            .resend-otp a:hover {
                text-decoration: underline;
            }

            .resend-otp a.disabled {
                color: var(--text-light);
                pointer-events: none;
            }

            /* Info Section */
            .info-section {
                flex: 1;
                background: rgba(255, 255, 255, 0.15);
                padding: var(--space-xl);
                display: flex;
                flex-direction: column;
                justify-content: center;
                min-width: 0;
                border-top: 1px solid rgba(255, 255, 255, 0.2);
            }

            .info-quote {
                font-family: 'Poppins', sans-serif;
                font-size: var(--text-xl);
                font-weight: 600;
                color: var(--text-primary);
                line-height: 1.5;
                margin-bottom: var(--space-md);
                min-height: 80px;
            }

            .info-quote .quote-text {
                transition: opacity var(--transition-slow), text-shadow 0.5s ease;
            }

            .info-quote .quote-text.glow {
                text-shadow: 0 0 20px rgba(59, 130, 246, 0.4);
            }

            /* Typing Cursor */
            .typing-cursor {
                display: inline-block;
                width: 3px;
                height: 1.2em;
                background: var(--primary-500);
                margin-left: 2px;
                vertical-align: text-bottom;
                animation: blink 0.7s infinite;
            }

            @keyframes blink {

                0%,
                50% {
                    opacity: 1;
                }

                51%,
                100% {
                    opacity: 0;
                }
            }

            .quote-author {
                font-size: var(--text-base);
                color: var(--primary-600);
                font-weight: 600;
                margin-bottom: var(--space-xl);
                opacity: 0;
                transform: translateY(10px);
                transition: opacity 0.5s ease, transform 0.5s ease;
            }

            .quote-author.visible {
                opacity: 1;
                transform: translateY(0);
            }

            /* Stats Row */
            .stats-row {
                display: flex;
                gap: clamp(1.5rem, 4vw, 2.5rem);
                flex-wrap: wrap;
            }

            .stat-item {
                text-align: left;
            }

            .stat-number {
                font-family: 'Poppins', sans-serif;
                font-size: clamp(1.375rem, 3vw, 1.875rem);
                font-weight: 800;
                color: var(--primary-600);
                line-height: 1;
            }

            .stat-label {
                font-size: var(--text-sm);
                color: var(--text-muted);
                font-weight: 500;
                margin-top: 0.25rem;
            }

            /* Loading Overlay */
            .loading-overlay {
                display: none;
                position: fixed;
                inset: 0;
                background: rgba(255, 255, 255, 0.9);
                backdrop-filter: blur(8px);
                -webkit-backdrop-filter: blur(8px);
                z-index: 2000;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                gap: var(--space-md);
            }

            .loading-overlay.active {
                display: flex;
            }

            .spinner {
                width: clamp(40px, 8vw, 52px);
                height: clamp(40px, 8vw, 52px);
                border: 4px solid rgba(59, 130, 246, 0.2);
                border-top-color: var(--primary-600);
                border-radius: 50%;
                animation: spin 0.8s linear infinite;
            }

            @keyframes spin {
                to {
                    transform: rotate(360deg);
                }
            }

            .loading-text {
                font-size: var(--text-base);
                color: var(--text-muted);
                font-weight: 500;
            }

            /* ============================================
           RESPONSIVE BREAKPOINTS
           ============================================ */

            /* Extra Small Devices (iPhone SE, older phones) - Under 375px */
            @media (max-width: 374px) {
                .page-wrapper {
                    padding: var(--space-md);
                }

                .login-section,
                .info-section {
                    padding: var(--space-lg);
                }

                .login-title {
                    font-size: var(--text-2xl);
                }

                .otp-container {
                    gap: 0.35rem;
                }

                .otp-input {
                    width: 36px;
                    height: 44px;
                    font-size: 1rem;
                }

                .stats-row {
                    gap: 1rem;
                }

                .stat-number {
                    font-size: 1.25rem;
                }
            }

            /* Small Mobile (375px - 479px) */
            @media (min-width: 375px) and (max-width: 479px) {

                .login-section,
                .info-section {
                    padding: var(--space-lg);
                }

                .form-row {
                    flex-direction: column;
                }
            }

            /* Mobile Landscape / Large Phones (480px - 639px) */
            @media (min-width: 480px) and (max-width: 639px) {
                .combined-card {
                    max-width: 480px;
                }

                .form-row {
                    flex-direction: row;
                    gap: var(--space-md);
                }

                .form-row .form-group {
                    flex: 1;
                }
            }

            /* Tablet Portrait (640px - 767px) */
            @media (min-width: 640px) and (max-width: 767px) {
                .combined-card {
                    max-width: 580px;
                }

                .form-row {
                    flex-direction: row;
                    gap: var(--space-lg);
                }

                .form-row .form-group {
                    flex: 1;
                }

                .login-section,
                .info-section {
                    padding: var(--space-2xl);
                }
            }

            /* Tablet Landscape / Small Laptops (768px - 1023px) */
            @media (min-width: 768px) {
                .combined-card {
                    flex-direction: row;
                    max-width: 900px;
                }

                .login-section,
                .info-section {
                    padding: var(--space-2xl);
                }

                .info-section {
                    border-top: none;
                    border-left: 1px solid rgba(255, 255, 255, 0.2);
                }

                .info-quote {
                    font-size: var(--text-2xl);
                    min-height: 100px;
                }

                .form-row {
                    flex-direction: row;
                    gap: var(--space-lg);
                }

                .form-row .form-group {
                    flex: 1;
                }
            }

            /* Desktop (1024px - 1279px) */
            @media (min-width: 1024px) {
                .combined-card {
                    max-width: 980px;
                }

                .login-section {
                    padding: var(--space-2xl) var(--space-3xl);
                }

                .info-section {
                    padding: var(--space-2xl) var(--space-3xl);
                }

                .login-title {
                    font-size: 2.125rem;
                }

                .submit-btn:hover {
                    transform: translateY(-3px);
                }
            }

            /* Large Desktop (1280px - 1535px) */
            @media (min-width: 1280px) {
                .combined-card {
                    max-width: 1050px;
                }

                .login-section,
                .info-section {
                    padding: var(--space-3xl);
                }

                .info-quote {
                    font-size: 1.5rem;
                    min-height: 120px;
                }

                .stat-number {
                    font-size: 2rem;
                }
            }

            /* Extra Large Desktop (1536px - 1919px) */
            @media (min-width: 1536px) {
                .combined-card {
                    max-width: 1100px;
                    border-radius: 32px;
                }

                .login-title {
                    font-size: 2.375rem;
                }

                .bg-blob-1 {
                    width: 700px;
                    height: 700px;
                }

                .bg-blob-2 {
                    width: 650px;
                    height: 650px;
                }
            }

            /* Ultra-Wide / 4K (1920px+) */
            @media (min-width: 1920px) {
                .combined-card {
                    max-width: 1200px;
                }

                .login-section,
                .info-section {
                    padding: 4rem;
                }

                .info-quote {
                    font-size: 1.625rem;
                }

                .page-wrapper {
                    padding: 3rem;
                }
            }

            /* Height considerations for small screens */
            @media (max-height: 700px) and (min-width: 768px) {

                .login-section,
                .info-section {
                    padding: var(--space-lg);
                }

                .login-title {
                    margin-bottom: 0.25rem;
                }

                .login-subtitle {
                    margin-bottom: var(--space-lg);
                }

                .form-group {
                    margin-bottom: var(--space-md);
                }
            }

            /* Landscape mobile */
            @media (max-height: 500px) and (orientation: landscape) {
                .page-wrapper {
                    padding: var(--space-md);
                    justify-content: flex-start;
                    padding-top: var(--space-lg);
                }

                .logo-header {
                    margin-bottom: var(--space-md);
                }

                .combined-card {
                    flex-direction: row;
                }

                .info-section {
                    border-top: none;
                    border-left: 1px solid rgba(255, 255, 255, 0.2);
                    min-width: 40%;
                }

                .info-quote {
                    min-height: auto;
                    font-size: var(--text-lg);
                }

                .stats-row {
                    margin-top: var(--space-md);
                }
            }

            /* ============================================
           REDUCED MOTION PREFERENCES
           ============================================ */
            @media (prefers-reduced-motion: reduce) {

                *,
                *::before,
                *::after {
                    animation-duration: 0.01ms !important;
                    animation-iteration-count: 1 !important;
                    transition-duration: 0.01ms !important;
                }

                .bg-blob {
                    animation: none;
                }
            }

            /* ============================================
           HIGH CONTRAST MODE
           ============================================ */
            @media (prefers-contrast: high) {
                .form-input {
                    border-width: 2px;
                    border-color: var(--text-primary);
                }

                .otp-input {
                    border-width: 3px;
                }

                .submit-btn {
                    background: var(--text-primary);
                }
            }

            /* ============================================
           PRINT STYLES
           ============================================ */
            @media print {

                .bg-blob,
                .loading-overlay {
                    display: none !important;
                }

                .combined-card {
                    box-shadow: none;
                    border: 1px solid #ccc;
                }

                body {
                    background: white;
                }
            }
        </style>
    </head>

    <body>
        <!-- Animated Background Blobs -->
        <div class="bg-blob bg-blob-1" aria-hidden="true"></div>
        <div class="bg-blob bg-blob-2" aria-hidden="true"></div>
        <div class="bg-blob bg-blob-3" aria-hidden="true"></div>

        <form id="form1" runat="server">
            <!-- Hidden Fields for Server Communication -->
            <asp:HiddenField ID="hfFirstName" runat="server" />
            <asp:HiddenField ID="hfLastName" runat="server" />
            <asp:HiddenField ID="hfEmail" runat="server" />
            <asp:HiddenField ID="hfPassword" runat="server" />
            <asp:Button ID="btnSubmitInternal" runat="server" OnClick="btnRegister_Click" Style="display: none;" />

            <div class="page-wrapper">
                <!-- Logo -->

                <div class="logo-header">
                    <div class="logo-icon">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <span class="logo-text">IQ Portal</span>
                </div>


                <!-- Main Card -->
                <div class="combined-card">
                    <!-- Left - Register Form -->
                    <div class="login-section">
                        <!-- STEP 1: Register Details -->
                        <div class="form-step active" id="registerStep" role="form" aria-labelledby="registerTitle">
                            <h1 class="login-title" id="registerTitle">Create Account</h1>
                            <p class="login-subtitle">
                                Join us and start your <span class="highlight">learning journey</span>
                            </p>

                            <!-- Messages -->
                            <div class="message error" id="errorMessage" role="alert" aria-live="polite">
                                <i class="fas fa-exclamation-circle" aria-hidden="true"></i>
                                <span></span>
                            </div>
                            <div class="message success" id="successMessage" role="alert" aria-live="polite">
                                <i class="fas fa-check-circle" aria-hidden="true"></i>
                                <span></span>
                            </div>

                            <!-- Name Fields -->
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label" for="firstNameInput">
                                        <i class="fas fa-user" aria-hidden="true"></i>
                                        First Name
                                    </label>
                                    <input type="text" id="firstNameInput" class="form-input" placeholder="Chintan"
                                        autocomplete="given-name" required aria-required="true" />
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="lastNameInput">
                                        <i class="fas fa-user" aria-hidden="true"></i>
                                        Last Name
                                    </label>
                                    <input type="text" id="lastNameInput" class="form-input" placeholder="Kanani"
                                        autocomplete="family-name" required aria-required="true" />
                                </div>
                            </div>

                            <!-- Email -->
                            <div class="form-group">
                                <label class="form-label" for="emailInput">
                                    <i class="fas fa-envelope" aria-hidden="true"></i>
                                    Email Address
                                </label>
                                <input type="email" id="emailInput" class="form-input" placeholder="Chintan@example.com"
                                    autocomplete="email" required aria-required="true" />
                            </div>

                            <!-- Password -->
                            <div class="form-group">
                                <label class="form-label" for="passwordInput">
                                    <i class="fas fa-lock" aria-hidden="true"></i>
                                    Password
                                </label>
                                <div class="password-wrapper">
                                    <input type="password" id="passwordInput" class="form-input"
                                        placeholder="Min. 8 chars, uppercase, number, symbol"
                                        autocomplete="new-password" required aria-required="true"
                                        aria-describedby="passwordHint" />
                                    <button type="button" class="password-toggle" id="togglePasswordBtn"
                                        onclick="togglePasswordVisibility('passwordInput', 'togglePasswordBtn')"
                                        aria-label="Toggle password visibility">
                                        <i class="fas fa-eye" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <span id="passwordHint" class="visually-hidden">
                                    Password must be at least 8 characters with uppercase, lowercase, number, and
                                    special character.
                                </span>
                            </div>

                            <!-- Submit Button -->
                            <button type="button" class="submit-btn" onclick="handleRegister()" id="registerBtn">
                                <span>Continue</span>
                                <i class="fas fa-arrow-right" aria-hidden="true"></i>
                            </button>

                            <!-- Login Link -->
                            <p class="signup-link">
                                Already have an account? <a href="Login.aspx">Log in</a>
                            </p>
                        </div>

                        <!-- STEP 2: OTP Verification -->
                        <div class="form-step" id="otpStep" role="form" aria-labelledby="otpTitle">
                            <a href="javascript:void(0)" class="back-link" onclick="showRegisterStep()"
                                aria-label="Go back to registration form">
                                <i class="fas fa-arrow-left" aria-hidden="true"></i>
                                Back
                            </a>

                            <h1 class="login-title" id="otpTitle">Verify Email</h1>
                            <p class="login-subtitle">
                                We sent a code to <span class="highlight" id="otpEmailDisplay"></span>
                            </p>

                            <!-- Messages -->
                            <div class="message error" id="otpErrorMessage" role="alert" aria-live="polite">
                                <i class="fas fa-exclamation-circle" aria-hidden="true"></i>
                                <span></span>
                            </div>
                            <div class="message success" id="otpSuccessMessage" role="alert" aria-live="polite">
                                <i class="fas fa-check-circle" aria-hidden="true"></i>
                                <span></span>
                            </div>

                            <!-- OTP Inputs -->
                            <div class="otp-container" role="group" aria-label="OTP verification code">
                                <input type="text" class="otp-input" maxlength="1" data-index="0" inputmode="numeric"
                                    pattern="[0-9]" aria-label="OTP digit 1" />
                                <input type="text" class="otp-input" maxlength="1" data-index="1" inputmode="numeric"
                                    pattern="[0-9]" aria-label="OTP digit 2" />
                                <input type="text" class="otp-input" maxlength="1" data-index="2" inputmode="numeric"
                                    pattern="[0-9]" aria-label="OTP digit 3" />
                                <input type="text" class="otp-input" maxlength="1" data-index="3" inputmode="numeric"
                                    pattern="[0-9]" aria-label="OTP digit 4" />
                                <input type="text" class="otp-input" maxlength="1" data-index="4" inputmode="numeric"
                                    pattern="[0-9]" aria-label="OTP digit 5" />
                                <input type="text" class="otp-input" maxlength="1" data-index="5" inputmode="numeric"
                                    pattern="[0-9]" aria-label="OTP digit 6" />
                            </div>

                            <!-- Verify Button -->
                            <button type="button" class="submit-btn" onclick="verifyOTP()" id="verifyBtn">
                                <span>Verify & Create Account</span>
                                <i class="fas fa-check" aria-hidden="true"></i>
                            </button>

                            <!-- Resend Link -->
                            <p class="resend-otp">
                                Didn't receive the code?
                                <a href="javascript:void(0)" id="resendLink" onclick="resendOTP()">Resend</a>
                                <span id="resendTimer" aria-live="polite"></span>
                            </p>
                        </div>
                    </div>

                    <!-- Right - Info Panel -->
                    <div class="info-section" aria-label="Inspirational quotes and statistics">
                        <div class="info-quote">
                            <span class="quote-text" id="quoteText">"The beautiful thing about learning is that no one
                                can take it away from you."</span>
                        </div>
                        <div class="quote-author" id="quoteAuthor">— B.B. King</div>

                        <div class="stats-row">
                            <div class="stat-item">
                                <div class="stat-number">10K+</div>
                                <div class="stat-label">Questions</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-number">500+</div>
                                <div class="stat-label">Topics</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-number">50K+</div>
                                <div class="stat-label">Users</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Loading Overlay -->
            <div class="loading-overlay" id="loadingOverlay" role="status" aria-label="Loading">
                <div class="spinner" aria-hidden="true"></div>
                <span class="loading-text">Please wait...</span>
            </div>
        </form>

        <script>
            // ============================================
            // DYNAMIC QUOTES SYSTEM WITH TYPEWRITER EFFECT
            // ============================================
            const quotes = [
                { text: 'The beautiful thing about learning is that no one can take it away from you.', author: 'B.B. King' },
                { text: 'Live as if you were to die tomorrow. Learn as if you were to live forever.', author: 'Mahatma Gandhi' },
                { text: 'Education is the key to unlocking the world, a passport to freedom.', author: 'Oprah Winfrey' },
                { text: 'The more that you read, the more things you will know.', author: 'Dr. Seuss' },
                { text: 'Join our community of lifelong learners today.', author: 'IQ Portal' },
                { text: 'Knowledge creates power. Power breeds ego. Ego blinds wisdom.', author: 'A.S Vala' },
                { text: 'Fall seven times. Stand up eight.', author: 'Y.D Patel' }
            ];

            const quoteElement = document.getElementById('quoteText');
            const authorElement = document.getElementById('quoteAuthor');
            let currentQuoteIndex = 0;
            let quoteInterval; // Define globally

            function getRandomQuote() {
                let newIndex;
                do {
                    newIndex = Math.floor(Math.random() * quotes.length);
                } while (newIndex === currentQuoteIndex && quotes.length > 1);
                currentQuoteIndex = newIndex;
                return quotes[currentQuoteIndex];
            }

            function typeWriter(text, element, callback) {
                let i = 0;
                element.innerHTML = '"<span class="typing-cursor"></span>';

                function type() {
                    if (i < text.length) {
                        element.innerHTML = '"' + text.substring(0, i + 1) + '<span class="typing-cursor"></span>';
                        i++;
                        setTimeout(type, 30 + Math.random() * 20);
                    } else {
                        // Remove cursor and add closing quote with glow
                        element.innerHTML = '"' + text + '"';
                        element.classList.add('glow');
                        setTimeout(() => element.classList.remove('glow'), 2000);
                        if (callback) callback();
                    }
                }
                type();
            }

            function displayQuote() {
                const quote = getRandomQuote();
                authorElement.classList.remove('visible');

                typeWriter(quote.text, quoteElement, () => {
                    authorElement.textContent = '— ' + quote.author;
                    setTimeout(() => authorElement.classList.add('visible'), 400);
                });
            }

            // Initial display and rotation
            document.addEventListener('DOMContentLoaded', function () {
                setTimeout(displayQuote, 600);
                quoteInterval = setInterval(() => {
                    displayQuote();
                }, 8000);
            });

            // ============================================
            // UTILITY FUNCTIONS
            // ============================================
            function showLoading() {
                document.getElementById('loadingOverlay').classList.add('active');
                document.body.style.overflow = 'hidden';
            }

            function hideLoading() {
                document.getElementById('loadingOverlay').classList.remove('active');
                document.body.style.overflow = '';
            }

            function showMessage(elementId, message, isError = true) {
                const element = document.getElementById(elementId);
                if (!element) return;

                element.querySelector('span').textContent = message;
                element.classList.add('show');
                element.classList.toggle('error', isError);
                element.classList.toggle('success', !isError);

                // Auto-hide success messages
                if (!isError) {
                    setTimeout(() => {
                        element.classList.remove('show');
                    }, 5000);
                }
            }

            function hideAllMessages() {
                document.querySelectorAll('.message').forEach(el => el.classList.remove('show'));
            }

            function showRegisterStep() {
                document.querySelectorAll('.form-step').forEach(el => el.classList.remove('active'));
                document.getElementById('registerStep').classList.add('active');
                hideAllMessages();
                document.getElementById('firstNameInput').focus();
            }

            function showOTPStep() {
                document.querySelectorAll('.form-step').forEach(el => el.classList.remove('active'));
                document.getElementById('otpStep').classList.add('active');
                hideAllMessages();

                // Clear and focus OTP inputs
                document.querySelectorAll('.otp-input').forEach(input => {
                    input.value = '';
                    input.classList.remove('filled');
                });
                document.querySelector('.otp-input').focus();
            }

            // ============================================
            // OTP INPUT HANDLING
            // ============================================
            function setupOTPInputs() {
                const inputs = document.querySelectorAll('.otp-input');

                inputs.forEach((input, index) => {
                    // Allow only numbers
                    input.addEventListener('keydown', (e) => {
                        if (e.key >= 0 && e.key <= 9) {
                            input.value = '';
                        }

                        // Handle backspace
                        if (e.key === 'Backspace' && !e.target.value && index > 0) {
                            inputs[index - 1].focus();
                            inputs[index - 1].select();
                        }

                        // Handle arrow keys
                        if (e.key === 'ArrowLeft' && index > 0) {
                            inputs[index - 1].focus();
                        }
                        if (e.key === 'ArrowRight' && index < inputs.length - 1) {
                            inputs[index + 1].focus();
                        }
                    });

                    // Move to next input
                    input.addEventListener('input', (e) => {
                        const value = e.target.value;

                        // Update filled class
                        if (value) {
                            input.classList.add('filled');
                        } else {
                            input.classList.remove('filled');
                        }

                        if (value && index < inputs.length - 1) {
                            inputs[index + 1].focus();
                        }

                        // Auto-submit when all filled
                        if (index === inputs.length - 1 && value) {
                            let otp = '';
                            inputs.forEach(inp => otp += inp.value);
                            if (otp.length === 6) {
                                // Optional: auto-verify
                                // verifyOTP();
                            }
                        }
                    });

                    // Handle paste
                    input.addEventListener('paste', (e) => {
                        e.preventDefault();
                        const pasteData = e.clipboardData.getData('text').replace(/\D/g, '').slice(0, 6).split('');
                        pasteData.forEach((char, i) => {
                            if (inputs[i]) {
                                inputs[i].value = char;
                                inputs[i].classList.add('filled');
                            }
                        });
                        if (inputs[pasteData.length] && pasteData.length < 6) {
                            inputs[pasteData.length].focus();
                        } else if (inputs[5]) {
                            inputs[5].focus();
                        }
                    });

                    // Select on focus
                    input.addEventListener('focus', () => {
                        input.select();
                    });
                });
            }

            // ============================================
            // PASSWORD VISIBILITY TOGGLE
            // ============================================
            function togglePasswordVisibility(inputId, iconId) {
                const input = document.getElementById(inputId);
                const button = document.getElementById(iconId);
                const icon = button.querySelector('i');

                if (input.type === 'password') {
                    input.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                    button.setAttribute('aria-label', 'Hide password');
                } else {
                    input.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                    button.setAttribute('aria-label', 'Show password');
                }
            }

            // ============================================
            // FORM VALIDATION & SUBMISSION
            // ============================================
            async function handleRegister() {
                hideAllMessages();

                const first = document.getElementById('firstNameInput').value.trim();
                const last = document.getElementById('lastNameInput').value.trim();
                const email = document.getElementById('emailInput').value.trim();
                const pass = document.getElementById('passwordInput').value;

                // Validations
                if (!first || !last) {
                    showMessage('errorMessage', 'Please enter your full name.');
                    document.getElementById(first ? 'lastNameInput' : 'firstNameInput').focus();
                    return;
                }

                // Email validation
                const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!email || !emailRegex.test(email)) {
                    showMessage('errorMessage', 'Please enter a valid email address.');
                    document.getElementById('emailInput').focus();
                    return;
                }

                // Strong password validation
                const strongPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                if (!pass || !strongPasswordRegex.test(pass)) {
                    showMessage('errorMessage', 'Password must include: 8+ characters, uppercase, lowercase, number, and special character (@$!%*?&).');
                    document.getElementById('passwordInput').focus();
                    return;
                }

                showLoading();

                try {
                    // Check email availability
                    const response = await fetch('Register.aspx/CheckEmailExists', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ email: email })
                    });

                    const data = await response.json();

                    if (data.d === true) {
                        hideLoading();
                        showMessage('errorMessage', 'This email is already registered. Try logging in instead.');
                    } else {
                        // Email available, send OTP
                        sendVerificationOTP(email);
                    }
                } catch (error) {
                    hideLoading();
                    showMessage('errorMessage', 'Network error. Please check your connection and try again.');
                    console.error('Registration error:', error);
                }
            }

            async function sendVerificationOTP(email) {
                try {
                    const response = await fetch('Register.aspx/SendVerificationOTP', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ email: email })
                    });

                    const data = await response.json();
                    hideLoading();

                    if (data.d.success) {
                        document.getElementById('otpEmailDisplay').textContent = email;
                        showOTPStep();
                        if (data.d.message) showMessage('otpSuccessMessage', data.d.message, false);
                        startResendTimer();
                    } else {
                        showMessage('errorMessage', data.d.message || 'Failed to send verification code.');
                    }
                } catch (error) {
                    hideLoading();
                    showMessage('errorMessage', 'Failed to send verification code. Please try again.');
                    console.error('OTP send error:', error);
                }
            }

            async function verifyOTP() {
                const inputs = document.querySelectorAll('.otp-input');
                let otp = '';
                inputs.forEach(input => otp += input.value);

                if (otp.length < 6) {
                    showMessage('otpErrorMessage', 'Please enter the complete 6-digit code.');
                    return;
                }

                const email = document.getElementById('emailInput').value.trim();
                showLoading();

                try {
                    const response = await fetch('Register.aspx/VerifyOTP', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ email: email, otp: otp })
                    });

                    const data = await response.json();

                    if (data.d.success) {
                        // OTP Verified - Submit Registration
                        document.getElementById('<%= hfFirstName.ClientID %>').value = document.getElementById('firstNameInput').value.trim();
                        document.getElementById('<%= hfLastName.ClientID %>').value = document.getElementById('lastNameInput').value.trim();
                        document.getElementById('<%= hfEmail.ClientID %>').value = email;
                        document.getElementById('<%= hfPassword.ClientID %>').value = document.getElementById('passwordInput').value;

                        document.getElementById('<%= btnSubmitInternal.ClientID %>').click();
                    } else {
                        hideLoading();
                        showMessage('otpErrorMessage', data.d.message || 'Invalid verification code.');

                        // Clear OTP inputs on error
                        inputs.forEach(input => {
                            input.value = '';
                            input.classList.remove('filled');
                        });
                        inputs[0].focus();
                    }
                } catch (error) {
                    hideLoading();
                    showMessage('otpErrorMessage', 'Verification failed. Please try again.');
                    console.error('OTP verification error:', error);
                }
            }

            // ============================================
            // RESEND OTP FUNCTIONALITY
            // ============================================
            let resendTimerId = null;

            function startResendTimer() {
                const link = document.getElementById('resendLink');
                const timerSpan = document.getElementById('resendTimer');
                let timeLeft = 60;

                link.style.display = 'none';
                link.classList.add('disabled');

                if (resendTimerId) clearInterval(resendTimerId);

                resendTimerId = setInterval(() => {
                    timeLeft--;
                    timerSpan.textContent = `(Wait ${timeLeft}s)`;

                    if (timeLeft <= 0) {
                        clearInterval(resendTimerId);
                        timerSpan.textContent = '';
                        link.style.display = 'inline';
                        link.classList.remove('disabled');
                    }
                }, 1000);
            }

            async function resendOTP() {
                const link = document.getElementById('resendLink');
                if (link.classList.contains('disabled')) return;

                const email = document.getElementById('emailInput').value.trim();
                hideAllMessages();
                showLoading();

                try {
                    await sendVerificationOTP(email);
                } catch (error) {
                    hideLoading();
                    showMessage('otpErrorMessage', 'Failed to resend code. Please try again.');
                }
            }

            // ============================================
            // KEYBOARD NAVIGATION
            // ============================================
            function setupKeyboardNavigation() {
                // Enter key to submit on register step
                document.getElementById('passwordInput').addEventListener('keydown', (e) => {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        handleRegister();
                    }
                });

                // Enter key to verify OTP
                document.querySelectorAll('.otp-input').forEach(input => {
                    input.addEventListener('keydown', (e) => {
                        if (e.key === 'Enter') {
                            e.preventDefault();
                            verifyOTP();
                        }
                    });
                });
            }

            // ============================================
            // INITIALIZATION
            // ============================================
            document.addEventListener('DOMContentLoaded', () => {
                // initQuoteRotation(); // Removed as it's handled above
                setupOTPInputs();
                setupKeyboardNavigation();

                // Focus first input
                const firstInput = document.getElementById('firstNameInput');
                if (firstInput && window.innerWidth > 768) {
                    setTimeout(() => firstInput.focus(), 500);
                }
            });

            // Handle visibility change (pause animations when tab is hidden)
            document.addEventListener('visibilitychange', () => {
                if (document.hidden) {
                    clearInterval(quoteInterval);
                } else {
                    displayQuote();
                    quoteInterval = setInterval(displayQuote, 8000);
                }
            });
        </script>
    </body>

    </html>