<%@ Page Title="User Dashboard" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs" Inherits="interview_questions.User.Dashboard" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <!-- Dashboard Header -->
        <div class="dashboard-header animate-fade-in-up">
            <div class="welcome-section">
                <div class="welcome-badge">
                    <i class="fas fa-sparkles"></i>
                    <span>Welcome back</span>
                </div>
                <h1 class="dashboard-title">
                    <asp:Label ID="lblUser" runat="server" />
                </h1>
                <p class="dashboard-subtitle">Here's what's happening with your learning journey today</p>
            </div>
            <div class="header-actions">
                <a href="Questions.aspx" class="btn btn-primary btn-lg">
                    <i class="fas fa-rocket"></i>
                    Start Practice
                </a>
            </div>
        </div>

        <!-- Stats Grid -->
        <div class="stats-grid">

            <!-- Tests Attempted -->
            <div class="stat-card success animate-fade-in-up stagger-1">
                <div class="stat-header">
                    <div class="stat-icon">
                        <i class="fas fa-clipboard-check"></i>
                    </div>
                    <div class="stat-trend positive">
                        <i class="fas fa-arrow-up"></i>
                        <span>Active</span>
                    </div>
                </div>
                <div class="stat-label">Tests Completed</div>
                <div class="stat-value">
                    <asp:Label ID="lblTests" runat="server" Text="0" />
                </div>
                <div class="stat-footer">
                    <i class="fas fa-chart-line"></i>
                    <span>Keep up the momentum!</span>
                </div>
                <div class="stat-bg-pattern"></div>
            </div>

            <!-- Bookmarks -->
            <div class="stat-card warning animate-fade-in-up stagger-2">
                <div class="stat-header">
                    <div class="stat-icon">
                        <i class="fas fa-bookmark"></i>
                    </div>
                    <div class="stat-trend neutral">
                        <i class="fas fa-star"></i>
                        <span>Saved</span>
                    </div>
                </div>
                <div class="stat-label">Bookmarked Questions</div>
                <div class="stat-value">
                    <asp:Label ID="lblBookmarks" runat="server" Text="0" />
                </div>
                <div class="stat-footer">
                    <i class="fas fa-heart"></i>
                    <span>Questions saved for review</span>
                </div>
                <div class="stat-bg-pattern"></div>
            </div>

            <!-- Progress Card -->
            <div class="stat-card primary animate-fade-in-up stagger-3">
                <div class="stat-header">
                    <div class="stat-icon">
                        <i class="fas fa-trophy"></i>
                    </div>
                    <div class="stat-trend positive">
                        <i class="fas fa-fire"></i>
                        <span>Keep going</span>
                    </div>
                </div>
                <div class="stat-label">Your Progress</div>
                <div class="stat-value progress-ring">
                    <span class="progress-text">Active</span>
                </div>
                <div class="stat-footer">
                    <i class="fas fa-rocket"></i>
                    <span>You're on the right track!</span>
                </div>
                <div class="stat-bg-pattern"></div>
            </div>

        </div>

        <!-- Quick Actions -->
        <div class="quick-actions animate-fade-in-up" style="animation-delay: 0.4s;">
            <h2 class="section-title">
                <i class="fas fa-bolt"></i>
                Quick Actions
            </h2>
            <div class="action-grid">

                <a href="Questions.aspx" class="action-card">
                    <div class="action-icon">
                        <i class="fas fa-code"></i>
                    </div>
                    <div class="action-content">
                        <div class="action-title">Browse Questions</div>
                        <div class="action-description">Explore interview questions from top companies</div>
                    </div>
                    <div class="action-arrow">
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <a href="QuizList.aspx" class="action-card">
                    <div class="action-icon">
                        <i class="fas fa-play-circle"></i>
                    </div>
                    <div class="action-content">
                        <div class="action-title">Take a Quiz</div>
                        <div class="action-description">Test your knowledge with MCQ assessments</div>
                    </div>
                    <div class="action-arrow">
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <a href="Bookmarks.aspx" class="action-card">
                    <div class="action-icon">
                        <i class="fas fa-heart"></i>
                    </div>
                    <div class="action-content">
                        <div class="action-title">Saved Questions</div>
                        <div class="action-description">Review your bookmarked items</div>
                    </div>
                    <div class="action-arrow">
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

                <a href="Results.aspx" class="action-card">
                    <div class="action-icon">
                        <i class="fas fa-chart-bar"></i>
                    </div>
                    <div class="action-content">
                        <div class="action-title">View Results</div>
                        <div class="action-description">Track your performance and scores</div>
                    </div>
                    <div class="action-arrow">
                        <i class="fas fa-arrow-right"></i>
                    </div>
                </a>

            </div>
        </div>

        <!-- Tips Section -->
        <div class="tips-section animate-fade-in-up" style="animation-delay: 0.5s;">
            <div class="tip-card">
                <div class="tip-icon">
                    <i class="fas fa-lightbulb"></i>
                </div>
                <div class="tip-content">
                    <h4>Pro Tip</h4>
                    <p>Practice consistently! Solving 2-3 questions daily is better than cramming before interviews.
                        Build your skills gradually and track your progress over time.</p>
                </div>
            </div>
        </div>

        <style>
            /* Dashboard Enhancements */
            .dashboard-header {
                display: flex;
                align-items: flex-start;
                justify-content: space-between;
                gap: 2rem;
                margin-bottom: 2rem;
                padding-bottom: 1.5rem;
                border-bottom: 1px solid rgba(0, 0, 0, 0.06);
                flex-wrap: wrap;
            }

            .welcome-badge {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.5rem 1rem;
                background: #eff6ff;
                border: 1px solid rgba(59, 130, 246, 0.15);
                border-radius: 999px;
                font-size: 0.8125rem;
                font-weight: 600;
                color: #3b82f6;
                margin-bottom: 0.75rem;
            }

            .welcome-badge i {
                color: #f59e0b;
                animation: sparkle 2s ease-in-out infinite;
            }

            @keyframes sparkle {

                0%,
                100% {
                    transform: scale(1) rotate(0deg);
                    opacity: 1;
                }

                50% {
                    transform: scale(1.2) rotate(10deg);
                    opacity: 0.8;
                }
            }

            .dashboard-title {
                font-size: clamp(1.75rem, 4vw, 2.25rem);
                font-weight: 800;
                margin-bottom: 0.5rem;
                color: #1f2937;
                line-height: 1.2;
            }

            .dashboard-subtitle {
                color: #6b7280;
                font-size: 1rem;
            }

            .header-actions {
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .header-actions .btn-lg {
                padding: 0.875rem 1.75rem;
                font-size: 0.9375rem;
                border-radius: 12px;
            }

            /* Enhanced Stat Cards */
            .stat-card {
                position: relative;
                overflow: hidden;
            }

            .stat-card .stat-header {
                display: flex;
                align-items: flex-start;
                justify-content: space-between;
                margin-bottom: 1.25rem;
            }

            .stat-trend {
                display: flex;
                align-items: center;
                gap: 0.375rem;
                padding: 0.375rem 0.75rem;
                border-radius: 999px;
                font-size: 0.75rem;
                font-weight: 600;
            }

            .stat-trend.positive {
                background: #dbeafe;
                color: #2563eb;
            }

            .stat-trend.neutral {
                background: #fef3c7;
                color: #d97706;
            }

            .stat-bg-pattern {
                position: absolute;
                bottom: -30px;
                right: -30px;
                width: 130px;
                height: 130px;
                background: radial-gradient(circle, rgba(59, 130, 246, 0.04) 0%, transparent 70%);
                border-radius: 50%;
                pointer-events: none;
            }

            .progress-ring {
                display: flex;
                align-items: center;
            }

            .progress-text {
                font-size: 1.5rem;
                font-weight: 700;
                color: #3b82f6;
            }

            /* Tips Section */
            .tips-section {
                margin-top: 2rem;
            }

            @media (max-width: 768px) {
                .dashboard-header {
                    flex-direction: column;
                    align-items: stretch;
                }

                .dashboard-title {
                    font-size: 1.5rem;
                }

                .header-actions {
                    justify-content: flex-start;
                }

                .header-actions .btn-lg {
                    width: 100%;
                    justify-content: center;
                }
            }
        </style>

    </asp:Content>