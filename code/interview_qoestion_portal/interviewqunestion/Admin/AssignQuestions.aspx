<%@ Page Title="Assign Questions" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="AssignQuestions.aspx.cs" Inherits="interview_questions.Admin.AssignQuestions" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <style>
            /* AGGRESSIVE OVERFLOW REMOVAL */
            *,
            *::before,
            *::after {
                box-sizing: border-box !important;
            }

            /* Exclude checkboxes from max-width */
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

            .admin-wrapper {
                overflow-x: hidden !important;
                width: 100% !important;
                max-width: 100vw !important;
            }

            .main-wrapper {
                overflow-x: hidden !important;
                width: 100% !important;
                max-width: calc(100vw - 0px) !important;
            }

            .content-area {
                overflow-x: hidden !important;
                width: 100% !important;
                max-width: 100% !important;
                padding: 0.5rem !important;
            }

            .content-card {
                overflow-x: hidden !important;
                width: 100% !important;
                max-width: 100% !important;
                padding: 0 !important;
            }

            /* Selector Card */
            .selector-card {
                background: rgba(30, 41, 59, 0.8) !important;
                border: 1px solid rgba(255, 255, 255, 0.1) !important;
                border-radius: 12px !important;
                padding: 1rem !important;
                margin-bottom: 1rem !important;
                width: 100% !important;
                max-width: 100% !important;
                overflow: hidden !important;
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

            .table tbody,
            .table-mobile-cards tbody,
            table tbody {
                width: 100% !important;
                max-width: 100% !important;
            }

            .table tr,
            .table-mobile-cards tr,
            table tr {
                width: 100% !important;
                max-width: 100% !important;
            }

            .table td,
            .table-mobile-cards td,
            table td {
                word-wrap: break-word !important;
                overflow-wrap: break-word !important;
                white-space: normal !important;
                max-width: 100% !important;
            }

            .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1rem;
                flex-wrap: wrap;
                gap: 1rem;
            }

            .section-title {
                color: #f8fafc !important;
                font-size: 1.1rem !important;
                font-weight: 600 !important;
                margin: 0 !important;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .section-title i {
                color: #3b82f6;
            }

            /* Form Controls - Dark Theme (Exclude checkboxes) */
            .form-control,
            .form-select,
            input:not([type="checkbox"]):not([type="radio"]),
            select {
                background: #0f172a !important;
                background-color: #0f172a !important;
                border: 2px solid #334155 !important;
                color: #f1f5f9 !important;
                padding: 0.875rem 1rem !important;
                border-radius: 10px !important;
                font-size: 1rem !important;
                width: 100% !important;
                max-width: 100% !important;
                -webkit-appearance: none !important;
                -moz-appearance: none !important;
                appearance: none !important;
            }

            .form-control:focus,
            .form-select:focus,
            input:not([type="checkbox"]):not([type="radio"]):focus,
            select:focus {
                background: #1e293b !important;
                border-color: #3b82f6 !important;
                box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.25) !important;
                outline: none !important;
            }

            .form-label {
                color: #f1f5f9 !important;
                font-weight: 600 !important;
                font-size: 0.9rem !important;
                margin-bottom: 0.5rem !important;
                display: block !important;
            }

            /* Form Row */
            .form-row {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 1rem;
            }

            /* Divider */
            .divider {
                height: 2px;
                background: rgba(255, 255, 255, 0.1);
                margin: 1.5rem 0;
                border-radius: 1px;
            }

            /* Checkbox Styling - Fixed for functionality */
            .col-checkbox {
                width: 50px;
                text-align: center;
            }

            /* Reset checkbox to default then style */
            .question-checkbox input[type="checkbox"],
            input[type="checkbox"] {
                width: 22px !important;
                height: 22px !important;
                min-width: 22px !important;
                min-height: 22px !important;
                max-width: 22px !important;
                max-height: 22px !important;
                accent-color: #3b82f6 !important;
                cursor: pointer !important;
                margin: 0 !important;
                padding: 0 !important;
                -webkit-appearance: checkbox !important;
                -moz-appearance: checkbox !important;
                appearance: checkbox !important;
                background: transparent !important;
                border: none !important;
            }

            /* Button Styles */
            .btn-success {
                background: linear-gradient(135deg, #10b981 0%, #059669 100%) !important;
                color: white !important;
                border: none !important;
                padding: 0.75rem 1.5rem !important;
                border-radius: 8px !important;
                font-weight: 600 !important;
                cursor: pointer !important;
                transition: all 0.2s ease !important;
            }

            .btn-success:hover {
                transform: translateY(-2px) !important;
                box-shadow: 0 4px 12px rgba(16, 185, 129, 0.4) !important;
            }

            .btn-danger {
                background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%) !important;
                color: white !important;
                border: none !important;
                padding: 0.5rem 1rem !important;
                border-radius: 8px !important;
                font-weight: 600 !important;
                cursor: pointer !important;
            }

            .btn-danger:hover {
                transform: translateY(-2px) !important;
                box-shadow: 0 4px 12px rgba(239, 68, 68, 0.4) !important;
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

            .pagination-container span {
                background: #3b82f6;
                color: white;
            }

            /* Mobile Responsive */
            @media (max-width: 768px) {

                /* Force everything within viewport */
                html,
                body {
                    max-width: 100vw !important;
                    overflow-x: hidden !important;
                }

                *:not([type="checkbox"]):not([type="radio"]) {
                    max-width: 100vw !important;
                }

                .admin-wrapper,
                .main-wrapper {
                    max-width: 100vw !important;
                    overflow-x: hidden !important;
                }

                .content-area {
                    padding: 0.5rem !important;
                    width: 100vw !important;
                    max-width: 100vw !important;
                    overflow-x: hidden !important;
                }

                .content-card {
                    width: 100% !important;
                    max-width: 100% !important;
                    padding: 0 !important;
                    margin: 0 !important;
                }

                .page-header {
                    padding: 0 0 0.5rem 0 !important;
                    margin: 0 0 0.5rem 0 !important;
                    width: 100% !important;
                }

                .page-title {
                    font-size: 1.3rem !important;
                    font-weight: 700 !important;
                    color: #f8fafc !important;
                }

                .page-subtitle {
                    font-size: 0.8rem !important;
                    color: #94a3b8 !important;
                    margin-top: 0.25rem !important;
                }

                .selector-card,
                .table-card {
                    padding: 0.75rem !important;
                    margin: 0 0 0.75rem 0 !important;
                    width: 100% !important;
                    max-width: 100% !important;
                    border-radius: 10px !important;
                }

                .table-wrapper {
                    padding: 0 !important;
                    margin: 0 !important;
                    width: 100% !important;
                    max-width: 100% !important;
                    overflow-x: hidden !important;
                }

                .form-row {
                    grid-template-columns: 1fr;
                    gap: 0.75rem;
                }

                .section-header {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .section-header .btn {
                    width: 100%;
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
                    max-width: 100% !important;
                }

                /* Data Rows - Card Style */
                .table-mobile-cards>tbody>tr.data-row {
                    display: block !important;
                    background: rgba(15, 23, 42, 0.8) !important;
                    border: 1px solid rgba(255, 255, 255, 0.1) !important;
                    border-radius: 10px !important;
                    padding: 0.75rem !important;
                    width: 100% !important;
                    max-width: 100% !important;
                    box-sizing: border-box !important;
                    overflow: hidden !important;
                }

                .table-mobile-cards>tbody>tr.data-row>td {
                    display: block !important;
                    padding: 0.5rem 0 !important;
                    border: none !important;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.05) !important;
                    background: transparent !important;
                }

                .table-mobile-cards>tbody>tr.data-row>td:last-child {
                    border-bottom: none !important;
                    padding-top: 0.75rem !important;
                }

                /* Mobile Labels */
                .table-mobile-cards>tbody>tr.data-row>td::before {
                    color: #64748b;
                    font-weight: 500;
                    font-size: 0.75rem;
                    display: block;
                    margin-bottom: 0.25rem;
                    text-transform: uppercase;
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(1)::before {
                    content: "";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(2)::before {
                    content: "ID:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(3)::before {
                    content: "QUESTION:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(4)::before {
                    content: "CATEGORY:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(5)::before {
                    content: "COMPANY:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:last-child::before {
                    display: none;
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
                    background: transparent !important;
                    border: none !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row) a {
                    min-width: 50px !important;
                    height: 50px !important;
                    font-size: 1.5rem !important;
                }

                .col-checkbox {
                    width: 100%;
                    text-align: left;
                    display: flex !important;
                    align-items: center;
                    gap: 0.5rem;
                }
            }
        </style>

        <div class="page-header">
            <h1 class="page-title">Assign Questions to Tests</h1>
            <p class="page-subtitle">Link questions to specific tests for assessment creation</p>
        </div>

        <div class="selector-card">
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">Select Test</label>
                    <asp:DropDownList ID="ddlTest" runat="server" CssClass="form-select" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlTest_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label">Filter by Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>
        </div>

        <asp:Label ID="lblMsg" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>

        <!-- All Questions Section -->
        <div class="table-card">
            <div class="section-header">
                <h2 class="section-title">
                    <i class="fas fa-list"></i>
                    Available Test Questions
                </h2>
                <asp:Button ID="btnAssignSelected" runat="server" Text="Assign Selected" CssClass="btn btn-success"
                    OnClick="btnAssignSelected_Click" />
            </div>

            <div class="table-wrapper">
                <asp:GridView ID="gvAllQuestions" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-mobile-cards" DataKeyNames="Question_ID" GridLines="None"
                    ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="10"
                    OnPageIndexChanging="gvAllQuestions_PageIndexChanging">
                    <RowStyle CssClass="data-row" />
                    <AlternatingRowStyle CssClass="data-row" />
                    <PagerSettings Mode="NextPrevious" PreviousPageText="&lt;" NextPageText="&gt;" />
                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkSelectAll" runat="server" onclick="toggleSelectAll(this)"
                                    ToolTip="Select All" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" CssClass="question-checkbox" />
                            </ItemTemplate>
                            <ItemStyle CssClass="col-checkbox" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Question_ID" HeaderText="ID">
                            <ItemStyle CssClass="col-id" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Question_Text" HeaderText="Question">
                            <ItemStyle CssClass="col-question" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Category_Name" HeaderText="Category">
                            <ItemStyle CssClass="col-category" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Company_Name" HeaderText="Company">
                            <ItemStyle CssClass="col-company" />
                        </asp:BoundField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-state">
                            <i class="fas fa-inbox"></i>
                            <div class="empty-state-title">No Test Questions Available</div>
                            <p>All test questions have been assigned or no questions match the filter</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>

        <div class="divider"></div>

        <!-- Assigned Questions Section -->
        <div class="table-card">
            <div class="section-header">
                <h2 class="section-title">
                    <i class="fas fa-check-circle"></i>
                    Assigned Questions
                </h2>
            </div>

            <div class="table-wrapper">
                <asp:GridView ID="gvAssigned" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-mobile-cards" DataKeyNames="TQ_ID" OnRowCommand="gvAssigned_RowCommand"
                    GridLines="None" ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="10"
                    OnPageIndexChanging="gvAssigned_PageIndexChanging">
                    <RowStyle CssClass="data-row" />
                    <AlternatingRowStyle CssClass="data-row" />
                    <PagerSettings Mode="NextPrevious" PreviousPageText="&lt;" NextPageText="&gt;" />
                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="TQ_ID" HeaderText="Assignment ID">
                            <ItemStyle CssClass="col-id" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Question_ID" HeaderText="Question ID">
                            <ItemStyle CssClass="col-id" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Question_Text" HeaderText="Question">
                            <ItemStyle CssClass="col-question" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="Remove"
                                    CommandArgument='<%# Eval("TQ_ID") %>' CssClass="btn btn-danger"
                                    OnClientClick="return confirm('Are you sure you want to remove this question from the test?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-state">
                            <i class="fas fa-clipboard-check"></i>
                            <div class="empty-state-title">No Questions Assigned</div>
                            <p>Select a test and assign questions from the list above</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>

        <script>
            // Select All checkbox functionality
            function toggleSelectAll(selectAllCheckbox) {
                var gridView = selectAllCheckbox.closest('table');
                var checkboxes = gridView.querySelectorAll('.question-checkbox input[type="checkbox"]');

                checkboxes.forEach(function (checkbox) {
                    checkbox.checked = selectAllCheckbox.checked;
                });
            }

            // Show message and auto-hide after 3 seconds
            window.onload = function () {
                var lblMsg = document.getElementById('<%= lblMsg.ClientID %>');
                if (lblMsg && lblMsg.innerText.trim() !== '') {
                    lblMsg.style.display = 'flex';
                    setTimeout(function () {
                        lblMsg.style.opacity = '0';
                        setTimeout(function () {
                            lblMsg.style.display = 'none';
                            lblMsg.style.opacity = '1';
                        }, 300);
                    }, 3000);
                }
            };
        </script>
    </asp:Content>