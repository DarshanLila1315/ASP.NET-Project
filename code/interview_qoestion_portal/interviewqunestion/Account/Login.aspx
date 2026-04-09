<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="interviewqunestion.Account.Login" %>

    <!DOCTYPE html>
    <html>

    <head runat="server">
        <title>Login - IQ Portal</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" type="image/png" href="../img/logo.png" style="width: 100px; height: 100px;" />
        <link rel="shortcut icon" href="../favicon.ico" style="width: 100px; height: 100px;" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Poppins:wght@600;700;800&display=swap"
            rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
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

            :root {
                --primary-500: #3b82f6;
                --primary-600: #2563eb;
                --primary-700: #1d4ed8;
                --accent-color: #2563eb;
                --bg-primary: linear-gradient(135deg, #eff6ff 0%, #dbeafe 50%, #bfdbfe 100%);
                --bg-card: #ffffff;
                --bg-info: rgba(239, 246, 255, 0.7);
                --text-primary: #1f2937;
                --text-secondary: #4b5563;
                --text-muted: #6b7280;
                --border-subtle: rgba(0, 0, 0, 0.06);
                --shadow-card: 0 8px 40px rgba(0, 0, 0, 0.08);
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body,
            html {
                width: 100%;
                min-height: 100vh;
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
                background: var(--bg-primary);
                color: var(--text-primary);
            }

            /* Decorative Background Blobs - Vibrant Colors */
            body::before {
                content: '';
                position: fixed;
                top: -100px;
                right: -50px;
                width: 600px;
                height: 600px;
                background: linear-gradient(135deg, rgba(59, 130, 246, 0.4) 0%, rgba(37, 99, 235, 0.3) 50%, rgba(96, 165, 250, 0.3) 100%);
                border-radius: 50%;
                filter: blur(80px);
                z-index: 0;
                animation: floatBlob1 15s ease-in-out infinite;
            }

            body::after {
                content: '';
                position: fixed;
                bottom: -100px;
                left: -100px;
                width: 550px;
                height: 550px;
                background: linear-gradient(135deg, rgba(37, 99, 235, 0.35) 0%, rgba(59, 130, 246, 0.3) 50%, rgba(147, 197, 253, 0.25) 100%);
                border-radius: 50%;
                filter: blur(80px);
                z-index: 0;
                animation: floatBlob2 18s ease-in-out infinite;
            }

            /* Additional colorful blob */
            .bg-blob-extra {
                position: fixed;
                top: 40%;
                right: 10%;
                width: 400px;
                height: 400px;
                background: linear-gradient(135deg, rgba(59, 130, 246, 0.3) 0%, rgba(37, 99, 235, 0.25) 100%);
                border-radius: 50%;
                filter: blur(70px);
                z-index: 0;
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

            .page-wrapper {
                position: relative;
                z-index: 1;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 2rem;
            }

            /* Logo Header */
            .logo-header {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                margin-bottom: 2rem;
            }

            .logo-icon {
                width: 48px;
                height: 48px;
                border-radius: 14px;
                background: linear-gradient(135deg, var(--primary-500) 0%, var(--primary-600) 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.25rem;
                color: white;
                box-shadow: 0 4px 15px rgba(37, 99, 235, 0.35);
            }

            .logo-text {
                font-family: 'Poppins', sans-serif;
                font-weight: 700;
                font-size: 1.5rem;
                color: var(--text-primary);
            }

            /* Main Combined Card - Enhanced Glassmorphism */
            .combined-card {
                display: flex;
                background: rgba(255, 255, 255, 0.25);
                backdrop-filter: blur(25px);
                -webkit-backdrop-filter: blur(25px);
                border: 1px solid rgba(255, 255, 255, 0.4);
                border-radius: 24px;
                box-shadow:
                    0 8px 32px rgba(0, 0, 0, 0.1),
                    0 0 0 1px rgba(255, 255, 255, 0.1) inset,
                    0 0 80px rgba(139, 92, 246, 0.08);
                overflow: hidden;
                max-width: 950px;
                width: 100%;
                animation: fadeInUp 0.5s ease;
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

            /* Left Section - Login Form */
            .login-section {
                flex: 1;
                padding: 3rem;
                min-width: 0;
                background: transparent;
            }

            .login-title {
                font-family: 'Poppins', sans-serif;
                font-size: 2rem;
                font-weight: 800;
                color: var(--text-primary);
                margin-bottom: 0.5rem;
            }

            .login-subtitle {
                font-size: 1rem;
                color: var(--text-muted);
                margin-bottom: 2rem;
            }

            .login-subtitle .highlight {
                color: var(--accent-color);
                font-weight: 600;
            }

            /* Form Styles */
            .form-group {
                margin-bottom: 1.25rem;
            }

            .form-label {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                font-size: 0.875rem;
                font-weight: 600;
                color: var(--text-secondary);
                margin-bottom: 0.5rem;
            }

            .form-label i {
                color: var(--primary-500);
                font-size: 0.875rem;
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
                transition: color 0.2s ease;
                background: none;
                border: none;
                font-size: 1rem;
            }

            .password-toggle:hover {
                color: var(--primary-600);
            }

            .form-input {
                width: 100%;
                padding: 0.875rem 1rem;
                background: #ffffff;
                border: 1px solid #e5e7eb;
                border-radius: 10px;
                font-size: 0.9375rem;
                color: var(--text-primary);
                font-family: inherit;
                transition: all 0.2s ease;
            }

            .form-input:hover {
                border-color: #c4b5fd;
            }

            .form-input:focus {
                outline: none;
                border-color: var(--primary-500);
                box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.1);
            }

            .form-input::placeholder {
                color: #9ca3af;
            }

            .submit-btn {
                width: 100%;
                padding: 0.875rem 1.5rem;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: white;
                border: none;
                border-radius: 10px;
                font-size: 0.9375rem;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.25s ease;
                font-family: inherit;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
                box-shadow: 0 4px 15px rgba(37, 99, 235, 0.3);
                margin-top: 0.5rem;
            }

            .submit-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(37, 99, 235, 0.4);
            }

            .options-link {
                display: block;
                text-align: center;
                font-size: 0.875rem;
                color: var(--primary-600);
                text-decoration: none;
                margin-top: 1.25rem;
                font-weight: 500;
            }

            .options-link:hover {
                text-decoration: underline;
            }

            .back-link {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                font-size: 0.875rem;
                color: var(--text-muted);
                text-decoration: none;
                margin-bottom: 1.5rem;
                font-weight: 500;
            }

            .back-link:hover {
                color: var(--primary-600);
            }

            .signup-link {
                text-align: center;
                margin-top: 1.5rem;
                padding-top: 1.5rem;
                border-top: 1px solid #f3f4f6;
                font-size: 0.9375rem;
                color: var(--text-muted);
            }

            .signup-link a {
                color: var(--accent-color);
                font-weight: 600;
                text-decoration: none;
            }

            .signup-link a:hover {
                text-decoration: underline;
            }

            /* Messages */
            .message {
                padding: 0.75rem 1rem;
                border-radius: 8px;
                font-size: 0.875rem;
                margin-bottom: 1rem;
                display: none;
                align-items: center;
                gap: 0.5rem;
            }

            .message.error {
                background: rgba(239, 68, 68, 0.1);
                border: 1px solid rgba(239, 68, 68, 0.2);
                color: #dc2626;
            }

            .message.success {
                background: rgba(59, 130, 246, 0.1);
                border: 1px solid rgba(59, 130, 246, 0.2);
                color: #2563eb;
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
            }

            /* OTP Inputs */
            .otp-container {
                display: flex;
                gap: 0.625rem;
                justify-content: center;
                margin-bottom: 1.25rem;
            }

            .otp-input {
                width: 48px;
                height: 56px;
                text-align: center;
                font-size: 1.25rem;
                font-weight: 700;
                background: #ffffff;
                border: 2px solid #e5e7eb;
                border-radius: 10px;
                color: var(--text-primary);
                font-family: inherit;
                transition: all 0.2s ease;
            }

            .otp-input:focus {
                outline: none;
                border-color: var(--primary-500);
                box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.1);
            }

            .resend-otp {
                text-align: center;
                font-size: 0.875rem;
                color: var(--text-muted);
                margin-top: 1rem;
            }

            .resend-otp a {
                color: var(--primary-600);
                font-weight: 500;
                text-decoration: none;
            }

            .resend-otp a.disabled {
                color: #9ca3af;
                pointer-events: none;
            }

            /* Right Section - Info Panel */
            .info-section {
                flex: 1;
                background: rgba(255, 255, 255, 0.15);
                padding: 3rem;
                display: flex;
                flex-direction: column;
                justify-content: center;
                min-width: 0;
                border-left: 1px solid rgba(255, 255, 255, 0.2);
            }

            .info-quote {
                font-family: 'Poppins', sans-serif;
                font-size: 1.375rem;
                font-weight: 600;
                color: var(--text-primary);
                line-height: 1.5;
                margin-bottom: 1rem;
                min-height: 120px;
            }

            .info-quote .quote-text {
                transition: opacity 0.4s ease, text-shadow 0.5s ease;
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
                font-size: 0.9375rem;
                color: var(--primary-600);
                font-weight: 600;
                margin-bottom: 1.5rem;
                opacity: 0;
                transform: translateY(10px);
                transition: opacity 0.5s ease, transform 0.5s ease;
            }

            .quote-author.visible {
                opacity: 1;
                transform: translateY(0);
            }

            /* Stats */
            .stats-row {
                display: flex;
                gap: 2.5rem;
            }

            .stat-item {
                text-align: left;
            }

            .stat-number {
                font-family: 'Poppins', sans-serif;
                font-size: 1.75rem;
                font-weight: 800;
                color: var(--primary-600);
                line-height: 1;
            }

            .stat-label {
                font-size: 0.8125rem;
                color: var(--text-muted);
                font-weight: 500;
                margin-top: 0.25rem;
            }

            /* Loading Overlay */
            .loading-overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(255, 255, 255, 0.85);
                backdrop-filter: blur(8px);
                z-index: 1000;
                justify-content: center;
                align-items: center;
            }

            .loading-overlay.active {
                display: flex;
            }

            .spinner {
                width: 48px;
                height: 48px;
                border: 4px solid rgba(139, 92, 246, 0.2);
                border-top-color: var(--primary-600);
                border-radius: 50%;
                animation: spin 0.8s linear infinite;
            }

            @keyframes spin {
                to {
                    transform: rotate(360deg);
                }
            }

            /* Responsive */
            @media (max-width: 768px) {
                .combined-card {
                    flex-direction: column;
                }

                .info-section {
                    border-left: none;
                    border-top: 1px solid rgba(0, 0, 0, 0.04);
                }

                .login-section,
                .info-section {
                    padding: 2rem;
                }

                .login-title {
                    font-size: 1.75rem;
                }

                .info-quote {
                    font-size: 1.125rem;
                    min-height: auto;
                }

                .stats-row {
                    gap: 1.5rem;
                }

                .stat-number {
                    font-size: 1.5rem;
                }
            }

            @media (max-width: 480px) {
                .page-wrapper {
                    padding: 1rem;
                }

                .login-section,
                .info-section {
                    padding: 1.5rem;
                }

                .combined-card {
                    border-radius: 20px;
                }

                .otp-input {
                    width: 42px;
                    height: 50px;
                    font-size: 1.125rem;
                }
            }
        </style>
    </head>

    <body>
        <form id="form1" runat="server">
            <asp:HiddenField ID="hfRole" runat="server" Value="User" />
            <asp:HiddenField ID="hfEmail" runat="server" />
            <asp:HiddenField ID="hfPassword" runat="server" />
            <asp:Button ID="btnSubmitInternal" runat="server" Style="display: none;" OnClick="btnLogin_Click" />

            <div class="page-wrapper">
                <!-- Extra colorful background blob -->
                <div class="bg-blob-extra"></div>

                <!-- Logo -->
                <div class="logo-header">
                    <div class="logo-icon">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <span class="logo-text">IQ Portal</span>
                </div>

                <!-- Combined Card -->
                <div class="combined-card">
                    <!-- Left - Login Form -->
                    <div class="login-section">
                        <!-- STEP 1: Login -->
                        <div class="form-step active" id="loginStep">
                            <h1 class="login-title">Welcome back</h1>
                            <p class="login-subtitle">Log in to continue your <span class="highlight">learning
                                    journey</span></p>

                            <div class="message error" id="errorMessage"><i class="fas fa-exclamation-circle"></i>
                                <span></span>
                            </div>
                            <div class="message success" id="successMessage"><i class="fas fa-check-circle"></i>
                                <span></span>
                            </div>

                            <div class="form-group">
                                <label class="form-label"><i class="fas fa-envelope"></i> Email Address</label>
                                <input type="email" id="emailInput" class="form-input" placeholder="Enter your email"
                                    autocomplete="email" required />
                            </div>

                            <div class="form-group">
                                <label class="form-label"><i class="fas fa-lock"></i> Password</label>
                                <div class="password-wrapper">
                                    <input type="password" id="passwordInput" class="form-input"
                                        placeholder="Enter your password" autocomplete="current-password" required />
                                    <button type="button" class="password-toggle" id="togglePasswordBtn"
                                        onclick="togglePasswordVisibility('passwordInput', 'togglePasswordBtn')">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>

                            <button type="button" class="submit-btn" onclick="handleLogin()">
                                <span>Continue</span>
                                <i class="fas fa-arrow-right"></i>
                            </button>

                            <a href="javascript:void(0)" class="options-link" onclick="showForgotPasswordStep()">
                                Forgot your password?
                            </a>

                            <asp:Button ID="btnRegister" runat="server" Text="Sign Up"
                                PostBackUrl="~/Account/Register.aspx" CssClass="options-link" CausesValidation="false"
                                formnovalidate
                                Style="margin: 1.5rem auto; display: block; border: none; background: none; color: #2563eb; cursor: pointer;" />

                            <!-- Temp Admin Fix Link -->

                        </div>
                        <!-- STEP 2: Forgot Password -->
                        <div class="form-step" id="forgotStep">
                            <a href="javascript:void(0)" class="back-link" onclick="showLoginStep()">
                                <i class="fas fa-arrow-left"></i> Back to login
                            </a>

                            <h1 class="login-title">Reset password</h1>
                            <p class="login-subtitle">Enter your email to receive a <span class="highlight">verification
                                    code</span></p>

                            <div class="message error" id="forgotErrorMessage"><i class="fas fa-exclamation-circle"></i>
                                <span></span>
                            </div>
                            <div class="message success" id="forgotSuccessMessage"><i class="fas fa-check-circle"></i>
                                <span></span>
                            </div>

                            <div class="form-group">
                                <label class="form-label"><i class="fas fa-envelope"></i> Email Address</label>
                                <input type="email" id="forgotEmailInput" class="form-input"
                                    placeholder="Enter your email" autocomplete="email" required />
                            </div>

                            <button type="button" class="submit-btn" onclick="sendOTP()">
                                <span>Send Code</span>
                                <i class="fas fa-paper-plane"></i>
                            </button>
                        </div>

                        <!-- STEP 3: Enter OTP -->
                        <div class="form-step" id="otpStep">
                            <a href="javascript:void(0)" class="back-link" onclick="showForgotPasswordStep()">
                                <i class="fas fa-arrow-left"></i> Back
                            </a>

                            <h1 class="login-title">Enter code</h1>
                            <p class="login-subtitle">We sent a 6-digit code to <span class="highlight"
                                    id="otpEmailDisplay"></span></p>

                            <div class="message error" id="otpErrorMessage"><i class="fas fa-exclamation-circle"></i>
                                <span></span>
                            </div>
                            <div class="message success" id="otpSuccessMessage"><i class="fas fa-check-circle"></i>
                                <span></span>
                            </div>

                            <div class="otp-container">
                                <input type="text" class="otp-input" maxlength="1" data-index="0" />
                                <input type="text" class="otp-input" maxlength="1" data-index="1" />
                                <input type="text" class="otp-input" maxlength="1" data-index="2" />
                                <input type="text" class="otp-input" maxlength="1" data-index="3" />
                                <input type="text" class="otp-input" maxlength="1" data-index="4" />
                                <input type="text" class="otp-input" maxlength="1" data-index="5" />
                            </div>

                            <button type="button" class="submit-btn" onclick="verifyOTP()">
                                <span>Verify Code</span>
                                <i class="fas fa-check"></i>
                            </button>

                            <p class="resend-otp">
                                Didn't receive the code? <a href="javascript:void(0)" id="resendLink"
                                    onclick="resendOTP()">Resend</a>
                                <span id="resendTimer"></span>
                            </p>
                        </div>

                        <!-- STEP 4: New Password -->
                        <div class="form-step" id="newPasswordStep">
                            <a href="javascript:void(0)" class="back-link" onclick="showOTPStep()">
                                <i class="fas fa-arrow-left"></i> Back
                            </a>

                            <h1 class="login-title">New password</h1>
                            <p class="login-subtitle">Create a <span class="highlight">strong password</span> for your
                                account</p>

                            <div class="message error" id="newPassErrorMessage"><i
                                    class="fas fa-exclamation-circle"></i> <span></span></div>
                            <div class="message success" id="newPassSuccessMessage"><i class="fas fa-check-circle"></i>
                                <span></span>
                            </div>

                            <div class="form-group">
                                <label class="form-label"><i class="fas fa-lock"></i> New Password</label>
                                <input type="password" id="newPasswordInput" class="form-input"
                                    placeholder="Enter new password" autocomplete="new-password" required />
                            </div>

                            <div class="form-group">
                                <label class="form-label"><i class="fas fa-lock"></i> Confirm Password</label>
                                <input type="password" id="confirmPasswordInput" class="form-input"
                                    placeholder="Confirm new password" autocomplete="new-password" required />
                            </div>

                            <button type="button" class="submit-btn" onclick="resetPassword()">
                                <span>Reset Password</span>
                                <i class="fas fa-check"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Right - Info Panel -->
                    <div class="info-section">
                        <div class="info-quote">
                            <span class="quote-text" id="quoteText">"Education is the passport to the future, for
                                tomorrow belongs to those who prepare for it today."</span>
                        </div>
                        <div class="quote-author" id="quoteAuthor">— Malcolm X</div>

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
            <div class="loading-overlay" id="loadingOverlay">
                <div class="spinner"></div>
            </div>
        </form>

        <script>
            // Dynamic Quotes with Typewriter Effect
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
                setInterval(() => {
                    displayQuote();
                }, 8000);
            });

            // State
            let currentEmail = '';
            let currentOTP = '';
            let resendCountdown = 0;

            const hfEmail = document.getElementById('<%= hfEmail.ClientID %>');
            const hfPassword = document.getElementById('<%= hfPassword.ClientID %>');

            function showLoading() {
                document.getElementById('loadingOverlay').classList.add('active');
            }

            function hideLoading() {
                document.getElementById('loadingOverlay').classList.remove('active');
            }

            function showMessage(elementId, message, isError = true) {
                const element = document.getElementById(elementId);
                element.querySelector('span').textContent = message;
                element.classList.add('show');
                element.classList.toggle('error', isError);
                element.classList.toggle('success', !isError);
            }

            function hideAllMessages() {
                document.querySelectorAll('.message').forEach(el => el.classList.remove('show'));
            }

            function showStep(stepId) {
                document.querySelectorAll('.form-step').forEach(step => step.classList.remove('active'));
                document.getElementById(stepId).classList.add('active');
                hideAllMessages();
            }

            function showLoginStep() {
                showStep('loginStep');
                document.getElementById('emailInput').focus();
            }

            function showForgotPasswordStep() {
                showStep('forgotStep');
                document.getElementById('forgotEmailInput').value = document.getElementById('emailInput').value || '';
                document.getElementById('forgotEmailInput').focus();
            }

            function showOTPStep() {
                showStep('otpStep');
                document.getElementById('otpEmailDisplay').textContent = currentEmail;
                document.querySelectorAll('.otp-input')[0].focus();
                startResendTimer();
            }

            function showNewPasswordStep() {
                showStep('newPasswordStep');
                document.getElementById('newPasswordInput').focus();
            }

            // OTP Input Handling
            document.querySelectorAll('.otp-input').forEach((input, index, inputs) => {
                input.addEventListener('input', (e) => {
                    if (e.target.value.length === 1 && index < inputs.length - 1) {
                        inputs[index + 1].focus();
                    }
                });

                input.addEventListener('keydown', (e) => {
                    if (e.key === 'Backspace' && !e.target.value && index > 0) {
                        inputs[index - 1].focus();
                    }
                });

                input.addEventListener('paste', (e) => {
                    e.preventDefault();
                    const paste = (e.clipboardData || window.clipboardData).getData('text');
                    const digits = paste.replace(/\D/g, '').slice(0, 6);
                    digits.split('').forEach((digit, i) => {
                        if (inputs[i]) inputs[i].value = digit;
                    });
                });
            });

            function getOTPValue() {
                return Array.from(document.querySelectorAll('.otp-input')).map(i => i.value).join('');
            }

            function clearOTPInputs() {
                document.querySelectorAll('.otp-input').forEach(i => i.value = '');
            }

            function startResendTimer() {
                resendCountdown = 60;
                const resendLink = document.getElementById('resendLink');
                const timerSpan = document.getElementById('resendTimer');

                resendLink.classList.add('disabled');

                const timer = setInterval(() => {
                    resendCountdown--;
                    timerSpan.textContent = ` (${resendCountdown}s)`;

                    if (resendCountdown <= 0) {
                        clearInterval(timer);
                        resendLink.classList.remove('disabled');
                        timerSpan.textContent = '';
                    }
                }, 1000);
            }

            // API Calls
            function togglePasswordVisibility(inputId, btnId) {
                const input = document.getElementById(inputId);
                const btn = document.getElementById(btnId);
                const icon = btn.querySelector('i');

                if (input.type === 'password') {
                    input.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    input.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            }

            async function handleLogin() {
                hideAllMessages();

                const email = document.getElementById('emailInput').value.trim();
                const password = document.getElementById('passwordInput').value;

                if (!email) {
                    showMessage('errorMessage', 'Please enter your email address.');
                    return;
                }

                // Robust Email Regex (Supports numeric local parts e.g. 23020201082@darshan.ac.in)
                const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                if (!emailRegex.test(email)) {
                    showMessage('errorMessage', 'Please enter a valid email address.');
                    return;
                }

                if (!password) {
                    showMessage('errorMessage', 'Please enter your password.');
                    return;
                }

                showLoading();

                try {
                    const emailCheckResponse = await fetch('Login.aspx/CheckEmailExists', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ email: email })
                    });

                    const emailCheckData = await emailCheckResponse.json();

                    if (!emailCheckData.d.success) {
                        hideLoading();
                        showMessage('errorMessage', emailCheckData.d.message);
                        return;
                    }

                    const credResponse = await fetch('Login.aspx/VerifyCredentials', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ email: email, password: password })
                    });

                    const credData = await credResponse.json();

                    if (credData.d.success) {
                        showMessage('successMessage', 'Login successful! Redirecting...', false);
                        setTimeout(() => {
                            const redirectUrl = credData.d.redirectUrl.replace('~/', '<%= ResolveUrl("~/") %>');
                            window.location.href = redirectUrl;
                        }, 800);
                    } else {
                        hideLoading();
                        showMessage('errorMessage', credData.d.message);
                    }
                } catch (error) {
                    hideLoading();
                    showMessage('errorMessage', 'An error occurred. Please try again.');
                }
            }

            async function sendOTP() {
                hideAllMessages();
                const email = document.getElementById('forgotEmailInput').value.trim();

                // Robust Email Regex
                const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                if (!email || !emailRegex.test(email)) {
                    showMessage('forgotErrorMessage', 'Please enter a valid email address.');
                    return;
                }

                showLoading();
                currentEmail = email;

                try {
                    const response = await fetch('Login.aspx/SendPasswordResetOTP', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ email: email })
                    });

                    const data = await response.json();
                    hideLoading();

                    if (data.d.success) {
                        showOTPStep();
                        showMessage('otpSuccessMessage', 'Code sent successfully!', false);
                    } else {
                        showMessage('forgotErrorMessage', data.d.message);
                    }
                } catch (error) {
                    hideLoading();
                    showMessage('forgotErrorMessage', 'Failed to send code. Please try again.');
                }
            }

            async function resendOTP() {
                if (resendCountdown > 0) return;

                hideAllMessages();
                showLoading();

                try {
                    const response = await fetch('Login.aspx/SendPasswordResetOTP', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ email: currentEmail })
                    });

                    const data = await response.json();
                    hideLoading();

                    if (data.d.success) {
                        clearOTPInputs();
                        showMessage('otpSuccessMessage', 'New code sent!', false);
                        startResendTimer();
                    } else {
                        showMessage('otpErrorMessage', data.d.message);
                    }
                } catch (error) {
                    hideLoading();
                    showMessage('otpErrorMessage', 'Failed to resend code.');
                }
            }

            function verifyOTP() {
                hideAllMessages();
                const otp = getOTPValue();

                if (otp.length !== 6) {
                    showMessage('otpErrorMessage', 'Please enter the complete 6-digit code.');
                    return;
                }

                currentOTP = otp;
                showNewPasswordStep();
            }

            async function resetPassword() {
                hideAllMessages();

                const newPassword = document.getElementById('newPasswordInput').value;
                const confirmPassword = document.getElementById('confirmPasswordInput').value;

                // Strong Password Regex: Min 8 chars, 1 Upper, 1 Lower, 1 Number, 1 Special
                const strongPasswordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

                if (!newPassword || !strongPasswordRegex.test(newPassword)) {
                    showMessage('newPassErrorMessage', 'Password must be at least 8 characters and include uppercase, lowercase, number, and special character.');
                    return;
                }

                if (newPassword !== confirmPassword) {
                    showMessage('newPassErrorMessage', 'Passwords do not match.');
                    return;
                }

                showLoading();

                try {
                    const response = await fetch('Login.aspx/VerifyOTPAndResetPassword', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ email: currentEmail, otp: currentOTP, newPassword: newPassword })
                    });

                    const data = await response.json();
                    hideLoading();

                    if (data.d.success) {
                        showMessage('newPassSuccessMessage', 'Password reset successful!', false);
                        setTimeout(() => {
                            showLoginStep();
                            document.getElementById('emailInput').value = currentEmail;
                            showMessage('successMessage', 'Password reset! Please login with your new password.', false);
                        }, 1500);
                    } else {
                        showMessage('newPassErrorMessage', data.d.message);
                    }
                } catch (error) {
                    hideLoading();
                    showMessage('newPassErrorMessage', 'Failed to reset password.');
                }
            }

            // Enter key handlers
            document.getElementById('emailInput').addEventListener('keypress', (e) => {
                if (e.key === 'Enter') { e.preventDefault(); document.getElementById('passwordInput').focus(); }
            });
            document.getElementById('passwordInput').addEventListener('keypress', (e) => {
                if (e.key === 'Enter') { e.preventDefault(); handleLogin(); }
            });
            document.getElementById('forgotEmailInput').addEventListener('keypress', (e) => {
                if (e.key === 'Enter') { e.preventDefault(); sendOTP(); }
            });
            document.getElementById('confirmPasswordInput').addEventListener('keypress', (e) => {
                if (e.key === 'Enter') { e.preventDefault(); resetPassword(); }
            });

            window.addEventListener('load', () => document.getElementById('emailInput').focus());
        </script>
    </body>

    </html>