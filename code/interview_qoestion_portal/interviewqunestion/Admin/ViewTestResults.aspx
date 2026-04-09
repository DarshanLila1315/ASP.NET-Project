<%@ Page Title="View Test Results" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="ViewTestResults.aspx.cs" Inherits="interview_questions.Admin.ViewTestResults" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <style>
            /* AGGRESSIVE OVERFLOW REMOVAL */
            *,
            *::before,
            *::after {
                box-sizing: border-box !important;
            }

            *:not([type="checkbox"]):not([type="radio"]) {
                max-width: 100% !important;
            }

            html {
                overflow-x: hidden !important;
                width: 100% !important;
                max-width: 100vw !important;
            }

            body {
                overflow-x: hidden !important;
                width: 100% !important;
                max-width: 100vw !important;
                margin: 0 !important;
                padding: 0 !important;
            }

            .admin-wrapper,
            .main-wrapper,
            .content-area,
            .content-card {
                overflow-x: hidden !important;
                width: 100% !important;
                max-width: 100% !important;
            }

            .content-area {
                padding: 0.5rem !important;
            }

            /* Stats Summary */
            .stats-summary {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 1rem;
                margin-bottom: 1.5rem;
            }

            .summary-card {
                background: rgba(30, 41, 59, 0.8);
                border: 1px solid rgba(255, 255, 255, 0.1);
                border-radius: 16px;
                padding: 1.25rem;
                display: flex;
                align-items: center;
                gap: 1rem;
                opacity: 0;
                transform: translateY(20px);
                transition: opacity 0.3s ease, transform 0.3s ease;
            }

            .summary-icon {
                width: 60px;
                height: 60px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: white;
            }

            .summary-card:nth-child(2) .summary-icon {
                background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            }

            .summary-card:nth-child(3) .summary-icon {
                background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%);
            }

            .summary-content {
                flex: 1;
            }

            .summary-label {
                color: #94a3b8;
                font-size: 0.85rem;
                font-weight: 500;
                margin-bottom: 0.25rem;
            }

            .summary-value {
                color: #f8fafc;
                font-size: 1.75rem;
                font-weight: 700;
            }

            /* Table Card */
            .table-card {
                background: rgba(30, 41, 59, 0.8) !important;
                border: 1px solid rgba(255, 255, 255, 0.1) !important;
                border-radius: 12px !important;
                padding: 1rem !important;
                margin-bottom: 1rem !important;
                width: 100% !important;
                max-width: 100% !important;
                overflow: hidden !important;
            }

            .table-header {
                margin-bottom: 1rem;
            }

            .table-title {
                color: #f8fafc !important;
                font-size: 1.1rem !important;
                font-weight: 600 !important;
                margin: 0 !important;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .table-title i {
                color: #3b82f6;
            }

            /* Table/GridView Overflow Fix */
            .table-wrapper {
                width: 100% !important;
                max-width: 100% !important;
                overflow-x: hidden !important;
                padding: 0 !important;
            }

            .table,
            .table-mobile-cards,
            table {
                width: 100% !important;
                max-width: 100% !important;
                table-layout: fixed !important;
                overflow: hidden !important;
            }

            /* Score Classes */
            .score-high {
                color: #10b981;
                font-weight: 600;
            }

            .score-medium {
                color: #f59e0b;
                font-weight: 600;
            }

            .score-low {
                color: #ef4444;
                font-weight: 600;
            }

            /* Stat Indicators */
            .stat-indicator {
                display: inline-flex;
                align-items: center;
                gap: 0.35rem;
                padding: 4px 10px;
                border-radius: 8px;
                font-weight: 600;
                font-size: 0.9rem;
            }

            .stat-correct {
                background: rgba(16, 185, 129, 0.15);
                color: #10b981;
            }

            .stat-wrong {
                background: rgba(239, 68, 68, 0.15);
                color: #ef4444;
            }

            /* Pagination */
            .pagination-container {
                padding: 1.5rem;
                display: flex;
                justify-content: center;
                background: transparent;
            }

            .pagination-container table {
                display: flex !important;
                justify-content: center;
                gap: 1rem;
                background: transparent !important;
                border: none !important;
            }

            .pagination-container tbody,
            .pagination-container tr {
                display: flex !important;
                gap: 1rem;
                background: transparent !important;
            }

            .pagination-container td {
                display: inline-flex !important;
                padding: 0 !important;
                border: none !important;
                background: transparent !important;
            }

            .pagination-container td::before {
                display: none !important;
            }

            .pagination-container a,
            .pagination-container span {
                display: inline-flex;
                justify-content: center;
                align-items: center;
                min-width: 50px;
                height: 50px;
                padding: 0 15px;
                border-radius: 10px;
                font-weight: 600;
                font-size: 1.25rem;
                text-decoration: none;
                color: #e2e8f0;
                background: rgba(51, 65, 85, 0.8);
                border: 1px solid rgba(255, 255, 255, 0.1);
            }

            .pagination-container a:hover {
                background: #3b82f6;
                color: white;
            }

            /* Mobile Responsive */
            @media (max-width: 768px) {

                html,
                body {
                    max-width: 100vw !important;
                    overflow-x: hidden !important;
                }

                *:not([type="checkbox"]):not([type="radio"]) {
                    max-width: 100vw !important;
                }

                .content-area {
                    padding: 0.5rem !important;
                    width: 100vw !important;
                    max-width: 100vw !important;
                }

                .content-card {
                    width: 100% !important;
                    padding: 0 !important;
                    margin: 0 !important;
                }

                .page-header {
                    padding: 0 0 0.5rem 0 !important;
                    margin: 0 0 0.5rem 0 !important;
                }

                .page-title {
                    font-size: 1.3rem !important;
                    font-weight: 700 !important;
                }

                .page-subtitle {
                    font-size: 0.8rem !important;
                    color: #94a3b8 !important;
                }

                /* Stats Summary Mobile */
                .stats-summary {
                    grid-template-columns: 1fr;
                    gap: 0.75rem;
                    margin-bottom: 1rem;
                }

                .summary-card {
                    padding: 1rem;
                    border-radius: 12px;
                }

                .summary-icon {
                    width: 50px;
                    height: 50px;
                    font-size: 1.25rem;
                }

                .summary-value {
                    font-size: 1.5rem;
                }

                .table-card {
                    padding: 0.75rem !important;
                    margin: 0 0 0.75rem 0 !important;
                    border-radius: 10px !important;
                }

                .table-wrapper {
                    padding: 0 !important;
                    overflow-x: hidden !important;
                }

                /* Mobile Table Cards */
                .table-mobile-cards {
                    display: block !important;
                    width: 100% !important;
                    max-width: 100% !important;
                    overflow: hidden !important;
                }

                .table-mobile-cards thead,
                .table-mobile-cards th {
                    display: none !important;
                }

                .table-mobile-cards>tbody {
                    display: flex !important;
                    flex-direction: column !important;
                    gap: 0.75rem !important;
                    width: 100% !important;
                }

                /* Data Rows - Card Style */
                .table-mobile-cards>tbody>tr.data-row {
                    display: block !important;
                    background: linear-gradient(135deg, rgba(30, 41, 59, 0.95) 0%, rgba(15, 23, 42, 0.95) 100%) !important;
                    border: 1px solid rgba(59, 130, 246, 0.2) !important;
                    border-radius: 12px !important;
                    padding: 1rem !important;
                    width: 100% !important;
                    max-width: 100% !important;
                    box-sizing: border-box !important;
                    overflow: hidden !important;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3) !important;
                }

                .table-mobile-cards>tbody>tr.data-row>td {
                    display: block !important;
                    padding: 0.65rem 0 !important;
                    border: none !important;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.08) !important;
                    background: transparent !important;
                    color: #e2e8f0 !important;
                    font-size: 0.95rem !important;
                    font-weight: 500 !important;
                }

                .table-mobile-cards>tbody>tr.data-row>td:first-child {
                    padding-top: 0 !important;
                }

                .table-mobile-cards>tbody>tr.data-row>td:last-child {
                    border-bottom: none !important;
                    padding-bottom: 0 !important;
                }

                /* Mobile Labels */
                .table-mobile-cards>tbody>tr.data-row>td::before {
                    color: #94a3b8;
                    font-weight: 600;
                    font-size: 0.7rem;
                    display: block;
                    margin-bottom: 0.35rem;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(1)::before {
                    content: "RESULT ID:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(2)::before {
                    content: "TEST NAME:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(2) {
                    color: #60a5fa !important;
                    font-size: 1.05rem !important;
                    font-weight: 600 !important;
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(3)::before {
                    content: "USER:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(3) {
                    color: #f8fafc !important;
                    font-weight: 600 !important;
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(4)::before {
                    content: "SCORE:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(4) {
                    font-size: 1.1rem !important;
                    font-weight: 700 !important;
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(5)::before {
                    content: "CORRECT:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(6)::before {
                    content: "WRONG:";
                }

                /* Pagination Row */
                .table-mobile-cards>tbody>tr:not(.data-row) {
                    display: block !important;
                    background: transparent !important;
                    border: none !important;
                    padding: 1rem 0 !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row)>td {
                    display: block !important;
                    background: transparent !important;
                    border: none !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row)>td::before {
                    display: none !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row) table,
                .table-mobile-cards>tbody>tr:not(.data-row) tbody,
                .table-mobile-cards>tbody>tr:not(.data-row) tr {
                    display: flex !important;
                    flex-direction: row !important;
                    justify-content: center !important;
                    gap: 1rem !important;
                    background: transparent !important;
                    border: none !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row) td {
                    display: inline-flex !important;
                    width: auto !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row) a {
                    min-width: 50px !important;
                    height: 50px !important;
                    font-size: 1.5rem !important;
                }
            }
        </style>

        <div class="page-header">
            <h1 class="page-title">Test Results Dashboard</h1>
            <p class="page-subtitle">View and analyze all test attempt results</p>
        </div>


        <div class="stats-summary">
            <div class="summary-card">
                <div class="summary-icon">
                    <i class="fas fa-clipboard-check"></i>
                </div>
                <div class="summary-content">
                    <div class="summary-label">Total Attempts</div>
                    <div class="summary-value">
                        <asp:Label ID="lblTotalAttempts" runat="server" Text="0" />
                    </div>
                </div>
            </div>
            <div class="summary-card">
                <div class="summary-icon">
                    <i class="fas fa-chart-line"></i>
                </div>
                <div class="summary-content">
                    <div class="summary-label">Avg Score</div>
                    <div class="summary-value">
                        <asp:Label ID="lblAvgScore" runat="server" Text="0%" />
                    </div>
                </div>
            </div>
            <div class="summary-card">
                <div class="summary-icon">
                    <i class="fas fa-users"></i>
                </div>
                <div class="summary-content">
                    <div class="summary-label">Unique Users</div>
                    <div class="summary-value">
                        <asp:Label ID="lblUniqueUsers" runat="server" Text="0" />
                    </div>
                </div>
            </div>
        </div>

        <div class="table-card">
            <div class="table-header">
                <h2 class="table-title">
                    <i class="fas fa-table"></i>
                    All Test Results
                </h2>
            </div>

            <div class="table-wrapper">
                <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-mobile-cards" GridLines="None" ShowHeaderWhenEmpty="True" AllowPaging="True"
                    PageSize="10" OnPageIndexChanging="gvResults_PageIndexChanging">
                    <RowStyle CssClass="data-row" />
                    <AlternatingRowStyle CssClass="data-row" />
                    <PagerSettings Mode="NextPrevious" PreviousPageText="&lt;" NextPageText="&gt;" />
                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="Result_ID" HeaderText="Result ID">
                            <ItemStyle CssClass="col-id" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Test_Name" HeaderText="Test Name">
                            <ItemStyle CssClass="col-test" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UserName" HeaderText="User">
                            <ItemStyle CssClass="col-user" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Score">
                            <ItemTemplate>
                                <span class='<%# GetScoreClass(Eval("Result_Score"), Eval("TotalQuestions")) %>'>
                                    <%# Eval("Result_Score") %> / <%# Eval("TotalQuestions") %>
                                            (<%# GetScorePercentage(Eval("Result_Score"), Eval("TotalQuestions")) %>%)
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Correct">
                            <ItemTemplate>
                                <span class="stat-indicator stat-correct">
                                    <i class="fas fa-check"></i>
                                    <%# Eval("CorrectAnswers") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Wrong">
                            <ItemTemplate>
                                <span class="stat-indicator stat-wrong">
                                    <i class="fas fa-times"></i>
                                    <%# Eval("WrongAnswers") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-state">
                            <i class="fas fa-chart-bar"></i>
                            <div class="empty-state-title">No Test Results Yet</div>
                            <p>Results will appear here once users complete tests</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>

        <script>
            // Add smooth scroll animation
            window.addEventListener('load', function () {
                const cards = document.querySelectorAll('.summary-card');
                cards.forEach((card, index) => {
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    }, index * 100);
                });
            });
        </script>
    </asp:Content>