<%@ Page Title="Manage Questions" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="ManageQuestions.aspx.cs" Inherits="interview_questions.Admin.ManageQuestions" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <style>
            /* Prevent horizontal overflow everywhere */
            * {
                box-sizing: border-box !important;
            }

            body,
            html {
                overflow-x: hidden !important;
                max-width: 100vw !important;
                margin: 0;
                padding: 0;
            }

            .admin-wrapper,
            .main-wrapper,
            .content-area,
            .content-card,
            .page-header,
            .form-card,
            .table-card,
            .table-wrapper,
            .input-group {
                max-width: 100% !important;
                overflow-x: hidden !important;
                box-sizing: border-box !important;
            }

            /* Force visible form controls with maximum specificity */
            input[type="text"].form-control,
            textarea.form-control,
            select.form-select,
            .form-control,
            .form-select,
            input.form-control,
            .input-group .form-control,
            .input-group input {
                background: rgba(15, 23, 42, 0.6) !important;
                border: 1px solid rgba(255, 255, 255, 0.15) !important;
                color: #f8fafc !important;
                padding: 0.75rem 1rem !important;
                border-radius: 8px !important;
                font-size: 0.9rem !important;
                width: 100% !important;
                max-width: 100% !important;
                box-sizing: border-box !important;
                display: block !important;
                margin: 0 !important;
                backdrop-filter: blur(10px);
                box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease !important;
            }

            textarea.form-control {
                min-height: 100px !important;
                resize: vertical !important;
            }

            .form-control::placeholder,
            input.form-control::placeholder,
            textarea::placeholder {
                color: rgba(255, 255, 255, 0.4) !important;
            }

            .form-control:hover,
            input.form-control:hover,
            select.form-select:hover,
            textarea.form-control:hover {
                background: rgba(30, 41, 59, 0.8) !important;
                border-color: rgba(59, 130, 246, 0.5) !important;
            }

            .form-control:focus,
            input.form-control:focus,
            select.form-select:focus,
            textarea.form-control:focus {
                background: rgba(30, 41, 59, 0.95) !important;
                border-color: #3b82f6 !important;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.25), inset 0 1px 2px rgba(0, 0, 0, 0.1) !important;
                outline: none !important;
            }

            .form-label {
                color: #e2e8f0 !important;
                font-weight: 500;
                font-size: 0.875rem;
                margin-bottom: 0.5rem;
                display: block;
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

            .form-group.full-width {
                flex: 1 1 100%;
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
            input[value="Save Question"] {
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
            input[value="Save Question"]:hover {
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

            /* Success Button (Upload) */
            .btn-success,
            input[value="Upload Questions"] {
                background: linear-gradient(135deg, #10b981 0%, #059669 100%) !important;
                color: #ffffff !important;
                padding: 0.75rem 1.5rem !important;
                font-weight: 600 !important;
                border-radius: 8px !important;
                border: none !important;
                cursor: pointer !important;
                transition: all 0.2s ease !important;
            }

            .btn-success:hover,
            input[value="Upload Questions"]:hover {
                background: linear-gradient(135deg, #059669 0%, #047857 100%) !important;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(16, 185, 129, 0.4) !important;
            }

            /* Info Button (Download) */
            .btn-info,
            input[value="Download Template"] {
                background: linear-gradient(135deg, #06b6d4 0%, #0891b2 100%) !important;
                color: #ffffff !important;
                padding: 0.75rem 1.5rem !important;
                font-weight: 600 !important;
                border-radius: 8px !important;
                border: none !important;
                cursor: pointer !important;
                transition: all 0.2s ease !important;
            }

            .btn-info:hover,
            input[value="Download Template"]:hover {
                background: linear-gradient(135deg, #0891b2 0%, #0e7490 100%) !important;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(6, 182, 212, 0.4) !important;
            }

            /* Upload Section */
            .upload-section {
                padding: 1rem 0;
            }

            .upload-info {
                display: flex;
                gap: 1rem;
                padding: 1rem;
                background: rgba(59, 130, 246, 0.1);
                border: 1px solid rgba(59, 130, 246, 0.3);
                border-radius: 8px;
                margin-bottom: 1.5rem;
                color: #e2e8f0;
            }

            .upload-info i {
                color: #3b82f6;
                font-size: 1.25rem;
                margin-top: 0.25rem;
            }

            .upload-info strong {
                color: #ffffff;
            }

            .upload-info p {
                margin: 0.5rem 0 0 0;
                font-size: 0.875rem;
                color: #94a3b8;
            }

            .upload-note {
                color: #f59e0b !important;
                font-style: italic;
            }

            /* Mobile responsive */
            @media (max-width: 768px) {
                .content-area {
                    padding: 1rem !important;
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
                    content: "Question:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(3)::before {
                    content: "Category:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(4)::before {
                    content: "Company:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(5)::before {
                    content: "Answer:";
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

                .upload-info {
                    flex-direction: column;
                    text-align: center;
                }

                .upload-info i {
                    align-self: center;
                }

                .table-header {
                    padding: 1rem !important;
                }

                .table-title {
                    font-size: 1.1rem !important;
                }

                /* Toggle Buttons Mobile */
                .view-toggle-container {
                    display: flex;
                    flex-wrap: wrap;
                    gap: 0.5rem;
                }

                .view-toggle-container .toggle-btn {
                    flex: 1;
                    justify-content: center;
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

            /* Mobile Pagination Fix */
            @media (max-width: 768px) {

                /* Force pagination to be horizontal */
                .pagination-container {
                    display: flex !important;
                    flex-direction: row !important;
                    flex-wrap: wrap !important;
                    justify-content: center !important;
                    align-items: center !important;
                    padding: 1rem !important;
                    gap: 0.5rem !important;
                    width: 100% !important;
                }

                .pagination-container table {
                    display: flex !important;
                    flex-direction: row !important;
                    flex-wrap: wrap !important;
                    width: auto !important;
                    margin: 0 auto !important;
                }

                .pagination-container tbody {
                    display: flex !important;
                    flex-direction: row !important;
                    flex-wrap: wrap !important;
                    justify-content: center !important;
                    width: auto !important;
                }

                .pagination-container tr {
                    display: flex !important;
                    flex-direction: row !important;
                    flex-wrap: wrap !important;
                    justify-content: center !important;
                    align-items: center !important;
                    gap: 0.5rem !important;
                    background: transparent !important;
                    border: none !important;
                    padding: 0 !important;
                    width: auto !important;
                }

                /* Crucial: Override the block display from generic mobile table styles */
                .pagination-container td {
                    display: inline-flex !important;
                    flex-direction: row !important;
                    width: auto !important;
                    background: transparent !important;
                    border: none !important;
                    padding: 0 !important;
                }

                .pagination-container td::before {
                    display: none !important;
                    content: none !important;
                }

                .pagination-container a,
                .pagination-container span {
                    display: inline-flex !important;
                    justify-content: center !important;
                    align-items: center !important;
                    min-width: 44px !important;
                    height: 44px !important;
                    font-size: 1.1rem !important;
                    margin: 0 !important;
                }
            }
        </style>

        <div class="page-header">
            <h1 class="page-title">Manage Questions</h1>
        </div>

        <!-- Toggle Buttons -->
        <div class="view-toggle-container">
            <style>
                .view-toggle-container {
                    display: flex;
                    gap: 1rem;
                    margin-bottom: 1.5rem;
                }

                .toggle-btn {
                    padding: 0.75rem 1.5rem;
                    border-radius: 8px;
                    border: 1px solid rgba(255, 255, 255, 0.1);
                    background: rgba(30, 41, 59, 0.6);
                    color: #94a3b8;
                    cursor: pointer;
                    transition: all 0.3s ease;
                    font-weight: 500;
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                }

                .toggle-btn.active {
                    background: #3b82f6;
                    color: white;
                    border-color: #3b82f6;
                    box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
                }

                .toggle-btn:hover:not(.active) {
                    background: rgba(30, 41, 59, 0.9);
                    color: #fff;
                }
            </style>
            <button type="button" id="btnShowAddEdit" class="toggle-btn active" onclick="showAddEditView()">
                <i class="fas fa-plus-circle"></i>
                Add / Edit Question
            </button>
            <button type="button" id="btnShowBulkUpload" class="toggle-btn" onclick="showBulkUploadView()">
                <i class="fas fa-upload"></i>
                Bulk Upload
            </button>
        </div>

        <div class="form-card" id="addEditSection">
            <div class="form-card-header">Add / Edit Question</div>

            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label">Company</label>
                    <asp:DropDownList ID="ddlCompany" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group full-width">
                    <label class="form-label">Question Text</label>
                    <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"
                        Placeholder="Enter your question here..." />
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">Option A</label>
                    <asp:TextBox ID="txtA" runat="server" CssClass="form-control" Placeholder="Enter option A" />
                </div>
                <div class="form-group">
                    <label class="form-label">Option B</label>
                    <asp:TextBox ID="txtB" runat="server" CssClass="form-control" Placeholder="Enter option B" />
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">Option C</label>
                    <asp:TextBox ID="txtC" runat="server" CssClass="form-control" Placeholder="Enter option C" />
                </div>
                <div class="form-group">
                    <label class="form-label">Option D</label>
                    <asp:TextBox ID="txtD" runat="server" CssClass="form-control" Placeholder="Enter option D" />
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">Correct Option</label>
                    <asp:DropDownList ID="ddlCorrectOption" runat="server" CssClass="form-select">
                        <asp:ListItem Text="A" Value="A" />
                        <asp:ListItem Text="B" Value="B" />
                        <asp:ListItem Text="C" Value="C" />
                        <asp:ListItem Text="D" Value="D" />
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Label ID="lblMsg" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>

            <div class="form-actions">
                <asp:HiddenField ID="hfQuestionId" runat="server" />
                <asp:Button ID="btnSave" runat="server" Text="Save Question" CssClass="btn btn-primary"
                    OnClick="btnSave_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary"
                    OnClick="btnClear_Click" />
            </div>
        </div>

        <div class="form-card" id="bulkUploadSection">
            <div class="form-card-header">Bulk Upload Questions</div>

            <div class="upload-section">
                <div class="upload-info">
                    <i class="fas fa-info-circle"></i>
                    <div>
                        <strong>Upload CSV File Format:</strong>
                        <p>Category, Company, Question, OptionA, OptionB, OptionC, OptionD, CorrectOption</p>
                        <p class="upload-note">Note: CorrectOption should be A, B, C, or D</p>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group full-width">
                        <label class="form-label">Select CSV File</label>
                        <asp:FileUpload ID="fuQuestions" runat="server" />
                    </div>
                </div>

                <asp:Label ID="lblUploadMsg" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>

                <div class="form-actions">
                    <asp:Button ID="btnUpload" runat="server" Text="Upload Questions" CssClass="btn btn-success"
                        OnClick="btnUpload_Click" />
                    <asp:Button ID="btnDownloadTemplate" runat="server" Text="Download Template" CssClass="btn btn-info"
                        OnClick="btnDownloadTemplate_Click" />
                </div>
            </div>
        </div>

        <div class="table-card">
            <div class="table-header">
                <h2 class="table-title">All Questions</h2>
            </div>

            <div class="table-wrapper">
                <asp:GridView ID="gvQuestions" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-mobile-cards" DataKeyNames="Question_ID" OnRowCommand="gvQuestions_RowCommand"
                    GridLines="None" ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="10"
                    OnPageIndexChanging="gvQuestions_PageIndexChanging">
                    <RowStyle CssClass="data-row" />
                    <AlternatingRowStyle CssClass="data-row" />
                    <PagerSettings Mode="NextPrevious" PreviousPageText="&lt;" NextPageText="&gt;" />
                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    <Columns>
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
                        <asp:BoundField DataField="CorrectOption" HeaderText="Answer">
                            <ItemStyle CssClass="col-answer" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-sm btn-warning"
                                        CommandName="EditQ" CommandArgument='<%# Eval("Question_ID") %>'>
                                        <i class="fas fa-edit"></i> <span class="btn-text">Edit</span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-sm btn-danger"
                                        CommandName="DeleteQ" CommandArgument='<%# Eval("Question_ID") %>'
                                        OnClientClick="return confirm('Are you sure you want to delete this question?');">
                                        <i class="fas fa-trash"></i> <span class="btn-text">Delete</span>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-state">
                            <i class="fas fa-question-circle"></i>
                            <div class="empty-state-title">No Questions Found</div>
                            <p>Start by adding your first question above</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>

        <script>
            // Toggle between Add/Edit and Bulk Upload views
            function showAddEditView() {
                const addEditSection = document.getElementById('addEditSection');
                const bulkUploadSection = document.getElementById('bulkUploadSection');

                // Simply hide Bulk Upload and show Add/Edit
                bulkUploadSection.style.display = 'none';
                bulkUploadSection.style.opacity = '0';

                addEditSection.style.display = 'block';
                // Small delay to allow display:block to apply before opacity transition
                setTimeout(function () {
                    addEditSection.style.opacity = '1';
                    addEditSection.style.transform = 'translateY(0)';
                }, 10);

                // Update button states
                document.getElementById('btnShowAddEdit').classList.add('active');
                document.getElementById('btnShowBulkUpload').classList.remove('active');
            }

            function showBulkUploadView() {
                const addEditSection = document.getElementById('addEditSection');
                const bulkUploadSection = document.getElementById('bulkUploadSection');

                // Simply hide Add/Edit and show Bulk Upload
                addEditSection.style.display = 'none';
                addEditSection.style.opacity = '0';

                bulkUploadSection.style.display = 'block';
                // Small delay to allow display:block to apply before opacity transition
                setTimeout(function () {
                    bulkUploadSection.style.opacity = '1';
                    bulkUploadSection.style.transform = 'translateY(0)';
                }, 10);

                // Update button states
                document.getElementById('btnShowAddEdit').classList.remove('active');
                document.getElementById('btnShowBulkUpload').classList.add('active');
            }

            // Initialize on page load
            window.onload = function () {
                // Initialize sections
                const addEditSection = document.getElementById('addEditSection');
                const bulkUploadSection = document.getElementById('bulkUploadSection');

                if (addEditSection && bulkUploadSection) {
                    addEditSection.style.display = 'block';
                    addEditSection.style.opacity = '1';
                    addEditSection.style.transform = 'translateY(0)';

                    bulkUploadSection.style.display = 'none';
                    bulkUploadSection.style.opacity = '0';
                    bulkUploadSection.style.transform = 'translateY(-20px)';
                }

                // Show message and auto-hide after 3 seconds
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

                // Show upload message and auto-hide after 3 seconds
                var lblUploadMsg = document.getElementById('<%= lblUploadMsg.ClientID %>');
                if (lblUploadMsg && lblUploadMsg.innerText.trim() !== '') {
                    // Switch to bulk view if upload msg is present
                    showBulkUploadView();

                    lblUploadMsg.style.display = 'flex';
                    setTimeout(function () {
                        lblUploadMsg.style.opacity = '0';
                        setTimeout(function () {
                            lblUploadMsg.style.display = 'none';
                            lblUploadMsg.style.opacity = '1';
                        }, 300);
                    }, 3000);
                }
            };
        </script>
    </asp:Content>