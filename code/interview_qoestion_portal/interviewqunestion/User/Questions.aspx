<%@ Page Title="Questions" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true"
    CodeBehind="Questions.aspx.cs" Inherits="interviewquestion.User.Questions" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


        <div class="questions-page">

            <!-- Page Header -->
            <div class="page-header animate-fade-in-up">
                <div class="page-title">
                    <div class="title-icon">
                        <i class="fas fa-code"></i>
                    </div>
                    <div class="title-text">
                        <h1>Interview Questions</h1>
                        <p>Explore questions from top tech companies</p>
                    </div>
                </div>
                <div class="header-stats">
                    <div class="stat-pill">
                        <i class="fas fa-database"></i>
                        <span>Growing Collection</span>
                    </div>
                </div>
            </div>

            <!-- Alert Message -->
            <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert alert-success animate-fade-in">
                <i class="fas fa-check-circle"></i>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </asp:Panel>

            <!-- Filter Section -->
            <div class="filter-section glass-card animate-fade-in-up" style="animation-delay: 0.1s;">
                <div class="filter-header">
                    <i class="fas fa-sliders-h"></i>
                    <h3>Filter Questions</h3>
                </div>

                <div class="filter-grid">
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-folder"></i>
                            Category
                        </label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select form-input"
                            AutoPostBack="true" OnSelectedIndexChanged="FilterChanged">
                            <asp:ListItem Selected="True" Text="All Categories" Value="All"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-building"></i>
                            Company
                        </label>
                        <asp:DropDownList ID="ddlCompany" runat="server" CssClass="form-select form-input"
                            AutoPostBack="true" OnSelectedIndexChanged="FilterChanged">
                        </asp:DropDownList>
                    </div>

                    <div class="form-group filter-actions">
                        <asp:LinkButton ID="btnClear" runat="server" CssClass="btn btn-ghost" OnClick="btnClear_Click">
                            <i class="fas fa-rotate-left"></i>
                            <span>Reset Filters</span>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>

            <!-- Questions Grid Table -->
            <div class="table-container glass-card animate-fade-in-up" style="animation-delay: 0.2s;">
                <asp:GridView ID="gvQuestions" runat="server" CssClass="premium-grid-table" AutoGenerateColumns="False"
                    DataKeyNames="Question_ID" OnRowCommand="gvQuestions_RowCommand" OnPreRender="gvQuestions_PreRender"
                    ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="10"
                    OnPageIndexChanging="gvQuestions_PageIndexChanging" EmptyDataText="" GridLines="None">
                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    <PagerSettings Mode="Numeric" PageButtonCount="5" />

                    <Columns>
                        <asp:TemplateField HeaderText="Question" ItemStyle-CssClass="col-question">
                            <HeaderTemplate>
                                <span class="header-icon"><i class="fas fa-file-alt"></i></span> QUESTION
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="question-wrapper">
                                    <div class="question-cell">
                                        <div class="question-icon-box">
                                            <i class="fas fa-code"></i>
                                        </div>
                                        <span class="question-text-content">
                                            <%# Eval("Question_Text") %>
                                        </span>
                                    </div>
                                    <button type="button" class="btn-show-answer" onclick="toggleAnswer(this)">
                                        <i class="fas fa-chevron-down"></i>
                                        <span>Show Answer</span>
                                    </button>
                                    <div class="answer-dropdown">
                                        <div class="answer-content">
                                            <div class="correct-answer-box">
                                                <i class="fas fa-trophy"></i>
                                                <span>Answer: <strong>
                                                        <%# GetAnswerText(Eval("CorrectOption"), Eval("OptionA"),
                                                            Eval("OptionB"), Eval("OptionC"), Eval("OptionD")) %>
                                                    </strong></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Category" ItemStyle-CssClass="col-category">
                            <HeaderTemplate>
                                <span class="header-icon"><i class="fas fa-tag"></i></span> CATEGORY
                            </HeaderTemplate>
                            <ItemTemplate>
                                <span class="badge-pill category">
                                    <%# Eval("Category_Name") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Company" ItemStyle-CssClass="col-company">
                            <HeaderTemplate>
                                <span class="header-icon"><i class="fas fa-building"></i></span> COMPANY
                            </HeaderTemplate>
                            <ItemTemplate>
                                <span class="badge-pill company">
                                    <%# Eval("Company_Name") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="col-action">
                            <HeaderTemplate>
                                <span class="header-icon"><i class="fas fa-bookmark"></i></span> ACTION
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:LinkButton ID="btnBookmark" runat="server" CssClass="action-btn save"
                                        CommandName="Bookmark" CommandArgument='<%# Eval("Question_ID") %>'>
                                        <i class="fas fa-bookmark"></i> <span class="btn-text">Save</span>
                                    </asp:LinkButton>
                                    <button type="button" class="action-btn info" onclick="showQuestionInfo(this)"
                                        data-category='<%# Eval("Category_Name") %>'
                                        data-company='<%# Eval("Company_Name") %>'>
                                        <i class="fas fa-info-circle"></i> <span class="btn-text">Info</span>
                                    </button>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <EmptyDataTemplate>
                        <div class="empty-state">
                            <div class="empty-state-icon">
                                <i class="fas fa-search"></i>
                            </div>
                            <h3>No questions found</h3>
                            <p>Try adjusting your filters or check back later for new questions</p>
                            <asp:LinkButton runat="server" CssClass="btn btn-primary" OnClick="btnClear_Click">
                                <i class="fas fa-rotate-left"></i>
                                Clear Filters
                            </asp:LinkButton>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

        </div>

        <style>
            /* --- GENERAL CONTAINER --- */
            .questions-page {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            }

            /* --- GRID TABLE BASE STYLES --- */
            .premium-grid-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                border: none;
            }

            /* --- DESKTOP VIEW (Standard Table) --- */
            @media (min-width: 769px) {
                .premium-grid-table th {
                    background: #f8fafc;
                    padding: 16px;
                    text-align: left;
                    font-size: 12px;
                    font-weight: 700;
                    color: #64748b;
                    text-transform: uppercase;
                    letter-spacing: 0.05em;
                }

                .premium-grid-table td {
                    padding: 20px 16px;
                    border-bottom: 1px solid #e2e8f0;
                    vertical-align: top;
                }
            }

            /* --- MOBILE CARD VIEW (Matches your Screenshot) --- */
            @media (max-width: 768px) {

                /* 1. Reset the table to look like a list of cards */
                .premium-grid-table,
                .premium-grid-table tbody,
                .premium-grid-table tr,
                .premium-grid-table td {
                    display: block;
                    width: 100%;
                }

                /* 2. Hide the table header completely */
                .premium-grid-table thead {
                    display: none;
                }

                /* 3. Style each "Row" as a Card */
                .premium-grid-table tr {
                    background: #ffffff;
                    margin-bottom: 24px;
                    border-radius: 16px;
                    /* Rounded card corners */
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
                    /* Soft shadow */
                    border: 1px solid #f1f5f9;
                    overflow: hidden;
                }

                /* 4. Style the "Cells" (The stacked sections in your image) */
                .premium-grid-table td {
                    padding: 20px;
                    border-bottom: 1px solid #f1f5f9;
                    /* The divider lines */
                    min-height: 60px;
                    /* Ensure touch targets are good */
                }

                /* Remove border from the last item (Action button) */
                .premium-grid-table td:last-child {
                    border-bottom: none;
                    background-color: #f8fafc;
                    /* Optional: slightly different bg for action area */
                }
            }

            /* --- ELEMENT STYLING (Icons, Badges, Buttons) --- */

            /* 1. Question Section (Icon + Text) */
            .question-wrapper {
                display: flex;
                flex-direction: column;
                gap: 15px;
                align-items: flex-start;
            }

            .question-cell {
                display: flex;
                gap: 16px;
                align-items: flex-start;
            }

            .question-icon-box {
                width: 48px;
                height: 48px;
                background-color: #eff6ff;
                /* Light Blue bg */
                color: #3b82f6;
                /* Blue Icon */
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 20px;
                flex-shrink: 0;
            }

            .question-text-content {
                font-size: 16px;
                font-weight: 600;
                color: #1e293b;
                line-height: 1.5;
                margin-top: 2px;
            }

            /* 2. Show Answer Button */
            .btn-show-answer {
                background-color: #eff6ff;
                color: #3b82f6;
                border: none;
                padding: 8px 16px;
                border-radius: 8px;
                font-weight: 600;
                font-size: 14px;
                cursor: pointer;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                transition: all 0.2s;
            }

            /* 3. Badges (Pills) */
            .badge-pill {
                display: inline-block;
                padding: 8px 16px;
                border-radius: 50px;
                font-weight: 600;
                font-size: 13px;
            }

            .badge-pill.category {
                background-color: #eff6ff;
                /* Blue-50 */
                color: #3b82f6;
                /* Blue-500 */
            }

            .badge-pill.company {
                background-color: #ccfbf1;
                /* Teal-100 (Amazon color) */
                color: #0f766e;
                /* Teal-700 */
            }

            /* 4. Action Button (Save) */
            .action-btn {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                background-color: #eff6ff;
                color: #3b82f6;
                padding: 10px 20px;
                border-radius: 8px;
                text-decoration: none;
                font-weight: 600;
                font-size: 14px;
            }

            .action-btn:hover {
                background-color: #dbeafe;
            }

            .questions-page {
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
                padding-bottom: 1.75rem;
                border-bottom: 1px solid rgba(0, 0, 0, 0.06);
                flex-wrap: wrap;
            }

            .page-title {
                display: flex;
                align-items: center;
                gap: 1.25rem;
            }

            .title-icon {
                width: 56px;
                height: 56px;
                border-radius: 14px;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                color: white;
                box-shadow: 0 8px 24px rgba(59, 130, 246, 0.35);
            }

            .title-text h1 {
                font-size: 1.75rem;
                font-weight: 800;
                color: #1f2937;
                margin-bottom: 0.25rem;
                -webkit-text-fill-color: #1f2937;
            }

            .title-text p {
                color: #6b7280;
                font-size: 0.9375rem;
                margin: 0;
            }

            .stat-pill {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.5rem 1rem;
                background: #eff6ff;
                border: 1px solid rgba(59, 130, 246, 0.15);
                border-radius: 999px;
                color: #3b82f6;
                font-size: 0.8125rem;
                font-weight: 600;
            }

            /* Filter Section */
            .filter-section {
                padding: 1.5rem;
                background: #ffffff;
                border-radius: 16px;
                border: 1px solid rgba(0, 0, 0, 0.06);
            }

            .filter-header {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                margin-bottom: 1.25rem;
                padding-bottom: 1rem;
                border-bottom: 1px solid rgba(0, 0, 0, 0.06);
            }

            .filter-header i {
                color: #3b82f6;
                font-size: 1rem;
            }

            .filter-header h3 {
                font-size: 1rem;
                font-weight: 700;
                color: #1f2937;
                margin: 0;
            }

            .filter-grid {
                display: flex;
                flex-wrap: wrap;
                gap: 1.25rem;
                align-items: flex-end;
            }

            .filter-grid .form-group {
                min-width: 200px;
                flex: 1;
            }

            .filter-grid .form-label {
                color: #4b5563;
                font-weight: 600;
                font-size: 0.8125rem;
            }

            .filter-grid .form-label i {
                color: #3b82f6;
            }

            .filter-actions {
                display: flex;
                align-items: flex-end;
            }

            /* Premium Grid Table */
            .table-container {
                padding: 0;
                overflow: hidden;
                border-radius: 16px;
                background: #ffffff;
                border: 1px solid rgba(0, 0, 0, 0.06);
            }

            .premium-grid-table {
                width: 100%;
                border-collapse: collapse;
            }

            .premium-grid-table th {
                background: #f8fafc;
                padding: 1rem 1.5rem;
                text-align: left;
                font-weight: 600;
                font-size: 0.75rem;
                color: #6b7280;
                text-transform: uppercase;
                letter-spacing: 0.05em;
                border-bottom: 1px solid rgba(0, 0, 0, 0.06);
            }

            .header-icon {
                margin-right: 0.5rem;
                color: #3b82f6;
            }

            .premium-grid-table td {
                padding: 1rem 1.5rem;
                color: #1f2937;
                border-bottom: 1px solid rgba(0, 0, 0, 0.04);
                vertical-align: middle;
                background: transparent;
                transition: all 0.2s ease;
            }

            .premium-grid-table tr {
                transition: all 0.2s ease;
            }

            .premium-grid-table tbody tr:hover {
                background: #f8fafc;
            }

            .premium-grid-table tbody tr:hover td {
                color: #1f2937;
            }

            .premium-grid-table tbody tr:last-child td {
                border-bottom: none;
            }

            /* Question Cell */
            .question-cell {
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .question-icon-box {
                width: 40px;
                height: 40px;
                border-radius: 10px;
                background: #eff6ff;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #3b82f6;
                font-size: 1rem;
                flex-shrink: 0;
            }

            .question-text-content {
                color: #1f2937;
                font-size: 0.9375rem;
                font-weight: 500;
                line-height: 1.5;
            }

            /* Badge Pills */
            .badge-pill {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 0.375rem 0.875rem;
                border-radius: 999px;
                font-size: 0.8125rem;
                font-weight: 600;
                min-width: 70px;
                text-align: center;
            }

            .badge-pill.category {
                background: #eff6ff;
                color: #3b82f6;
            }

            .badge-pill.company {
                background: #cffafe;
                color: #0891b2;
            }

            /* Action Buttons Container */
            .action-buttons {
                display: flex;
                gap: 0.5rem;
                align-items: center;
            }

            /* Action Button */
            .action-btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
                padding: 0.5rem 1rem;
                border-radius: 8px;
                font-size: 0.8125rem;
                font-weight: 600;
                text-decoration: none;
                transition: all 0.25s ease;
                cursor: pointer;
                border: none;
            }

            .action-btn.save {
                background: #eff6ff;
                color: #3b82f6;
            }

            .action-btn.save:hover {
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
            }

            .action-btn.info {
                background: #f0fdf4;
                color: #10b981;
            }

            .action-btn.info {
                display: none;
                /* Hidden on desktop */
            }

            .action-btn.info:hover {
                background: linear-gradient(135deg, #10b981, #059669);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
            }

            /* Empty State */
            .empty-state {
                padding: 5rem 2rem;
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

            /* Responsive */
            @media (max-width: 768px) {
                .page-header {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .filter-grid {
                    flex-direction: column;
                }

                .filter-grid .form-group {
                    width: 100%;
                }

                .premium-grid-table thead {
                    display: none;
                }

                .premium-grid-table,
                .premium-grid-table tbody,
                .premium-grid-table tr,
                .premium-grid-table td {
                    display: block;
                }

                .premium-grid-table tbody tr {
                    padding: 1.25rem;
                    margin-bottom: 1rem;
                    background: white;
                    border-radius: 12px;
                    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
                    border: 1px solid rgba(0, 0, 0, 0.04);
                }

                .premium-grid-table td {
                    display: block;
                    width: 100%;
                    padding: 0.5rem 0;
                    border: none;
                    background: transparent !important;
                    text-align: left;
                }

                /* Mobile Columns Layout - Vertical Stack */
                .col-question {
                    width: 100%;
                    padding-bottom: 0.75rem;
                    margin-bottom: 0.75rem;
                    border-bottom: 1px solid rgba(0, 0, 0, 0.06);
                }

                /* HIDE category and company columns on mobile */
                .col-category,
                .col-company {
                    display: none !important;
                }

                .col-action {
                    width: 100%;
                    margin-top: 0.5rem;
                    padding: 0 !important;
                }

                .question-cell {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 0.75rem;
                }

                .badge-pill {
                    margin-top: 0;
                }

                /* Mobile Action Buttons - Icon Only */
                .action-buttons {
                    display: flex;
                    gap: 0.5rem;
                    justify-content: flex-end;
                    /* Align to right */
                }

                .action-btn .btn-text {
                    display: none;
                }

                .action-btn {
                    width: 44px;
                    height: 44px;
                    padding: 0;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    border-radius: 50%;
                }

                .action-btn.info {
                    display: inline-flex;
                    /* Show on mobile */
                }

                .action-btn i {
                    font-size: 1.125rem;
                }

                /* Mobile Pagination Fixes */
                .pagination-container {
                    padding: 1rem 0.5rem;
                    overflow: visible;
                }

                .pagination-wrapper {
                    padding: 0.5rem 0.25rem;
                    gap: 2rem;
                    /* Space between arrows */
                    width: auto;
                    display: flex;
                    justify-content: center;
                }

                /* Hide the table containing numbers on mobile */
                .pagination-container table {
                    display: none !important;
                }

                .page-arrow {
                    width: 44px;
                    height: 44px;
                    font-size: 1.5rem;
                    background: white;
                    border: 1px solid #e5e7eb;
                    border-radius: 50%;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
                }
            }

            /* Tablet adjustments */
            @media (min-width: 769px) and (max-width: 1024px) {
                .pagination-container {
                    padding: 1.25rem;
                }

                .pagination-wrapper {
                    padding: 0.45rem 0.9rem;
                }

                .pagination-container a,
                .pagination-container span:not(.pagination-nav):not(.page-arrow):not(.page-ellipsis) {
                    min-width: 35px;
                    height: 35px;
                }

                .page-arrow {
                    width: 35px;
                    height: 35px;
                }
            }

            /* Pagination Styling - Modern Design */
            .pagination-container {
                padding: 1.5rem;
                display: flex;
                justify-content: center;
                align-items: center;
                width: 100%;
                text-align: center;
                background: #f8f9fa;
                overflow: hidden;
            }

            .pagination-container table {
                width: auto !important;
                margin: 0 auto;
                background: white;
                border-radius: 8px;
                padding: 0.5rem 0.75rem;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
                border: 1px solid #e5e7eb;
                max-width: 100%;
                overflow: hidden;
            }

            .pagination-container tr {
                display: flex;
                align-items: center;
                gap: 0.4rem;
                flex-wrap: nowrap;
                justify-content: center;
            }

            .pagination-container td {
                display: inline-block !important;
                padding: 0 !important;
                border: none !important;
                background: transparent !important;
            }

            .pagination-container a,
            .pagination-container span:not(.pagination-nav) {
                display: inline-flex;
                justify-content: center;
                align-items: center;
                min-width: 40px;
                height: 40px;
                padding: 0 10px;
                border-radius: 6px;
                font-weight: 500;
                font-size: 0.9375rem;
                text-decoration: none;
                color: #6b7280;
                transition: all 0.2s ease;
                border: 1px solid transparent;
            }

            .pagination-container a:hover {
                background: #f3f4f6;
                color: #1f2937;
                border-color: #e5e7eb;
            }

            /* Current Page - Highlighted */
            .pagination-container span:not(.pagination-nav):not(.page-arrow):not(.page-ellipsis) {
                background: #3b82f6;
                color: white;
                border-color: #3b82f6;
                font-weight: 600;
            }

            /* Pagination Wrapper with Arrows */
            .pagination-wrapper {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
                background: white;
                border-radius: 8px;
                padding: 0.5rem 0.75rem;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
                border: 1px solid #e5e7eb;
                max-width: 100%;
                overflow: hidden;
                box-sizing: border-box;
            }

            .page-arrow {
                display: inline-flex;
                justify-content: center;
                align-items: center;
                width: 40px;
                height: 40px;
                border-radius: 6px;
                font-size: 1.25rem;
                font-weight: 400;
                color: #6b7280;
                cursor: pointer;
                transition: all 0.2s ease;
                user-select: none;
                border: 1px solid transparent;
            }

            .page-arrow:hover {
                background: #f3f4f6;
                color: #1f2937;
                border-color: #e5e7eb;
            }

            .page-ellipsis {
                color: #9ca3af !important;
                font-weight: 500 !important;
                background: transparent !important;
                border: none !important;
            }

            .pagination-wrapper table {
                background: transparent !important;
                box-shadow: none !important;
                padding: 0 !important;
                border: none !important;
            }

            .premium-grid-table td {
                padding: 1rem 1.5rem;
                color: #1f2937;
                border-bottom: 1px solid rgba(0, 0, 0, 0.04);
                vertical-align: top;
                background: transparent;
                transition: all 0.2s ease;
            }

            /* Question Wrapper */
            .question-wrapper {
                display: flex;
                flex-direction: column;
                gap: 0.75rem;
            }

            /* Show Answer Button */
            .btn-show-answer {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.5rem 1rem;
                background: #eff6ff;
                color: #3b82f6;
                border: none;
                border-radius: 8px;
                font-size: 0.8125rem;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.25s ease;
                width: fit-content;
            }

            .btn-show-answer:hover {
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
            }

            .btn-show-answer i {
                transition: transform 0.3s ease;
            }

            .question-wrapper.expanded .btn-show-answer i {
                transform: rotate(180deg);
            }

            .question-wrapper.expanded .btn-show-answer {
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                color: white;
            }

            /* Answer Dropdown */
            .answer-dropdown {
                max-height: 0;
                overflow: hidden;
                transition: max-height 0.4s cubic-bezier(0.16, 1, 0.3, 1);
            }

            .question-wrapper.expanded .answer-dropdown {
                max-height: 500px;
            }

            .answer-content {
                padding: 1rem;
                background: #f0fdf4;
                border-radius: 12px;
                border-left: 4px solid #10b981;
                margin-top: 0.5rem;
            }

            .answer-header {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                margin-bottom: 0.75rem;
                color: #059669;
                font-weight: 700;
                font-size: 0.875rem;
            }

            .answer-header i {
                color: #10b981;
            }

            /* Options List */
            .options-list {
                display: flex;
                flex-direction: column;
                gap: 0.5rem;
                margin-bottom: 1rem;
            }

            .option-item {
                display: flex;
                align-items: center;
                gap: 0.75rem;
                padding: 0.75rem 1rem;
                background: #ffffff;
                border-radius: 8px;
                border: 1px solid rgba(0, 0, 0, 0.08);
                transition: all 0.2s ease;
            }

            .option-item.correct {
                background: #d1fae5;
                border-color: #10b981;
            }

            .option-label {
                width: 28px;
                height: 28px;
                border-radius: 50%;
                background: #eff6ff;
                color: #3b82f6;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 700;
                font-size: 0.8125rem;
                flex-shrink: 0;
            }

            .option-item.correct .option-label {
                background: #10b981;
                color: white;
            }

            .option-text {
                flex: 1;
                color: #1f2937;
                font-size: 0.9rem;
            }

            .correct-icon {
                color: #10b981;
                font-size: 1rem;
            }

            .correct-answer-box {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.75rem 1rem;
                background: linear-gradient(135deg, #fef3c7, #fde68a);
                border-radius: 8px;
                color: #92400e;
                font-weight: 600;
                font-size: 0.875rem;
            }

            .correct-answer-box i {
                color: #f59e0b;
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
                z-index: 9999;
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
                padding: 1.5rem;
                max-width: 400px;
                width: 90%;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                animation: slideUp 0.3s ease;
            }

            .info-modal-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 1.25rem;
                padding-bottom: 1rem;
                border-bottom: 1px solid #e5e7eb;
            }

            .info-modal-header h3 {
                font-size: 1.25rem;
                font-weight: 700;
                color: #1f2937;
                margin: 0;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .info-modal-header h3 i {
                color: #10b981;
            }

            .info-modal-close {
                background: none;
                border: none;
                font-size: 1.5rem;
                color: #6b7280;
                cursor: pointer;
                padding: 0;
                width: 32px;
                height: 32px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                transition: all 0.2s ease;
            }

            .info-modal-close:hover {
                background: #f3f4f6;
                color: #1f2937;
            }

            .info-modal-body {
                display: flex;
                flex-direction: column;
                gap: 1rem;
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
            }

            .info-value {
                display: inline-flex;
                align-items: center;
                padding: 0.5rem 1rem;
                border-radius: 999px;
                font-size: 0.9375rem;
                font-weight: 600;
                width: fit-content;
            }

            .info-value.category {
                background: #eff6ff;
                color: #3b82f6;
            }

            .info-value.company {
                background: #cffafe;
                color: #0891b2;
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
        </style>

        <script>
            function toggleAnswer(button) {
                const wrapper = button.closest('.question-wrapper');
                wrapper.classList.toggle('expanded');

                // Update button text
                const span = button.querySelector('span');
                if (wrapper.classList.contains('expanded')) {
                    span.textContent = 'Hide Answer';
                } else {
                    span.textContent = 'Show Answer';
                }
            }

            // Show question info modal
            function showQuestionInfo(button) {
                const category = button.getAttribute('data-category');
                const company = button.getAttribute('data-company');

                // Create modal if it doesn't exist
                let modal = document.getElementById('questionInfoModal');
                if (!modal) {
                    modal = document.createElement('div');
                    modal.id = 'questionInfoModal';
                    modal.className = 'info-modal';
                    modal.innerHTML = `
                        <div class="info-modal-content">
                            <div class="info-modal-header">
                                <h3><i class="fas fa-info-circle"></i> Question Details</h3>
                                <button class="info-modal-close" onclick="closeQuestionInfo()">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                            <div class="info-modal-body">
                                <div class="info-item">
                                    <div class="info-label">
                                        <i class="fas fa-tag"></i>
                                        Category
                                    </div>
                                    <div class="info-value category" id="modalCategory"></div>
                                </div>
                                <div class="info-item">
                                    <div class="info-label">
                                        <i class="fas fa-building"></i>
                                        Company
                                    </div>
                                    <div class="info-value company" id="modalCompany"></div>
                                </div>
                            </div>
                        </div>
                    `;
                    document.body.appendChild(modal);

                    // Close on backdrop click
                    modal.addEventListener('click', function (e) {
                        if (e.target === modal) {
                            closeQuestionInfo();
                        }
                    });
                }

                // Update modal content
                document.getElementById('modalCategory').textContent = category;
                document.getElementById('modalCompany').textContent = company;

                // Show modal
                modal.classList.add('active');
            }

            function closeQuestionInfo() {
                const modal = document.getElementById('questionInfoModal');
                if (modal) {
                    modal.classList.remove('active');
                }
            }

            // Add pagination arrows and smart ellipsis on page load
            document.addEventListener('DOMContentLoaded', function () {
                setupSmartPagination();
            });

            function setupSmartPagination() {
                const paginationContainer = document.querySelector('.pagination-container');
                if (!paginationContainer) return;

                const pagerTable = paginationContainer.querySelector('table');
                if (!pagerTable) return;

                const pagerRow = pagerTable.querySelector('tr');
                if (!pagerRow) return;

                // 1. Clean up existing ellipses
                const existingEllipses = pagerRow.querySelectorAll('.page-ellipsis-cell');
                existingEllipses.forEach(el => el.remove());

                // 2. Get all page cells
                const cells = Array.from(pagerRow.querySelectorAll('td'));

                // 3. Find current page
                let currentPageIndex = -1;
                cells.forEach((cell, index) => {
                    // Reset visibility first
                    cell.style.display = '';
                    if (cell.querySelector('span')) {
                        currentPageIndex = index;
                    }
                });

                // 4. Determine pages to show
                const totalPages = cells.length;

                // If we have many pages, hide some
                if (totalPages > 5) { // Threshold for hiding
                    const delta = 1; // Pages around current
                    const pagesToShow = new Set();

                    // Always show first
                    pagesToShow.add(0);

                    // Show around current
                    for (let i = Math.max(0, currentPageIndex - delta); i <= Math.min(totalPages - 1, currentPageIndex + delta); i++) {
                        pagesToShow.add(i);
                    }

                    // Always show last
                    pagesToShow.add(totalPages - 1);

                    // Convert to sorted array
                    const visiblePages = Array.from(pagesToShow).sort((a, b) => a - b);

                    // Hide non-visible pages
                    cells.forEach((cell, index) => {
                        if (!pagesToShow.has(index)) {
                            cell.style.display = 'none';
                        }
                    });

                    // Add ellipses for gaps
                    for (let i = visiblePages.length - 2; i >= 0; i--) {
                        const pageIndex = visiblePages[i];
                        const nextPage = visiblePages[i + 1];

                        if (nextPage - pageIndex > 1) {
                            const ellipsisCell = document.createElement('td');
                            ellipsisCell.className = 'page-ellipsis-cell';
                            ellipsisCell.style.display = 'inline-block';
                            ellipsisCell.style.padding = '0';

                            const ellipsisSpan = document.createElement('span');
                            ellipsisSpan.textContent = '...';
                            ellipsisSpan.className = 'page-ellipsis';
                            ellipsisSpan.style.display = 'inline-flex';
                            ellipsisSpan.style.justifyContent = 'center';
                            ellipsisSpan.style.alignItems = 'center';
                            ellipsisSpan.style.minWidth = '30px';
                            ellipsisSpan.style.height = '36px';
                            ellipsisSpan.style.color = '#6b7280';

                            ellipsisCell.appendChild(ellipsisSpan);
                            cells[pageIndex].parentNode.insertBefore(ellipsisCell, cells[nextPage]);
                        }
                    }
                }

                // 5. Wrap table and add arrows if not done
                let wrapper = paginationContainer.querySelector('.pagination-wrapper');
                if (!wrapper) {
                    wrapper = document.createElement('div');
                    wrapper.className = 'pagination-wrapper';
                    pagerTable.parentNode.insertBefore(wrapper, pagerTable);
                    wrapper.appendChild(pagerTable);

                    const prevArrow = document.createElement('span');
                    prevArrow.className = 'page-arrow';
                    prevArrow.innerHTML = '«';
                    prevArrow.onclick = function () {
                        const currentSpan = pagerRow.querySelector('span:not(.page-ellipsis):not(.page-arrow)');
                        if (currentSpan) {
                            const prevLink = currentSpan.parentElement.previousElementSibling?.querySelector('a');
                            if (prevLink) prevLink.click();
                        }
                    };
                    wrapper.insertBefore(prevArrow, pagerTable);

                    const nextArrow = document.createElement('span');
                    nextArrow.className = 'page-arrow';
                    nextArrow.innerHTML = '»';
                    nextArrow.onclick = function () {
                        const currentSpan = pagerRow.querySelector('span:not(.page-ellipsis):not(.page-arrow)');
                        if (currentSpan) {
                            const nextLink = currentSpan.parentElement.nextElementSibling?.querySelector('a');
                            if (nextLink) nextLink.click();
                        }
                    };
                    wrapper.appendChild(nextArrow);
                }
            }

        </script>

    </asp:Content>