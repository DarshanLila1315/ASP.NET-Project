<%@ Page Title="My Results" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true"
    CodeBehind="Results.aspx.cs" Inherits="interviewquestion.User.Results" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div class="results-page">

            <!-- Page Header -->
            <div class="page-header animate-fade-in-up">
                <div class="page-title">
                    <div class="title-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div class="title-text">
                        <h1>My Test Results</h1>
                        <p>Track your performance and review your answers</p>
                    </div>
                </div>
                <div class="header-badge">
                    <i class="fas fa-trophy"></i>
                    <span>Performance Tracker</span>
                </div>
            </div>

            <!-- Results Table -->
            <div class="results-container">
                <asp:Panel ID="pnlResults" runat="server">
                    <div class="table-container glass-card animate-fade-in-up" style="animation-delay: 0.1s;">

                        <!-- Table Header -->
                        <div class="grid-header">
                            <div class="grid-col col-test"><i class="fas fa-file-alt"></i> TEST NAME</div>
                            <div class="grid-col col-score"><i class="fas fa-star"></i> SCORE</div>
                            <div class="grid-col col-total"><i class="fas fa-list"></i> TOTAL</div>
                            <div class="grid-col col-correct"><i class="fas fa-check-circle"></i> CORRECT</div>
                            <div class="grid-col col-wrong"><i class="fas fa-times-circle"></i> WRONG</div>
                            <div class="grid-col col-action"><i class="fas fa-eye"></i> DETAILS</div>
                        </div>

                        <!-- Results Rows -->
                        <asp:Repeater ID="rptResults" runat="server">
                            <ItemTemplate>
                                <div class="result-card">
                                    <!-- Main Row -->
                                    <div class="result-row">
                                        <div class="grid-col col-test">
                                            <div class="test-name-cell">
                                                <div class="test-icon-mini">
                                                    <i class="fas fa-clipboard-check"></i>
                                                </div>
                                                <span>
                                                    <%# Eval("Test_Name") %>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="grid-col col-score">
                                            <span class="score-badge">
                                                <%# Eval("Result_Score") %>
                                            </span>
                                        </div>
                                        <div class="grid-col col-total">
                                            <span class="total-badge">
                                                <%# Eval("Total_Questions") %>
                                            </span>
                                        </div>
                                        <div class="grid-col col-correct">
                                            <span class="correct-badge">
                                                <i class="fas fa-check"></i>
                                                <%# Eval("CorrectAnswers") %>
                                            </span>
                                        </div>
                                        <div class="grid-col col-wrong">
                                            <span class="wrong-badge">
                                                <i class="fas fa-times"></i>
                                                <%# Eval("WrongAnswers") %>
                                            </span>
                                        </div>
                                        <div class="grid-col col-action">
                                            <div class="action-buttons-result">
                                                <button type="button" class="btn-show-answer"
                                                    onclick="showAnswerPopup(this)"
                                                    data-resultid='<%# Eval("Result_ID") %>'
                                                    data-testname='<%# Eval("Test_Name") %>'
                                                    data-total='<%# Eval("Total_Questions") %>'
                                                    data-correct='<%# Eval("CorrectAnswers") %>'
                                                    data-wrong='<%# Eval("WrongAnswers") %>'>
                                                    <i class="fas fa-eye"></i>
                                                    <span class="btn-text">Show Answers</span>
                                                </button>
                                                <button type="button" class="btn-info-result"
                                                    onclick="showResultInfo(this)"
                                                    data-testname='<%# Eval("Test_Name") %>'
                                                    data-score='<%# Eval("Result_Score") %>'
                                                    data-total='<%# Eval("Total_Questions") %>'
                                                    data-correct='<%# Eval("CorrectAnswers") %>'
                                                    data-wrong='<%# Eval("WrongAnswers") %>'>
                                                    <i class="fas fa-info-circle"></i>
                                                    <span class="btn-text">Info</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                </asp:Panel>

                <!-- Empty State -->
                <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
                    <div class="empty-state glass-card animate-fade-in-up">
                        <div class="empty-state-icon">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h3>No test results yet</h3>
                        <p>Take a quiz to see your performance here.</p>
                        <a href="QuizList.aspx" class="btn btn-primary">
                            <i class="fas fa-clipboard-list"></i>
                            Browse Tests
                        </a>
                    </div>
                </asp:Panel>
            </div>

            <!-- Answer Popup Modal -->
            <div id="answerPopup" class="answer-popup-overlay" onclick="closePopupOnOverlay(event)">
                <div class="answer-popup-content">
                    <button type="button" class="popup-close-btn-floating" onclick="closeAnswerPopup()">
                        <i class="fas fa-times"></i>
                    </button>
                    <div class="popup-body">
                        <div class="popup-summary">
                            <div class="summary-card total">
                                <i class="fas fa-question-circle"></i>
                                <div class="summary-info">
                                    <span class="summary-label">Total Questions</span>
                                    <span id="popupTotal" class="summary-value">0</span>
                                </div>
                            </div>
                            <div class="summary-card correct">
                                <i class="fas fa-check-circle"></i>
                                <div class="summary-info">
                                    <span class="summary-label">Correct Answers</span>
                                    <span id="popupCorrect" class="summary-value">0</span>
                                </div>
                            </div>
                            <div class="summary-card wrong">
                                <i class="fas fa-times-circle"></i>
                                <div class="summary-info">
                                    <span class="summary-label">Wrong Answers</span>
                                    <span id="popupWrong" class="summary-value">0</span>
                                </div>
                            </div>
                        </div>
                        <div class="popup-result-message">
                            <i class="fas fa-trophy"></i>
                            <span id="popupMessage">Great job on completing the test!</span>
                        </div>

                        <!-- Questions List -->
                        <div id="questionsList" class="questions-list">
                            <div class="loading-spinner" id="loadingSpinner">
                                <i class="fas fa-spinner fa-spin"></i>
                                <span>Loading questions...</span>
                            </div>
                        </div>
                    </div>
                    <div class="popup-footer">
                        <button type="button" class="btn-close-popup" onclick="closeAnswerPopup()">
                            <i class="fas fa-check"></i>
                            <span>Close</span>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Result Info Modal -->
            <div id="resultInfoModal" class="info-modal">
                <div class="info-modal-content">
                    <div class="info-modal-header">
                        <h3><i class="fas fa-chart-bar"></i> Test Details</h3>
                        <button class="info-modal-close" onclick="closeResultInfo()">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                    <div class="info-modal-body">
                        <div class="info-item">
                            <div class="info-label">
                                <i class="fas fa-clipboard-check"></i>
                                Test Name
                            </div>
                            <div class="info-value-text" id="modalTestName"></div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">
                                <i class="fas fa-star"></i>
                                Score
                            </div>
                            <div class="info-value score" id="modalScore"></div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">
                                <i class="fas fa-list"></i>
                                Total Questions
                            </div>
                            <div class="info-value total" id="modalTotalQuestions"></div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">
                                <i class="fas fa-check-circle"></i>
                                Correct Answers
                            </div>
                            <div class="info-value correct" id="modalCorrectAnswers"></div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">
                                <i class="fas fa-times-circle"></i>
                                Wrong Answers
                            </div>
                            <div class="info-value wrong" id="modalWrongAnswers"></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <style>
            .results-page {
                display: flex;
                flex-direction: column;
                gap: 1.5rem;
            }

            /* Page Header */
            .page-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 1.5rem;
                margin-bottom: 0.5rem;
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
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.375rem;
                color: white;
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

            .header-badge {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.625rem 1rem;
                background: #eff6ff;
                border: 1px solid rgba(59, 130, 246, 0.15);
                border-radius: 10px;
                color: #3b82f6;
                font-size: 0.875rem;
                font-weight: 600;
            }

            /* Table Container */
            .table-container {
                padding: 0;
                overflow: hidden;
                border-radius: 16px;
                background: #ffffff;
                border: 1px solid rgba(0, 0, 0, 0.06);
            }

            /* Grid Header */
            .grid-header {
                display: grid;
                grid-template-columns: 2fr 1fr 1fr 1fr 1fr 1.2fr;
                gap: 1rem;
                padding: 1rem 1.5rem;
                background: #f8fafc;
                border-bottom: 1px solid rgba(0, 0, 0, 0.06);
            }

            .grid-col {
                font-weight: 600;
                font-size: 0.75rem;
                color: #6b7280;
                text-transform: uppercase;
                letter-spacing: 0.05em;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .grid-col i {
                color: #3b82f6;
            }

            /* Result Card */
            .result-card {
                border-bottom: 1px solid rgba(0, 0, 0, 0.04);
            }

            .result-card:last-child {
                border-bottom: none;
            }

            /* Result Row */
            .result-row {
                display: grid;
                grid-template-columns: 2fr 1fr 1fr 1fr 1fr 1.2fr;
                gap: 1rem;
                padding: 1rem 1.5rem;
                cursor: pointer;
                transition: all 0.2s ease;
                align-items: center;
            }

            .result-row:hover {
                background: #f8fafc;
            }

            /* Test Name Cell */
            .test-name-cell {
                display: flex;
                align-items: center;
                gap: 0.75rem;
            }

            .test-icon-mini {
                width: 40px;
                height: 40px;
                border-radius: 10px;
                background: #eff6ff;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #3b82f6;
                font-size: 1rem;
            }

            .test-name-cell span {
                font-weight: 600;
                color: #1f2937;
                font-size: 0.9375rem;
            }

            /* Badges */
            .score-badge {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 0.5rem 1rem;
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                color: #fff;
                border-radius: 999px;
                font-size: 0.875rem;
                font-weight: 700;
                box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
                min-width: 50px;
            }

            .total-badge {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 0.5rem 1rem;
                background: #eff6ff;
                color: #3b82f6;
                border-radius: 999px;
                font-size: 0.875rem;
                font-weight: 600;
            }

            .correct-badge {
                display: inline-flex;
                align-items: center;
                gap: 0.375rem;
                padding: 0.5rem 1rem;
                background: #d1fae5;
                color: #059669;
                border-radius: 999px;
                font-size: 0.875rem;
                font-weight: 600;
            }

            .wrong-badge {
                display: inline-flex;
                align-items: center;
                gap: 0.375rem;
                padding: 0.5rem 1rem;
                background: #fee2e2;
                color: #dc2626;
                border-radius: 999px;
                font-size: 0.875rem;
                font-weight: 600;
            }

            /* Show Answer Button */
            .btn-show-answer {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.5rem 1rem;
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 0.8125rem;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.25s ease;
                box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
            }

            .btn-show-answer:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
            }

            .btn-show-answer:active {
                transform: translateY(0);
            }

            /* Action Buttons Container */
            .action-buttons-result {
                display: flex;
                gap: 0.5rem;
                align-items: center;
                justify-content: center;
            }

            /* Info Button */
            .btn-info-result {
                display: none;
                /* Hidden on desktop */
                align-items: center;
                gap: 0.5rem;
                padding: 0.5rem 1rem;
                background: #f0fdf4;
                color: #10b981;
                border: none;
                border-radius: 8px;
                font-size: 0.8125rem;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.25s ease;
            }

            .btn-info-result:hover {
                background: linear-gradient(135deg, #10b981, #059669);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
            }

            .answer-popup-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(8px);
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 1rem;
                box-sizing: border-box;
                z-index: 99999;
                opacity: 0;
                visibility: hidden;
                pointer-events: none;
                transition: opacity 0.3s ease, visibility 0.3s ease;
            }

            .answer-popup-overlay.active {
                opacity: 1;
                visibility: visible;
                pointer-events: auto;
            }

            .answer-popup-content {
                background: #ffffff;
                border-radius: 20px;
                box-shadow: 0 25px 60px rgba(0, 0, 0, 0.2);
                width: 90%;
                max-width: 600px;
                max-height: 60vh;
                display: flex;
                flex-direction: column;
                transform: scale(0.9);
                transition: transform 0.3s ease;
                position: relative;
            }

            .answer-popup-overlay.active .answer-popup-content {
                transform: scale(1);
            }

            .popup-close-btn-floating {
                position: absolute;
                top: -12px;
                right: -12px;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background: linear-gradient(135deg, #ef4444, #dc2626);
                border: 3px solid #fff;
                color: white;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1rem;
                transition: all 0.2s ease;
                box-shadow: 0 4px 15px rgba(239, 68, 68, 0.4);
                z-index: 10;
            }

            .popup-close-btn-floating:hover {
                transform: scale(1.1) rotate(90deg);
                box-shadow: 0 6px 20px rgba(239, 68, 68, 0.5);
            }

            .popup-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 1.25rem 1.5rem;
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                border-radius: 20px 20px 0 0;
            }

            .popup-title {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                color: white;
                font-size: 1.125rem;
                font-weight: 700;
            }

            .popup-title i {
                font-size: 1.25rem;
            }

            .popup-close-btn {
                width: 36px;
                height: 36px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.2);
                border: none;
                color: white;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.2s ease;
            }

            .popup-close-btn:hover {
                background: rgba(255, 255, 255, 0.3);
                transform: rotate(90deg);
            }

            .popup-body {
                padding: 1.5rem;
                flex: 1;
                overflow-y: auto;
                min-height: 0;
            }

            .popup-summary {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 1rem;
            }

            .summary-card {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                gap: 0.75rem;
                padding: 1.25rem 1rem;
                border-radius: 12px;
                transition: transform 0.2s ease;
                text-align: center;
            }

            .summary-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            .summary-card.total {
                background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%);
                color: #3b82f6;
            }

            .summary-card.correct {
                background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
                color: #059669;
            }

            .summary-card.wrong {
                background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
                color: #dc2626;
            }

            .summary-card i {
                font-size: 2rem;
            }

            .summary-info {
                display: flex;
                flex-direction: column;
                gap: 0.25rem;
            }

            .summary-label {
                font-size: 0.75rem;
                opacity: 0.85;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .summary-value {
                font-size: 2rem;
                font-weight: 800;
            }

            .popup-result-message {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                margin-top: 1.5rem;
                padding: 1rem 1.25rem;
                background: linear-gradient(135deg, #fef3c7, #fde68a);
                border-radius: 12px;
                color: #92400e;
                font-weight: 600;
            }

            .popup-result-message i {
                font-size: 1.25rem;
            }

            .popup-footer {
                padding: 1rem 1.5rem 1.5rem;
                display: flex;
                justify-content: center;
            }

            .btn-close-popup {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.75rem 2rem;
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                color: white;
                border: none;
                border-radius: 10px;
                font-size: 0.9375rem;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.25s ease;
                box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
            }

            .btn-close-popup:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
            }

            /* Empty State */
            .empty-state {
                padding: 4rem 2rem;
                text-align: center;
            }

            .empty-state-icon {
                width: 90px;
                height: 90px;
                border-radius: 50%;
                background: #eff6ff;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 1.5rem;
            }

            .empty-state-icon i {
                font-size: 2.25rem;
                color: #3b82f6;
            }

            .empty-state h3 {
                color: #1f2937;
                font-size: 1.25rem;
                margin-bottom: 0.5rem;
            }

            .empty-state p {
                color: #6b7280;
                margin-bottom: 1.5rem;
            }

            /* Info Modal Styles */
            .info-modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 99999;
                align-items: center;
                justify-content: center;
                animation: fadeIn 0.2s ease;
            }

            .info-modal.active {
                display: flex;
            }

            .info-modal-content {
                background: white;
                border-radius: 16px;
                padding: 0;
                max-width: 450px;
                width: 90%;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                animation: slideUp 0.3s ease;
                overflow: hidden;
            }

            .info-modal-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 1.25rem 1.5rem;
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                color: white;
            }

            .info-modal-header h3 {
                font-size: 1.125rem;
                font-weight: 700;
                margin: 0;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .info-modal-close {
                background: rgba(255, 255, 255, 0.2);
                border: none;
                width: 32px;
                height: 32px;
                border-radius: 50%;
                color: white;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.2s ease;
            }

            .info-modal-close:hover {
                background: rgba(255, 255, 255, 0.3);
                transform: rotate(90deg);
            }

            .info-modal-body {
                padding: 1.5rem;
                display: flex;
                flex-direction: column;
                gap: 1.25rem;
            }

            .info-item {
                display: flex;
                flex-direction: column;
                gap: 0.5rem;
            }

            .info-label {
                font-size: 0.75rem;
                font-weight: 600;
                color: #6b7280;
                text-transform: uppercase;
                letter-spacing: 0.05em;
                display: flex;
                align-items: center;
                gap: 0.375rem;
            }

            .info-label i {
                font-size: 0.875rem;
                color: #3b82f6;
            }

            .info-value {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 0.625rem 1.25rem;
                border-radius: 999px;
                font-size: 1.125rem;
                font-weight: 700;
                width: fit-content;
            }

            .info-value.score {
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                color: white;
                box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
            }

            .info-value.total {
                background: #eff6ff;
                color: #3b82f6;
            }

            .info-value.correct {
                background: #d1fae5;
                color: #059669;
            }

            .info-value.wrong {
                background: #fee2e2;
                color: #dc2626;
            }

            .info-value-text {
                font-size: 1rem;
                font-weight: 600;
                color: #1f2937;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }

                to {
                    opacity: 1;
                }
            }

            @keyframes slideUp {
                from {
                    transform: translateY(20px);
                    opacity: 0;
                }

                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }

            /* Responsive */
            @media (max-width: 1024px) {
                .grid-header {
                    display: none !important;
                }

                .result-row {
                    display: flex;
                    flex-direction: column;
                    gap: 1rem;
                    padding: 1.5rem;
                    align-items: center;
                    text-align: center;
                }

                .result-row .grid-col {
                    width: 100%;
                    justify-content: center;
                }

                /* Remove pseudo-element labels */
                .result-row .grid-col::before {
                    display: none;
                }

                .col-test {
                    margin-bottom: 0.5rem;
                    padding-bottom: 1rem;
                    border-bottom: 1px solid rgba(0, 0, 0, 0.06);
                }

                .test-name-cell {
                    flex-direction: column;
                    align-items: center;
                    gap: 0.75rem;
                }

                .test-icon-mini {
                    width: 48px;
                    height: 48px;
                    font-size: 1.25rem;
                }

                .test-name-cell span {
                    font-size: 1.0625rem;
                }

                .col-action {
                    width: 100%;
                    margin-top: 0.5rem;
                }

                .btn-show-answer {
                    width: 100%;
                    justify-content: center;
                    padding: 0.75rem 1.5rem;
                }

                .answer-item {
                    grid-template-columns: 1fr;
                    gap: 0.75rem;
                }

                .answer-result {
                    flex-direction: row;
                    justify-content: space-between;
                    text-align: left;
                }

                .answers-summary {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 0.75rem;
                }
            }

            @media (max-width: 768px) {
                .page-header {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .result-card {
                    margin: 0 0 1rem;
                    border-radius: 16px;
                    background: white;
                    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.06);
                    border: 1px solid rgba(0, 0, 0, 0.04);
                    overflow: hidden;
                }

                .result-row {
                    padding: 1rem;
                    gap: 1rem;
                    display: flex;
                    flex-direction: row;
                    align-items: center;
                    justify-content: space-between;
                    flex-wrap: nowrap;
                }

                /* Score badges in a row */
                .col-score,
                .col-total,
                .col-correct,
                .col-wrong {
                    display: none !important;
                    /* Hide on mobile */
                }

                .col-test {
                    flex: 1;
                    width: auto;
                    text-align: left;
                    border-bottom: none;
                    margin-bottom: 0;
                    padding-bottom: 0;
                }

                .col-action {
                    flex: 0 0 auto;
                    width: auto;
                    margin: 0;
                    display: flex;
                    align-items: center;
                }

                .test-name-cell {
                    flex-direction: row;
                    align-items: center;
                    gap: 0.75rem;
                    justify-content: flex-start;
                }

                .test-icon-mini {
                    width: 48px;
                    height: 48px;
                    font-size: 1.125rem;
                    flex-shrink: 0;
                }

                .test-name-cell span {
                    font-size: 0.9375rem;
                    text-align: left;
                    line-height: 1.4;
                }

                /* Mobile Action Buttons - Icon Only */
                .action-buttons-result {
                    display: flex;
                    gap: 0.5rem;
                    justify-content: flex-end;
                    align-items: center;
                    flex-shrink: 0;
                }

                .action-buttons-result .btn-text {
                    display: none;
                }

                .btn-show-answer,
                .btn-info-result {
                    width: 48px;
                    height: 48px;
                    min-width: 48px;
                    min-height: 48px;
                    padding: 0;
                    display: inline-flex !important;
                    align-items: center;
                    justify-content: center;
                    border-radius: 50%;
                    flex-shrink: 0;
                }

                .btn-show-answer i,
                .btn-info-result i {
                    font-size: 1.125rem;
                    margin: 0;
                    line-height: 1;
                }

                .popup-summary {
                    grid-template-columns: 1fr;
                }

                /* Full-screen popup on mobile */
                .answer-popup-content {
                    width: 100%;
                    max-width: 100%;
                    height: 100%;
                    max-height: 100%;
                    margin: 0;
                    border-radius: 0;
                    display: flex;
                    flex-direction: column;
                }

                .popup-header {
                    padding: 1rem;
                    border-radius: 0;
                    flex-shrink: 0;
                }

                .popup-title {
                    font-size: 1rem;
                    gap: 0.5rem;
                }

                .popup-title i {
                    font-size: 1.1rem;
                }

                .popup-close-btn {
                    width: 40px;
                    height: 40px;
                }

                .popup-body {
                    padding: 1rem;
                    flex: 1;
                    overflow-y: auto;
                    -webkit-overflow-scrolling: touch;
                }

                .summary-card {
                    padding: 1rem;
                    flex-direction: row;
                    gap: 1rem;
                }

                .summary-card i {
                    font-size: 1.5rem;
                }

                .summary-info {
                    text-align: left;
                }

                .summary-value {
                    font-size: 1.5rem;
                }

                .popup-result-message {
                    padding: 0.875rem 1rem;
                    margin-top: 1rem;
                    font-size: 0.875rem;
                }

                .popup-result-message i {
                    font-size: 1rem;
                }

                .questions-list {
                    margin-top: 1rem;
                    max-height: none;
                }

                .question-item {
                    padding: 1rem;
                    margin-bottom: 0.75rem;
                    border-radius: 12px;
                }

                .question-header {
                    gap: 0.5rem;
                    margin-bottom: 0.75rem;
                }

                .question-number {
                    min-width: 28px;
                    height: 28px;
                    font-size: 0.8125rem;
                }

                .question-text {
                    font-size: 0.9rem;
                    line-height: 1.5;
                }

                .popup-footer {
                    padding: 1rem;
                    flex-shrink: 0;
                    background: #f8fafc;
                    border-top: 1px solid rgba(0, 0, 0, 0.06);
                }

                .btn-close-popup {
                    width: 100%;
                    padding: 0.875rem 1.5rem;
                    font-size: 1rem;
                }
            }

            /* Questions List Styles */
            .questions-list {
                margin-top: 1.5rem;
                max-height: none;
                overflow-y: visible;
            }

            .questions-list::-webkit-scrollbar {
                width: 8px;
            }

            .questions-list::-webkit-scrollbar-track {
                background: #f1f5f9;
                border-radius: 4px;
            }

            .questions-list::-webkit-scrollbar-thumb {
                background: #cbd5e1;
                border-radius: 4px;
            }

            .questions-list::-webkit-scrollbar-thumb:hover {
                background: #94a3b8;
            }

            .loading-spinner {
                text-align: center;
                padding: 2rem;
                color: #6b7280;
            }

            .loading-spinner i {
                font-size: 2rem;
                margin-bottom: 0.5rem;
            }

            .question-item {
                background: #ffffff;
                border-radius: 16px;
                padding: 1.5rem;
                margin-bottom: 1.25rem;
                border: 2px solid #e5e7eb;
                transition: all 0.3s ease;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            }

            .question-item:hover {
                box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            }

            .question-item.correct {
                border-color: #10b981;
                background: linear-gradient(135deg, #ecfdf5 0%, #d1fae5 100%);
                box-shadow: 0 4px 16px rgba(16, 185, 129, 0.15);
            }

            .question-item.wrong {
                border-color: #ef4444;
                background: linear-gradient(135deg, #fef2f2 0%, #fee2e2 100%);
                box-shadow: 0 4px 16px rgba(239, 68, 68, 0.15);
            }

            .question-header {
                display: flex;
                align-items: flex-start;
                gap: 0.75rem;
                margin-bottom: 1rem;
            }

            .question-number {
                min-width: 32px;
                height: 32px;
                border-radius: 50%;
                background: #3b82f6;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 700;
                font-size: 0.875rem;
            }

            .question-item.correct .question-number {
                background: #10b981;
            }

            .question-item.wrong .question-number {
                background: #ef4444;
            }

            .question-text {
                flex: 1;
                font-weight: 600;
                color: #1f2937;
                line-height: 1.5;
            }

            .options-list {
                display: flex;
                flex-direction: column;
                gap: 0.875rem;
                margin-top: 1rem;
            }

            .option-item {
                display: flex;
                align-items: center;
                gap: 1rem;
                padding: 1rem 1.25rem;
                background: #f8fafc;
                border-radius: 10px;
                border: 2px solid #e5e7eb;
                transition: all 0.2s ease;
            }

            .option-item:hover {
                background: #f1f5f9;
                transform: translateX(4px);
            }

            .option-item.correct-answer {
                background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
                border-color: #10b981;
                font-weight: 600;
                box-shadow: 0 2px 8px rgba(16, 185, 129, 0.2);
            }

            .option-item.correct-answer:hover {
                box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
            }

            .option-item.user-wrong {
                background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
                border-color: #ef4444;
                font-weight: 600;
                box-shadow: 0 2px 8px rgba(239, 68, 68, 0.2);
            }

            .option-item.user-wrong:hover {
                box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
            }

            .option-label {
                min-width: 32px;
                height: 32px;
                border-radius: 50%;
                background: #e5e7eb;
                color: #6b7280;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 700;
                font-size: 0.9375rem;
            }

            .option-item.correct-answer .option-label {
                background: #10b981;
                color: white;
            }

            .option-item.user-wrong .option-label {
                background: #ef4444;
                color: white;
            }

            .option-text {
                flex: 1;
                color: #374151;
                font-size: 0.9375rem;
                line-height: 1.5;
            }

            .option-icon {
                font-size: 1.25rem;
            }

            .option-item.correct-answer .option-icon {
                color: #10b981;
            }

            .option-item.user-wrong .option-icon {
                color: #ef4444;
            }
        </style>

        <script>
            function showAnswerPopup(button) {
                const resultId = button.getAttribute('data-resultid');
                const testName = button.getAttribute('data-testname');
                const total = button.getAttribute('data-total');
                const correct = button.getAttribute('data-correct');
                const wrong = button.getAttribute('data-wrong');

                // Update popup content
                document.getElementById('popupTotal').textContent = total;
                document.getElementById('popupCorrect').textContent = correct;
                document.getElementById('popupWrong').textContent = wrong;

                // Calculate percentage and set message
                const totalVal = parseInt(total) || 0;
                const correctVal = parseInt(correct) || 0;
                const percentage = totalVal > 0 ? Math.round((correctVal / totalVal) * 100) : 0;
                let message = '';
                if (percentage >= 80) {
                    message = 'Excellent! You scored ' + percentage + '%! Outstanding performance!';
                } else if (percentage >= 60) {
                    message = 'Good job! You scored ' + percentage + '%. Keep practicing!';
                } else if (percentage >= 40) {
                    message = 'You scored ' + percentage + '%. More practice needed!';
                } else {
                    message = 'You scored ' + percentage + '%. Review the material and try again!';
                }
                document.getElementById('popupMessage').textContent = message;

                // Load questions via AJAX
                loadQuestions(resultId);

                // Show popup with animation
                const popup = document.getElementById('answerPopup');
                popup.classList.add('active');
            }

            function loadQuestions(resultId) {
                const questionsList = document.getElementById('questionsList');

                // Show loading
                questionsList.innerHTML = '<div class="loading-spinner"><i class="fas fa-spinner fa-spin"></i><span>Loading questions...</span></div>';

                console.log('Loading questions for Result ID:', resultId);

                // Make AJAX call
                var xhr = new XMLHttpRequest();
                xhr.open('POST', 'Results.aspx/GetTestReviewDetails', true);
                xhr.setRequestHeader('Content-Type', 'application/json');

                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        console.log('Response status:', xhr.status);
                        console.log('Response text:', xhr.responseText);

                        if (xhr.status === 200) {
                            try {
                                var response = JSON.parse(xhr.responseText);
                                console.log('Parsed response:', response);

                                if (response.d) {
                                    var questions = JSON.parse(response.d);
                                    console.log('Questions:', questions);
                                    displayQuestions(questions);
                                } else {
                                    questionsList.innerHTML = '<div class="error-message">No data returned from server</div>';
                                }
                            } catch (e) {
                                console.error('Parse error:', e);
                                questionsList.innerHTML = '<div class="error-message">Error parsing response: ' + e.message + '</div>';
                            }
                        } else {
                            console.error('HTTP error:', xhr.status);
                            questionsList.innerHTML = '<div class="error-message">Failed to load questions (HTTP ' + xhr.status + ')</div>';
                        }
                    }
                };

                xhr.onerror = function () {
                    console.error('Network error');
                    questionsList.innerHTML = '<div class="error-message">Network error occurred</div>';
                };

                xhr.send(JSON.stringify({ resultId: parseInt(resultId) }));
            }

            function displayQuestions(questions) {
                const questionsList = document.getElementById('questionsList');

                console.log('Displaying questions:', questions);

                if (!questions || questions.length === 0) {
                    questionsList.innerHTML = '<div class="empty-message" style="text-align:center; padding:2rem; color:#6b7280;">No questions found. This test may have been taken before the review feature was added.</div>';
                    return;
                }

                let html = '';
                questions.forEach((q, index) => {
                    const isCorrect = q.isCorrect;
                    const correctClass = isCorrect ? 'correct' : 'wrong';

                    html += `<div class="question-item ${correctClass}">`;
                    html += `<div class="question-header">`;
                    html += `<div class="question-number">${index + 1}</div>`;
                    html += `<div class="question-text">${q.questionText}</div>`;
                    html += `</div>`;
                    html += `<div class="options-list">`;

                    // Display all options
                    ['A', 'B', 'C', 'D'].forEach(option => {
                        const optionText = q['option' + option];
                        const isCorrectOption = q.correctOption === option;
                        const isUserAnswer = q.userAnswer.trim() === option;

                        let optionClass = '';
                        let icon = '';

                        if (isCorrectOption) {
                            optionClass = 'correct-answer';
                            icon = '<i class="fas fa-check-circle option-icon"></i>';
                        } else if (isUserAnswer && !isCorrect) {
                            optionClass = 'user-wrong';
                            icon = '<i class="fas fa-times-circle option-icon"></i>';
                        }

                        html += `<div class="option-item ${optionClass}">`;
                        html += `<div class="option-label">${option}</div>`;
                        html += `<div class="option-text">${optionText}</div>`;
                        html += icon;
                        html += `</div>`;
                    });

                    html += `</div></div>`;
                });

                questionsList.innerHTML = html;
            }

            function closeAnswerPopup() {
                const popup = document.getElementById('answerPopup');
                popup.classList.remove('active');
            }

            function closePopupOnOverlay(event) {
                if (event.target.classList.contains('answer-popup-overlay')) {
                    closeAnswerPopup();
                }
            }

            // Close popup with Escape key
            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape') {
                    closeAnswerPopup();
                    closeResultInfo();
                }
            });

            // Show result info modal
            function showResultInfo(button) {
                const testName = button.getAttribute('data-testname');
                const score = button.getAttribute('data-score');
                const total = button.getAttribute('data-total');
                const correct = button.getAttribute('data-correct');
                const wrong = button.getAttribute('data-wrong');

                // Update modal content
                document.getElementById('modalTestName').textContent = testName;
                document.getElementById('modalScore').textContent = score;
                document.getElementById('modalTotalQuestions').textContent = total;
                document.getElementById('modalCorrectAnswers').textContent = correct;
                document.getElementById('modalWrongAnswers').textContent = wrong;

                // Show modal
                const modal = document.getElementById('resultInfoModal');
                modal.classList.add('active');
            }

            function closeResultInfo() {
                const modal = document.getElementById('resultInfoModal');
                if (modal) {
                    modal.classList.remove('active');
                }
            }

            // Close info modal on backdrop click
            document.getElementById('resultInfoModal')?.addEventListener('click', function (e) {
                if (e.target === this) {
                    closeResultInfo();
                }
            });
        </script>

    </asp:Content>