<%@ Page Title="Attempt Test" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true"
    CodeBehind="QuizAttempt.aspx.cs" Inherits="interview_questions.User.QuizAttempt" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <style>
            .quiz-header {
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                border-radius: 16px;
                padding: 2rem;
                color: white;
                margin-bottom: 2rem;
                box-shadow: 0 10px 30px rgba(37, 99, 235, 0.25);
                position: relative;
                overflow: hidden;
            }

            .quiz-header::before {
                content: '';
                position: absolute;
                top: 0;
                right: 0;
                width: 300px;
                height: 300px;
                background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
                transform: translate(30%, -30%);
            }

            .quiz-title {
                display: flex;
                align-items: center;
                gap: 1rem;
                font-size: 1.75rem;
                font-weight: 800;
                margin-bottom: 1rem;
            }

            .quiz-title i {
                background: rgba(255, 255, 255, 0.2);
                width: 48px;
                height: 48px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                backdrop-filter: blur(5px);
            }

            .quiz-meta {
                display: flex;
                gap: 1.5rem;
                flex-wrap: wrap;
            }

            .timer-badge {
                background: rgba(255, 255, 255, 0.95);
                color: #d97706;
                padding: 0.5rem 1rem;
                border-radius: 50px;
                font-weight: 700;
                display: flex;
                align-items: center;
                gap: 0.5rem;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .progress-indicator {
                background: rgba(255, 255, 255, 0.2);
                padding: 0.5rem 1rem;
                border-radius: 50px;
                display: flex;
                align-items: center;
                gap: 0.5rem;
                font-weight: 500;
                backdrop-filter: blur(5px);
            }

            .question-card {
                background: #ffffff;
                border-radius: 16px;
                padding: 2rem;
                margin-bottom: 1.5rem;
                border: 1px solid rgba(0, 0, 0, 0.05);
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.02);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .question-card:hover {
                transform: none;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.02);
            }

            .question-header {
                display: flex;
                gap: 1rem;
                margin-bottom: 1.5rem;
                justify-content: flex-start;
            }

            .question-number {
                width: 40px;
                height: 40px;
                background: #eff6ff;
                color: #3b82f6;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 700;
                flex-shrink: 0;
                font-size: 1.1rem;
            }

            .question-text {
                font-size: 1.1rem;
                font-weight: 600;
                color: #1f2937;
                line-height: 1.6;
                padding-top: 0.25rem;
            }

            .options-container {
                display: flex;
                flex-direction: column;
                gap: 0.75rem;
                padding-left: 3.5rem;
            }

            .option-label {
                display: flex;
                align-items: center;
                gap: 1rem;
                padding: 1rem;
                border-radius: 12px;
                border: 2px solid #f3f4f6;
                cursor: pointer;
                transition: all 0.2s ease;
            }

            .option-label:hover {
                background: #f8fafc;
                border-color: #bfdbfe;
            }

            .option-label input[type="radio"] {
                accent-color: #3b82f6;
                width: 1.2rem;
                height: 1.2rem;
            }

            .option-label input[type="radio"]:checked~.option-text {
                color: #2563eb;
                font-weight: 600;
            }

            .option-label:has(input[type="radio"]:checked) {
                background: #eff6ff;
                border-color: #3b82f6;
            }

            .submit-section {
                background: #ffffff;
                padding: 1.5rem;
                border-radius: 16px;
                border: 1px solid rgba(0, 0, 0, 0.05);
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 2rem;
                box-shadow: 0 -4px 20px rgba(0, 0, 0, 0.05);
            }

            .submit-info {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                color: #6b7280;
                font-size: 0.9rem;
            }

            .btn-submit {
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                color: white !important;
                padding: 0.875rem 2rem;
                border-radius: 10px;
                font-weight: 600;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                transition: all 0.3s ease;
                box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
            }

            .btn-submit:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(37, 99, 235, 0.4);
            }

            .result-message {
                text-align: center;
                padding: 3rem;
                background: #ffffff;
                border-radius: 16px;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                margin-top: 2rem;
            }

            @media (max-width: 768px) {
                .options-container {
                    padding-left: 0;
                }

                .submit-section {
                    flex-direction: column;
                    gap: 1rem;
                    text-align: center;
                }
            }
        </style>

        <!-- QUIZ HEADER -->
        <div class="quiz-header">
            <div class="quiz-title">
                <i class="fas fa-clipboard-list"></i>
                <asp:Label ID="lblTestName" runat="server" Text="Test Name"></asp:Label>
            </div>

            <div class="quiz-meta">
                <div class="timer-badge">
                    <i class="fas fa-clock"></i>
                    <asp:Label ID="lblTimer" runat="server" Text="Time Remaining"></asp:Label>
                </div>

                <div class="progress-indicator">
                    <i class="fas fa-tasks"></i>
                    <span>Answer all questions</span>
                </div>
            </div>
        </div>

        <!-- QUESTIONS -->
        <asp:Repeater ID="rptQuestions" runat="server">
            <ItemTemplate>
                <div class="question-card">

                    <div class="question-header">
                        <div class="question-number">
                            <%# Container.ItemIndex + 1 %>
                        </div>

                        <div class="question-text">
                            <%# Eval("Question_Text") %>
                        </div>
                    </div>

                    <div class="options-container">

                        <label class="option-label">
                            <asp:RadioButton ID="rbA" runat="server" GroupName='<%# "q" + Eval("Question_ID") %>' />
                            <span class="option-text">
                                <%# Eval("OptionA") %>
                            </span>
                        </label>

                        <label class="option-label">
                            <asp:RadioButton ID="rbB" runat="server" GroupName='<%# "q" + Eval("Question_ID") %>' />
                            <span class="option-text">
                                <%# Eval("OptionB") %>
                            </span>
                        </label>

                        <label class="option-label">
                            <asp:RadioButton ID="rbC" runat="server" GroupName='<%# "q" + Eval("Question_ID") %>' />
                            <span class="option-text">
                                <%# Eval("OptionC") %>
                            </span>
                        </label>

                        <label class="option-label">
                            <asp:RadioButton ID="rbD" runat="server" GroupName='<%# "q" + Eval("Question_ID") %>' />
                            <span class="option-text">
                                <%# Eval("OptionD") %>
                            </span>
                        </label>

                    </div>

                    <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("Question_ID") %>' />

                </div>
            </ItemTemplate>
        </asp:Repeater>

        <!-- SUBMIT SECTION -->
        <div class="submit-section">
            <div class="submit-info">
                <i class="fas fa-info-circle"></i>
                <span>Make sure you've answered all questions before submitting</span>
            </div>

            <asp:LinkButton ID="btnSubmitTest" runat="server" CssClass="btn-submit" OnClick="btnSubmitTest_Click"
                OnClientClick="return confirm('Are you sure you want to submit the test?');"
                Text="<i class='fas fa-paper-plane'></i> <span>Submit Test</span>">
            </asp:LinkButton>

        </div>

        <!-- RESULT -->
        <asp:Panel ID="pnlResult" runat="server" Visible="false" CssClass="result-message">
            <i class="fas fa-check-circle" style="font-size: 2rem; color: #10b981;"></i>
            <div class="result-text">
                <asp:Label ID="lblResultMsg" runat="server"></asp:Label>
            </div>
        </asp:Panel>

        <!-- Hidden field for storing test duration -->
        <asp:HiddenField ID="hfDuration" runat="server" />

        <!-- Timer Script -->
        <script type="text/javascript">
            var timerDisplay = document.getElementById('<%= lblTimer.ClientID %>');
            var submitBtn = document.getElementById('<%= btnSubmitTest.ClientID %>');

            // Get duration from the timer display (format: "MM:SS")
            var timerText = timerDisplay ? timerDisplay.innerText : "30:00";
            var parts = timerText.split(':');
            var totalSeconds = (parseInt(parts[0]) * 60) + (parseInt(parts[1]) || 0);

            function updateTimer() {
                if (totalSeconds <= 0) {
                    timerDisplay.innerText = "00:00";
                    // Auto-submit the test
                    if (submitBtn) {
                        submitBtn.click();
                    }
                    return;
                }

                totalSeconds--;
                var minutes = Math.floor(totalSeconds / 60);
                var seconds = totalSeconds % 60;
                timerDisplay.innerText = (minutes < 10 ? "0" : "") + minutes + ":" + (seconds < 10 ? "0" : "") + seconds;

                // Change color when time is running low
                if (totalSeconds <= 60) {
                    timerDisplay.style.color = "#ef4444";
                } else if (totalSeconds <= 300) {
                    timerDisplay.style.color = "#f59e0b";
                }

                setTimeout(updateTimer, 1000);
            }

            // Start the timer when page loads
            if (timerDisplay && totalSeconds > 0) {
                setTimeout(updateTimer, 1000);
            }
        </script>

    </asp:Content>