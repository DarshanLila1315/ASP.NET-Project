<%@ Page Title="Manage Tests" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="ManageTests.aspx.cs" Inherits="interview_questions.Admin.ManageTests" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <style>
            /* AGGRESSIVE OVERFLOW REMOVAL */
            *,
            *::before,
            *::after {
                box-sizing: border-box !important;
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
                position: relative !important;
            }

            /* Force all containers to not overflow */
            .admin-wrapper {
                overflow-x: hidden !important;
                width: 100% !important;
                max-width: 100vw !important;
            }

            .main-wrapper {
                overflow-x: hidden !important;
                width: 100% !important;
                max-width: 100% !important;
            }

            .content-area {
                overflow-x: hidden !important;
                width: 100% !important;
                max-width: 100% !important;
                padding-left: 0.5rem !important;
                padding-right: 0.5rem !important;
            }

            .content-card {
                overflow-x: hidden !important;
                width: 100% !important;
                max-width: 100% !important;
            }

            .page-header,
            .form-card,
            .table-card,
            .table-wrapper,
            .form-row,
            .form-group,
            .form-actions {
                overflow: hidden !important;
                width: 100% !important;
                max-width: 100% !important;
            }

            table,
            tbody,
            tr,
            td {
                max-width: 100% !important;
                word-wrap: break-word !important;
                overflow-wrap: break-word !important;
            }

            /* Inputs */
            input,
            select,
            textarea,
            button {
                max-width: 100% !important;
                width: 100% !important;
                box-sizing: border-box !important;
            }

            /* Form Card Styling */
            .form-card {
                background: rgba(30, 41, 59, 0.8) !important;
                border: 1px solid rgba(255, 255, 255, 0.15) !important;
                border-radius: 16px !important;
                padding: 1.5rem !important;
                margin-bottom: 1.5rem !important;
            }

            .form-card-header {
                color: #f8fafc !important;
                font-size: 1.2rem !important;
                font-weight: 700 !important;
                margin-bottom: 1.25rem !important;
                padding-bottom: 0.75rem !important;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1) !important;
            }

            /* Force dark theme form controls - Bootstrap Override */
            .form-control,
            .form-select,
            input.form-control,
            select.form-select,
            input[type="text"],
            input[type="number"],
            input[type="email"],
            input[type="password"],
            textarea,
            select,
            .MainContent input[type="text"],
            .MainContent input[type="number"],
            .MainContent select,
            #MainContent input,
            #MainContent select,
            asp-content input,
            asp-content select {
                background: #0f172a !important;
                background-color: #0f172a !important;
                border: 2px solid #334155 !important;
                color: #f1f5f9 !important;
                padding: 0.875rem 1rem !important;
                border-radius: 10px !important;
                font-size: 1rem !important;
                width: 100% !important;
                max-width: 100% !important;
                box-sizing: border-box !important;
                display: block !important;
                margin: 0 !important;
                transition: all 0.2s ease !important;
                -webkit-appearance: none !important;
                -moz-appearance: none !important;
                appearance: none !important;
            }

            .form-control::placeholder,
            input.form-control::placeholder,
            input::placeholder {
                color: #64748b !important;
                opacity: 1 !important;
            }

            .form-control:hover,
            input.form-control:hover,
            select.form-select:hover,
            input:hover,
            select:hover {
                background: #1e293b !important;
                background-color: #1e293b !important;
                border-color: #3b82f6 !important;
            }

            .form-control:focus,
            input.form-control:focus,
            select.form-select:focus,
            input:focus,
            select:focus {
                background: #1e293b !important;
                background-color: #1e293b !important;
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
                letter-spacing: 0.3px;
            }

            /* Form Row Layout */
            .form-row {
                display: flex;
                gap: 1rem;
                margin-bottom: 1rem;
            }

            .form-group {
                flex: 1;
                min-width: 0;
            }

            /* Form Actions */
            .form-actions {
                display: flex;
                gap: 0.75rem;
                margin-top: 1.5rem;
                flex-wrap: wrap;
            }

            /* Action Buttons - Desktop */
            .action-buttons {
                display: flex !important;
                gap: 0.5rem !important;
                flex-wrap: nowrap !important;
            }

            .action-buttons .btn {
                min-width: 80px !important;
                max-width: 100px !important;
                padding: 0.5rem 1rem !important;
                font-size: 0.875rem !important;
                font-weight: 600 !important;
                border-radius: 8px !important;
                display: inline-flex !important;
                align-items: center !important;
                justify-content: center !important;
                cursor: pointer !important;
                border: none !important;
                transition: all 0.2s ease !important;
                flex: 1 !important;
                text-decoration: none !important;
            }

            .btn-warning,
            input[value="Edit"] {
                background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%) !important;
                color: #ffffff !important;
            }

            .btn-warning:hover,
            input[value="Edit"]:hover {
                background: linear-gradient(135deg, #d97706 0%, #b45309 100%) !important;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(245, 158, 11, 0.4) !important;
            }

            .btn-danger,
            input[value="Delete"] {
                background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%) !important;
                color: #ffffff !important;
            }

            .btn-danger:hover,
            input[value="Delete"]:hover {
                background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%) !important;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(239, 68, 68, 0.4) !important;
            }

            /* Primary Button (Save) */
            .btn-primary,
            input[value="Save Test"] {
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%) !important;
                color: #ffffff !important;
                border: none !important;
                padding: 0.75rem 1.5rem !important;
                font-weight: 600 !important;
                border-radius: 8px !important;
                cursor: pointer !important;
                transition: all 0.2s ease !important;
            }

            .btn-primary:hover,
            input[value="Save Test"]:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(59, 130, 246, 0.4) !important;
            }

            /* Secondary Button (Clear) */
            .btn-secondary,
            input[value="Clear"] {
                background: linear-gradient(135deg, #64748b 0%, #475569 100%) !important;
                color: #ffffff !important;
                padding: 0.75rem 1.5rem !important;
                font-weight: 600 !important;
                border-radius: 8px !important;
                border: none !important;
                cursor: pointer !important;
                transition: all 0.2s ease !important;
            }

            .btn-secondary:hover,
            input[value="Clear"]:hover {
                background: linear-gradient(135deg, #475569 0%, #334155 100%) !important;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(100, 116, 139, 0.4) !important;
            }

            /* Mobile responsive */
            @media (max-width: 768px) {

                /* Force all elements to respect viewport */
                *,
                *::before,
                *::after {
                    max-width: 100vw !important;
                }

                body,
                html {
                    overflow-x: hidden !important;
                    width: 100% !important;
                }

                .content-area {
                    padding: 0.75rem !important;
                    width: 100% !important;
                    max-width: 100% !important;
                    overflow-x: hidden !important;
                }

                .content-card {
                    padding: 0 !important;
                    width: 100% !important;
                }

                /* Form Card on Mobile */
                .form-card {
                    background: rgba(30, 41, 59, 0.9) !important;
                    border-radius: 12px !important;
                    border: 1px solid rgba(255, 255, 255, 0.1) !important;
                    padding: 1rem !important;
                    margin: 0 0 1rem 0 !important;
                    width: 100% !important;
                    max-width: 100% !important;
                }

                .form-card-header {
                    font-size: 1rem !important;
                    margin-bottom: 1rem !important;
                }

                /* Table Card on Mobile */
                .table-card {
                    background: rgba(30, 41, 59, 0.9) !important;
                    border-radius: 12px !important;
                    border: 1px solid rgba(255, 255, 255, 0.1) !important;
                    padding: 0 !important;
                    margin: 0 0 1rem 0 !important;
                    width: 100% !important;
                    max-width: 100% !important;
                    overflow: hidden !important;
                }

                .table-header {
                    background: rgba(15, 23, 42, 0.8) !important;
                    padding: 1rem !important;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.1) !important;
                }

                .table-title {
                    color: #f8fafc !important;
                    font-size: 1.1rem !important;
                    font-weight: 600 !important;
                    margin: 0 !important;
                }

                .table-wrapper {
                    padding: 1rem !important;
                    width: 100% !important;
                    max-width: 100% !important;
                    overflow-x: hidden !important;
                }

                /* Page Header on Mobile */
                .page-header {
                    padding: 0 0 0.75rem 0 !important;
                    margin: 0 0 0.75rem 0 !important;
                }

                .page-title {
                    font-size: 1.5rem !important;
                    font-weight: 700 !important;
                    color: #f8fafc !important;
                    margin: 0 !important;
                }

                /* Form Controls on Mobile */
                .form-control,
                .form-select,
                input,
                select {
                    background: #0f172a !important;
                    background-color: #0f172a !important;
                    color: #f1f5f9 !important;
                }

                .form-row {
                    flex-direction: column;
                    gap: 0.75rem;
                }

                .form-group {
                    flex: 1 1 100%;
                }

                .form-actions {
                    flex-direction: column;
                }

                .form-actions .btn,
                .form-actions input[type="submit"] {
                    width: 100% !important;
                    justify-content: center !important;
                }

                .form-card {
                    padding: 1.25rem !important;
                    width: 100% !important;
                    margin: 0 0 1rem 0 !important;
                }

                .table-wrapper {
                    margin: 0 !important;
                    padding: 0 !important;
                    width: 100% !important;
                }

                .page-header {
                    padding: 0 0 1rem 0 !important;
                    margin: 0 0 1rem 0 !important;
                }

                .page-title {
                    font-size: 1.5rem !important;
                    margin: 0 !important;
                }

                /* Mobile Table Cards */
                .table-mobile-cards {
                    display: block !important;
                    width: 100% !important;
                }

                .table-mobile-cards thead,
                .table-mobile-cards th {
                    display: none !important;
                }

                .table-mobile-cards>tbody {
                    display: flex !important;
                    flex-direction: column !important;
                    gap: 1rem !important;
                }

                /* Data Rows - Card Style */
                .table-mobile-cards>tbody>tr.data-row {
                    display: block !important;
                    background: rgba(30, 41, 59, 0.8) !important;
                    border: 1px solid rgba(255, 255, 255, 0.1) !important;
                    border-radius: 12px !important;
                    padding: 1.25rem !important;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
                }

                .table-mobile-cards>tbody>tr.data-row>td {
                    display: block !important;
                    padding: 0.75rem 0 !important;
                    border: none !important;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.08) !important;
                    text-align: left !important;
                    background: transparent !important;
                }

                .table-mobile-cards>tbody>tr.data-row>td:last-child {
                    border-bottom: none !important;
                    padding-top: 1rem !important;
                }

                /* Mobile Labels */
                .table-mobile-cards>tbody>tr.data-row>td::before {
                    color: rgba(255, 255, 255, 0.6);
                    font-weight: 400;
                    font-size: 0.85rem;
                    display: block;
                    margin-bottom: 0.25rem;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(1)::before {
                    content: "ID:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(2)::before {
                    content: "Test Name:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(3)::before {
                    content: "Category:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(4)::before {
                    content: "Marks:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(5)::before {
                    content: "Duration:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:last-child::before {
                    display: none;
                }

                /* Pagination Row Override - Simple Horizontal */
                .table-mobile-cards>tbody>tr:not(.data-row) {
                    display: block !important;
                    width: 100% !important;
                    background: transparent !important;
                    border: none !important;
                    box-shadow: none !important;
                    padding: 1.5rem 0 !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row)>td {
                    display: block !important;
                    width: 100% !important;
                    padding: 0 !important;
                    border: none !important;
                    background: transparent !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row)>td::before {
                    display: none !important;
                    content: none !important;
                }

                /* Force the inner pagination table to be horizontal */
                .table-mobile-cards>tbody>tr:not(.data-row) table {
                    display: flex !important;
                    flex-direction: row !important;
                    justify-content: center !important;
                    align-items: center !important;
                    width: 100% !important;
                    gap: 1rem !important;
                    background: transparent !important;
                    border: none !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row) table tbody {
                    display: flex !important;
                    flex-direction: row !important;
                    justify-content: center !important;
                    align-items: center !important;
                    gap: 1rem !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row) table tbody tr {
                    display: flex !important;
                    flex-direction: row !important;
                    justify-content: center !important;
                    align-items: center !important;
                    gap: 1rem !important;
                    background: transparent !important;
                    border: none !important;
                    padding: 0 !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row) table tbody tr td {
                    display: inline-flex !important;
                    width: auto !important;
                    padding: 0 !important;
                    border: none !important;
                    background: transparent !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row) table tbody tr td::before {
                    display: none !important;
                    content: none !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row) a {
                    display: inline-flex !important;
                    justify-content: center !important;
                    align-items: center !important;
                    min-width: 50px !important;
                    height: 50px !important;
                    padding: 0 15px !important;
                    border-radius: 10px !important;
                    font-weight: 600 !important;
                    font-size: 1.5rem !important;
                    text-decoration: none !important;
                    color: #e2e8f0 !important;
                    background: rgba(51, 65, 85, 0.9) !important;
                    border: 1px solid rgba(255, 255, 255, 0.15) !important;
                    transition: all 0.2s ease !important;
                }

                .table-mobile-cards>tbody>tr:not(.data-row) a:hover {
                    background: #3b82f6 !important;
                    color: #ffffff !important;
                    transform: scale(1.05) !important;
                }

                /* Action Buttons - Fully Responsive */
                .table-mobile-cards .action-buttons,
                .action-buttons {
                    display: flex !important;
                    gap: 0.5rem !important;
                    width: 100% !important;
                    margin-top: 0.5rem !important;
                    justify-content: flex-end !important;
                }

                /* Hide button text on mobile */
                .action-buttons .btn-text {
                    display: none !important;
                }

                .table-mobile-cards .action-buttons .btn,
                .action-buttons .btn,
                .action-buttons input[type="submit"],
                .action-buttons button {
                    width: 44px !important;
                    height: 44px !important;
                    min-width: 44px !important;
                    min-height: 44px !important;
                    margin: 0 !important;
                    padding: 0 !important;
                    font-size: 1rem !important;
                    font-weight: 600 !important;
                    border-radius: 50% !important;
                    display: inline-flex !important;
                    align-items: center !important;
                    justify-content: center !important;
                    cursor: pointer !important;
                    border: none !important;
                    transition: all 0.2s ease !important;
                    flex: 0 0 auto !important;
                }

                .action-buttons .btn i {
                    font-size: 1.125rem !important;
                    margin: 0 !important;
                }

                .table-header {
                    padding: 1rem !important;
                }

                .table-title {
                    font-size: 1.1rem !important;
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
                background: transparent;
                overflow: visible;
            }

            .pagination-container table {
                width: auto !important;
                margin: 0 auto;
                background: transparent;
                border-radius: 12px;
                padding: 0;
                box-shadow: none;
                border: none;
                max-width: 100%;
                overflow: visible;
                display: flex !important;
                justify-content: center;
                align-items: center;
                gap: 1rem;
            }

            .pagination-container tbody {
                display: flex !important;
                flex-direction: row !important;
                align-items: center !important;
                justify-content: center !important;
            }

            .pagination-container tr {
                display: flex !important;
                flex-direction: row !important;
                align-items: center;
                gap: 0.5rem;
                flex-wrap: nowrap;
                justify-content: center;
            }

            .pagination-container td {
                display: inline-flex !important;
                padding: 0 !important;
                border: none !important;
                background: transparent !important;
            }

            .pagination-container td::before {
                display: none !important;
                content: none !important;
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
                transition: all 0.2s ease;
                border: 1px solid rgba(255, 255, 255, 0.1);
                background: rgba(51, 65, 85, 0.8);
            }

            .pagination-container a:hover {
                background: #3b82f6;
                color: #ffffff;
                border-color: #3b82f6;
                transform: scale(1.05);
            }

            /* Current Page - Highlighted */
            .pagination-container span {
                background: #3b82f6;
                color: white;
                border-color: #3b82f6;
                font-weight: 600;
            }
        </style>

        <div class="page-header">
            <h1 class="page-title">Manage Tests</h1>
        </div>

        <div class="form-card">
            <div class="form-card-header">Add / Edit Test</div>

            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">Test Name</label>
                    <asp:TextBox ID="txtTestName" runat="server" CssClass="form-control"
                        Placeholder="Enter test name" />
                </div>
                <div class="form-group">
                    <label class="form-label">Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">Total Marks</label>
                    <asp:TextBox ID="txtTotalMarks" runat="server" CssClass="form-control" TextMode="Number"
                        Placeholder="e.g., 100" min="0" />
                </div>
                <div class="form-group">
                    <label class="form-label">Duration (Minutes)</label>
                    <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" TextMode="Number"
                        Placeholder="e.g., 60" min="0" />
                </div>
            </div>

            <asp:Label ID="lblMsg" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>

            <div class="form-actions">
                <asp:HiddenField ID="hfTestId" runat="server" />
                <asp:Button ID="btnSave" runat="server" Text="Save Test" CssClass="btn btn-primary"
                    OnClick="btnSave_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary"
                    OnClick="btnClear_Click" />
            </div>
        </div>

        <div class="table-card">
            <div class="table-header">
                <h2 class="table-title">All Tests</h2>
            </div>

            <div class="table-wrapper">
                <asp:GridView ID="gvTests" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-mobile-cards" DataKeyNames="Test_ID" OnRowCommand="gvTests_RowCommand"
                    GridLines="None" ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="10"
                    OnPageIndexChanging="gvTests_PageIndexChanging">
                    <RowStyle CssClass="data-row" />
                    <AlternatingRowStyle CssClass="data-row" />
                    <PagerSettings Mode="NextPrevious" PreviousPageText="&lt;" NextPageText="&gt;" />
                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="Test_ID" HeaderText="ID">
                            <ItemStyle CssClass="col-id" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Test_Name" HeaderText="Test Name">
                            <ItemStyle CssClass="col-name" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Category_Name" HeaderText="Category">
                            <ItemStyle CssClass="col-category" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalMarks" HeaderText="Marks">
                            <ItemStyle CssClass="col-marks" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Duration_Minutes" HeaderText="Duration (Min)">
                            <ItemStyle CssClass="col-duration" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditT"
                                        CommandArgument='<%# Eval("Test_ID") %>' CssClass="btn btn-sm btn-warning">
                                        <i class="fas fa-edit"></i> <span class="btn-text">Edit</span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteT"
                                        CommandArgument='<%# Eval("Test_ID") %>' CssClass="btn btn-sm btn-danger"
                                        OnClientClick="return confirm('Are you sure you want to delete this test?');">
                                        <i class="fas fa-trash"></i> <span class="btn-text">Delete</span>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-state">
                            <i class="fas fa-clipboard-list"></i>
                            <div class="empty-state-title">No Tests Found</div>
                            <p>Start by creating your first test above</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>

        <script>
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