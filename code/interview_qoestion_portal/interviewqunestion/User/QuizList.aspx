<%@ Page Title="Quizzes" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true"
    CodeBehind="QuizList.aspx.cs" Inherits="interview_questions.User.QuizList" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <link href="../Styles/Premium.css" rel="stylesheet" />

        <div class="quizzes-page">

            <!-- Page Header -->
            <div class="page-header animate-fade-in-up">
                <div class="page-title">
                    <div class="title-icon quizzes">
                        <i class="fas fa-clipboard-check"></i>
                    </div>
                    <div class="title-text">
                        <h1>Available Tests</h1>
                        <p>Practice with curated MCQ assessments</p>
                    </div>
                </div>
                <div class="tests-count-badge">
                    <i class="fas fa-list-check"></i>
                    <asp:Label ID="lblTestCount" runat="server" Text="0 Tests Available" />
                </div>
            </div>

            <!-- Tests Grid -->
            <div class="tests-grid">
                <asp:Repeater ID="rptTests" runat="server">
                    <ItemTemplate>
                        <div class="test-card animate-fade-in-up"
                            style="animation-delay: <%# Container.ItemIndex * 0.1 %>s;">
                            <div class="test-card-header">
                                <div class="test-icon">
                                    <i class="fas fa-file-alt"></i>
                                </div>
                                <div class="test-info">
                                    <h3 class="test-name">
                                        <%# Eval("Test_Name") %>
                                    </h3>
                                    <span class="test-category-badge">
                                        <i class="fas fa-folder"></i>
                                        <%# Eval("Category_Name") %>
                                    </span>
                                </div>
                            </div>

                            <div class="test-stats">
                                <div class="stat-item">
                                    <div class="stat-icon-small">
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="stat-content">
                                        <span class="stat-value">
                                            <%# Eval("TotalMarks") %>
                                        </span>
                                        <span class="stat-label">Total Marks</span>
                                    </div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-icon-small">
                                        <i class="fas fa-clock"></i>
                                    </div>
                                    <div class="stat-content">
                                        <span class="stat-value">
                                            <%# Eval("DurationMinutes") %> min
                                        </span>
                                        <span class="stat-label">Duration</span>
                                    </div>
                                </div>
                            </div>

                            <div class="test-card-footer">
                                <%# Convert.ToInt32(Eval("IsCompleted"))==1
                                    ? "<div class='test-status completed'><i class='fas fa-check-circle'></i><span>Completed</span></div><span class='btn-completed'><i class='fas fa-lock'></i> Done</span>"
                                    : "<div class='test-status ready'><i class='fas fa-play-circle'></i><span>Ready to begin</span></div><a href='QuizAttempt.aspx?testId="
                                    + Eval("Test_ID")
                                    + "' class='btn-start-test'><i class='fas fa-rocket'></i> Start Test</a>" %>
                            </div>

                            <div class="card-glow"></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Empty State -->
            <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
                <div class="empty-state glass-card">
                    <div class="empty-state-icon">
                        <i class="fas fa-clipboard-list"></i>
                    </div>
                    <h3>No tests available</h3>
                    <p>Check back later for new MCQ assessments and practice tests.</p>
                    <a href="Dashboard.aspx" class="btn btn-primary">
                        <i class="fas fa-home"></i>
                        Go to Dashboard
                    </a>
                </div>
            </asp:Panel>

        </div>

        <style>
            .quizzes-page {
                display: flex;
                flex-direction: column;
                gap: 1.5rem;
            }

            /* Page Header */
            .page-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 1rem;
                padding-bottom: 1.5rem;
                border-bottom: 1px solid rgba(0, 0, 0, 0.06);
                flex-wrap: wrap;
            }

            .page-title {
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .title-icon {
                width: 52px;
                height: 52px;
                border-radius: 14px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.375rem;
                color: white;
            }

            .title-icon.quizzes {
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                box-shadow: 0 6px 18px rgba(59, 130, 246, 0.35);
            }

            .title-text h1 {
                font-size: 1.625rem;
                font-weight: 800;
                color: #1f2937;
                margin-bottom: 0.25rem;
            }

            .title-text p {
                color: #6b7280;
                font-size: 0.9375rem;
                margin: 0;
            }

            .tests-count-badge {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.625rem 1rem;
                background: #eff6ff;
                border: 1px solid rgba(59, 130, 246, 0.2);
                border-radius: 10px;
                color: #3b82f6;
                font-size: 0.875rem;
                font-weight: 600;
            }

            /* Tests Grid */
            .tests-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
                gap: 1.25rem;
            }

            /* Test Card */
            .test-card {
                position: relative;
                background: #ffffff;
                border: 1px solid rgba(0, 0, 0, 0.06);
                border-radius: 16px;
                overflow: hidden;
                transition: all 0.25s ease;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
            }

            .test-card:hover {
                border-color: rgba(59, 130, 246, 0.3);
                transform: translateY(-4px);
                box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
            }

            .card-glow {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 3px;
                background: linear-gradient(90deg, #3b82f6, #2563eb);
                opacity: 0;
                transition: opacity 0.25s ease;
            }

            .test-card:hover .card-glow {
                opacity: 1;
            }

            .test-card-header {
                display: flex;
                align-items: flex-start;
                gap: 1rem;
                padding: 1.25rem 1.25rem 0.875rem;
            }

            .test-icon {
                width: 44px;
                height: 44px;
                border-radius: 10px;
                background: #eff6ff;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.125rem;
                color: #3b82f6;
                flex-shrink: 0;
            }

            .test-info {
                flex: 1;
            }

            .test-name {
                font-size: 1.0625rem;
                font-weight: 700;
                color: #1f2937;
                margin-bottom: 0.5rem;
                line-height: 1.4;
            }

            .test-category-badge {
                display: inline-flex;
                align-items: center;
                gap: 0.375rem;
                padding: 0.25rem 0.625rem;
                background: #eff6ff;
                border-radius: 999px;
                font-size: 0.75rem;
                color: #3b82f6;
                font-weight: 500;
            }

            /* Test Stats */
            .test-stats {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 0.875rem;
                padding: 0.875rem 1.25rem;
                background: #f8fafc;
                border-top: 1px solid rgba(0, 0, 0, 0.04);
                border-bottom: 1px solid rgba(0, 0, 0, 0.04);
            }

            .stat-item {
                display: flex;
                align-items: center;
                gap: 0.625rem;
            }

            .stat-icon-small {
                width: 34px;
                height: 34px;
                border-radius: 8px;
                background: #eff6ff;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #3b82f6;
                font-size: 0.875rem;
            }

            .stat-content {
                display: flex;
                flex-direction: column;
            }

            .stat-content .stat-value {
                font-size: 0.9375rem;
                font-weight: 700;
                color: #1f2937;
            }

            .stat-content .stat-label {
                font-size: 0.75rem;
                color: #6b7280;
            }

            /* Test Footer */
            .test-card-footer {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 1rem 1.25rem;
            }

            .test-status {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                font-size: 0.8125rem;
                color: #6b7280;
            }

            .test-status.completed {
                color: #059669;
            }

            .test-status.ready i {
                color: #3b82f6;
            }

            .btn-start-test {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.5rem 1rem;
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                color: white !important;
                font-size: 0.8125rem;
                font-weight: 600;
                border-radius: 8px;
                text-decoration: none;
                transition: all 0.25s ease;
                box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
            }

            .btn-start-test:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 18px rgba(59, 130, 246, 0.4);
            }

            .btn-completed {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.5rem 1rem;
                background: #f1f5f9;
                color: #6b7280;
                font-size: 0.8125rem;
                font-weight: 600;
                border-radius: 8px;
                cursor: not-allowed;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .page-header {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .tests-grid {
                    grid-template-columns: 1fr;
                }
            }
        </style>

    </asp:Content>