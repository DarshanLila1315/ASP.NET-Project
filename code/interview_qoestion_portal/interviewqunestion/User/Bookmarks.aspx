<%@ Page Title="Bookmarks" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true"
    CodeBehind="Bookmarks.aspx.cs" Inherits="interview_questions.User.Bookmarks" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div class="bookmarks-page">

            <!-- Page Header -->
            <div class="page-header animate-fade-in-up">
                <div class="page-title">
                    <div class="title-icon saved">
                        <i class="fas fa-bookmark"></i>
                    </div>
                    <div class="title-text">
                        <h1>Saved Questions</h1>
                        <p>Your bookmarked questions for quick review</p>
                    </div>
                </div>
                <div class="bookmark-count-badge">
                    <i class="fas fa-heart"></i>
                    <asp:Label ID="lblBookmarkCount" runat="server" Text="0 Bookmarks" />
                </div>
            </div>

            <!-- Bookmarks Grid Table -->
            <div class="table-container glass-card animate-fade-in-up" style="animation-delay: 0.1s;">
                <asp:GridView ID="gvBookmarks" runat="server" CssClass="premium-grid-table" AutoGenerateColumns="False"
                    DataKeyNames="Bookmark_ID" OnRowCommand="gvBookmarks_RowCommand" ShowHeaderWhenEmpty="True"
                    AllowPaging="True" PageSize="10" OnPageIndexChanging="gvBookmarks_PageIndexChanging"
                    EmptyDataText="" GridLines="None">
                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />

                    <Columns>
                        <asp:TemplateField HeaderText="Question" ItemStyle-CssClass="col-question">
                            <HeaderTemplate>
                                <span class="header-icon"><i class="fas fa-file-alt"></i></span> QUESTION
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="question-wrapper">
                                    <div class="question-cell">
                                        <div class="question-icon-box">
                                            <i class="fas fa-bookmark"></i>
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
                                                <span> Answer: <strong>
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
                                <span class="header-icon"><i class="fas fa-trash"></i></span> ACTION
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:LinkButton ID="btnRemove" runat="server" CssClass="action-btn remove"
                                        CommandName="Remove" CommandArgument='<%# Eval("Bookmark_ID") %>'
                                        OnClientClick="return confirm('Remove this bookmark?');">
                                        <i class="fas fa-trash"></i> <span class="btn-text">Remove</span>
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
                            <div class="empty-state-illustration">
                                <div class="illustration-bg">
                                    <i class="fas fa-bookmark"></i>
                                </div>
                                <div class="floating-icons">
                                    <i class="fas fa-heart float-1"></i>
                                    <i class="fas fa-star float-2"></i>
                                    <i class="fas fa-code float-3"></i>
                                </div>
                            </div>
                            <h3>No bookmarks yet</h3>
                            <p>Save questions you want to revisit later. They'll appear here for quick access.</p>
                            <a href="Questions.aspx" class="btn btn-primary">
                                <i class="fas fa-search"></i>
                                Browse Questions
                            </a>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

        </div>

        <style>
            .bookmarks-page {
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

            .title-icon.saved {
                background: linear-gradient(135deg, #f59e0b, #d97706);
                box-shadow: 0 6px 18px rgba(245, 158, 11, 0.35);
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

            .bookmark-count-badge {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                padding: 0.625rem 1rem;
                background: #fef3c7;
                border: 1px solid rgba(245, 158, 11, 0.2);
                border-radius: 10px;
                color: #d97706;
                font-size: 0.875rem;
                font-weight: 600;
            }

            .bookmark-count-badge i {
                color: #f59e0b;
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
                background: #fef3c7;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #d97706;
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

            /* Action Button - Remove */
            .action-btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                gap: 0.375rem;
                padding: 0.5rem 1rem;
                border-radius: 8px;
                font-size: 0.8125rem;
                font-weight: 600;
                text-decoration: none;
                transition: all 0.25s ease;
                cursor: pointer;
                border: none;
            }

            .action-btn.remove {
                background: #fee2e2;
                color: #dc2626;
            }

            .action-btn.remove:hover {
                background: linear-gradient(135deg, #ef4444, #dc2626);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 15px rgba(239, 68, 68, 0.3);
            }

            .action-btn.info {
                background: #f0fdf4;
                color: #10b981;
                display: none;
                /* Hidden on desktop */
            }

            .action-btn.info:hover {
                background: linear-gradient(135deg, #10b981, #059669);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
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

            /* Empty State with Illustration */
            .empty-state {
                padding: 4rem 2rem;
                text-align: center;
            }

            .empty-state-illustration {
                position: relative;
                width: 110px;
                height: 110px;
                margin: 0 auto 1.5rem;
            }

            .illustration-bg {
                width: 100%;
                height: 100%;
                border-radius: 50%;
                background: #fef3c7;
                border: 2px dashed rgba(245, 158, 11, 0.3);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 2.5rem;
                color: #f59e0b;
            }

            .floating-icons {
                position: absolute;
                inset: -20px;
            }

            .floating-icons i {
                position: absolute;
                font-size: 1rem;
                color: #3b82f6;
                opacity: 0.6;
            }

            .float-1 {
                top: 0;
                right: 10px;
                animation: floatUp 3s ease-in-out infinite;
            }

            .float-2 {
                bottom: 10px;
                left: 0;
                animation: floatUp 3s ease-in-out infinite 0.5s;
            }

            .float-3 {
                bottom: 20px;
                right: 0;
                animation: floatUp 3s ease-in-out infinite 1s;
            }

            @keyframes floatUp {

                0%,
                100% {
                    transform: translateY(0);
                    opacity: 0.6;
                }

                50% {
                    transform: translateY(-10px);
                    opacity: 1;
                }
            }

            .empty-state h3 {
                font-size: 1.25rem;
                color: #1f2937;
                margin-bottom: 0.5rem;
            }

            .empty-state p {
                color: #6b7280;
                font-size: 0.9375rem;
                margin-bottom: 1.5rem;
                max-width: 360px;
                margin-left: auto;
                margin-right: auto;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .page-header {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .bookmark-count-badge {
                    align-self: flex-start;
                }

                .premium-grid-table thead {
                    display: none !important;
                }

                .premium-grid-table th {
                    display: none !important;
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
        </script>

    </asp:Content>