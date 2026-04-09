<%@ Page Title="Manage Companies" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="ManageCompanies.aspx.cs" Inherits="interview_questions.Admin.ManageCompanies" %>

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
                padding: 1rem 1.25rem !important;
                border-radius: 12px !important;
                font-size: 1rem !important;
                width: 100% !important;
                max-width: 100% !important;
                box-sizing: border-box !important;
                display: block !important;
                margin: 0 !important;
                backdrop-filter: blur(10px);
                box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease !important;
            }

            .form-control::placeholder,
            input.form-control::placeholder {
                color: rgba(255, 255, 255, 0.4) !important;
            }

            .form-control:hover,
            input.form-control:hover {
                background: rgba(30, 41, 59, 0.8) !important;
                border-color: rgba(59, 130, 246, 0.5) !important;
            }

            .form-control:focus,
            input.form-control:focus {
                background: rgba(30, 41, 59, 0.95) !important;
                border-color: #3b82f6 !important;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.25), inset 0 1px 2px rgba(0, 0, 0, 0.1) !important;
                outline: none !important;
                transform: translateY(-1px);
            }

            .form-label {
                color: #e2e8f0 !important;
                font-weight: 500;
                font-size: 0.95rem;
                margin-bottom: 0.75rem;
                display: block;
                letter-spacing: 0.5px;
            }

            /* Desktop Form Layout - Company Name Style */
            .input-group {
                display: flex !important;
                flex-direction: row !important;
                flex-wrap: nowrap !important;
                align-items: center !important;
                gap: 0.75rem !important;
                width: 100% !important;
                background: transparent !important;
                padding: 0 !important;
                border: none !important;
            }

            /* Hide HiddenField from layout */
            .input-group input[type="hidden"] {
                display: none !important;
                position: absolute !important;
                visibility: hidden !important;
            }

            /* Text Input - Takes Most Space */
            .input-group .form-control,
            .input-group input[type="text"],
            .form-card .input-group input[type="text"] {
                flex: 1 1 auto !important;
                min-width: 60% !important;
                width: auto !important;
                margin: 0 !important;
                border: 1px solid rgba(255, 255, 255, 0.2) !important;
                background: rgba(15, 23, 42, 0.7) !important;
                box-shadow: none !important;
                padding: 0.75rem 1rem !important;
                border-radius: 8px !important;
                height: 44px !important;
                font-size: 0.9rem !important;
                color: #e2e8f0 !important;
                box-sizing: border-box !important;
            }

            .input-group .form-control::placeholder,
            .input-group input[type="text"]::placeholder {
                color: rgba(148, 163, 184, 0.7) !important;
            }

            .input-group .form-control:focus,
            .input-group input[type="text"]:focus {
                background: rgba(15, 23, 42, 0.9) !important;
                border-color: #3b82f6 !important;
                outline: none !important;
            }

            /* Buttons - Fixed Small Width */
            .input-group .btn,
            .input-group input[type="submit"],
            .form-card .input-group input[type="submit"] {
                flex: 0 0 90px !important;
                width: 90px !important;
                max-width: 90px !important;
                min-width: 90px !important;
                white-space: nowrap !important;
                border-radius: 6px !important;
                height: 44px !important;
                padding: 0 !important;
                font-weight: 500 !important;
                font-size: 0.875rem !important;
                border: none !important;
                cursor: pointer !important;
                text-align: center !important;
                box-sizing: border-box !important;
            }

            /* Save Button - Blue */
            .input-group .btn-primary,
            .input-group input[value="Save"],
            .form-card .input-group input[value="Save"] {
                background: #2563eb !important;
                color: #ffffff !important;
            }

            .input-group .btn-primary:hover,
            .input-group input[value="Save"]:hover {
                background: #1d4ed8 !important;
            }

            /* Cancel Button - Dark Gray */
            .input-group .btn-secondary,
            .input-group input[value="Cancel"],
            .form-card .input-group input[value="Cancel"] {
                background: #374151 !important;
                color: rgba(255, 255, 255, 0.9) !important;
            }

            .input-group .btn-secondary:hover,
            .input-group input[value="Cancel"]:hover {
                background: #4b5563 !important;
                color: #ffffff !important;
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
            input[value="Save"] {
                background: #2563eb !important;
                color: #ffffff !important;
                border: none !important;
                cursor: pointer !important;
                transition: all 0.2s ease !important;
            }

            .btn-primary:hover,
            input[value="Save"]:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(59, 130, 246, 0.4) !important;
            }

            /* Secondary Button (Cancel) */
            .btn-secondary,
            input[value="Cancel"] {
                background: linear-gradient(135deg, #64748b 0%, #475569 100%) !important;
                color: #ffffff !important;
                padding: 0.75rem 1.5rem !important;
                font-weight: 600 !important;
                border-radius: 10px !important;
                border: none !important;
                cursor: pointer !important;
                transition: all 0.2s ease !important;
            }

            .btn-secondary:hover,
            input[value="Cancel"]:hover {
                background: linear-gradient(135deg, #475569 0%, #334155 100%) !important;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(100, 116, 139, 0.4) !important;
            }

            /* Mobile responsive */
            @media (max-width: 768px) {
                .content-area {
                    padding: 1rem !important;
                }

                .input-group {
                    display: flex !important;
                    flex-direction: row !important;
                    flex-wrap: wrap !important;
                    gap: 0.75rem !important;
                    width: 100% !important;
                    background: transparent !important;
                    border: none !important;
                    padding: 0 !important;
                    box-shadow: none !important;
                    border-radius: 0 !important;
                    overflow: visible !important;
                }

                /* Make text input take full row and restore its look */
                .input-group input[type="text"],
                .input-group .form-control {
                    width: 100% !important;
                    flex: 0 0 100% !important;
                    background: rgba(15, 23, 42, 0.6) !important;
                    border: 1px solid rgba(255, 255, 255, 0.15) !important;
                    padding: 1rem 1.25rem !important;
                    border-radius: 12px !important;
                    margin-bottom: 0.5rem !important;
                    height: auto !important;
                    border-right: 1px solid rgba(255, 255, 255, 0.15) !important;
                }

                .input-group .form-control:focus {
                    background: rgba(30, 41, 59, 0.95) !important;
                    border-color: #3b82f6 !important;
                    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.25), inset 0 1px 2px rgba(0, 0, 0, 0.1) !important;
                    transform: translateY(-1px) !important;
                }

                /* Restoring Mobile Button Look */
                .input-group .btn,
                .input-group input[type="submit"] {
                    flex: 1 !important;
                    width: auto !important;
                    margin: 0 !important;
                    justify-content: center !important;
                    border-radius: 10px !important;
                    height: 48px !important;
                    padding: 0.75rem !important;
                }

                /* Reset last-child border radius from desktop */
                .input-group .btn:last-child {
                    border-radius: 10px !important;
                }

                /* Restore mobile button gradients */
                .input-group .btn-primary,
                .input-group input[value="Save"] {
                    background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%) !important;
                }

                .input-group .btn-secondary,
                .input-group input[value="Cancel"] {
                    background: linear-gradient(135deg, #64748b 0%, #475569 100%) !important;
                    border: 1px solid rgba(255, 255, 255, 0.1) !important;
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

                /* Mobile Table Cards - Targeted to Data Rows Only */
                .table-mobile-cards>tbody>tr {
                    display: block !important;
                    background: rgba(30, 41, 59, 0.8) !important;
                    border: 1px solid rgba(255, 255, 255, 0.1) !important;
                    border-radius: 12px !important;
                    padding: 1.25rem !important;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
                }

                .table-mobile-cards>tbody>tr>td {
                    display: block !important;
                    padding: 0.75rem 0 !important;
                    border: none !important;
                    border-bottom: 1px solid rgba(255, 255, 255, 0.08) !important;
                    text-align: left !important;
                    background: transparent !important;
                }

                .table-mobile-cards>tbody>tr>td:last-child {
                    border-bottom: none !important;
                    padding-top: 1rem !important;
                }

                .table-mobile-cards>tbody>tr>td:first-child {
                    font-size: 1.1rem;
                    font-weight: 600;
                    color: #ffffff;
                    padding-bottom: 1rem;
                }

                .table-mobile-cards>tbody>tr>td:first-child::before {
                    content: "Company Name:";
                    color: rgba(255, 255, 255, 0.6);
                    font-weight: 400;
                    font-size: 0.85rem;
                    display: block;
                    margin-bottom: 0.25rem;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                /* Action Buttons - Fully Responsive */
                .table-mobile-cards .action-buttons,
                .action-buttons {
                    display: flex !important;
                    gap: 0.5rem !important;
                    width: 100% !important;
                    margin-top: 1rem !important;
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
                background: rgba(30, 41, 59, 0.3);
                overflow: hidden;
            }

            .pagination-container table {
                width: auto !important;
                margin: 0 auto;
                background: rgba(30, 41, 59, 0.8);
                border-radius: 12px;
                padding: 0.5rem 0.75rem;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                border: 1px solid rgba(255, 255, 255, 0.1);
                max-width: 100%;
                overflow: hidden;
                display: inline-block !important;
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
                min-width: 40px;
                height: 40px;
                padding: 0 10px;
                border-radius: 8px;
                font-weight: 500;
                font-size: 0.9375rem;
                text-decoration: none;
                color: #e2e8f0;
                transition: all 0.2s ease;
                border: 1px solid transparent;
            }

            .pagination-container a {
                background: rgba(51, 65, 85, 0.8);
            }

            .pagination-container a:hover {
                background: #3b82f6;
                color: #ffffff;
                border-color: #3b82f6;
            }

            /* Current Page - Highlighted */
            .pagination-container span {
                background: #3b82f6;
                color: white;
                border-color: #3b82f6;
                font-weight: 600;
            }

            /* Mobile Pagination Fix - Force Horizontal Row */
            @media (max-width: 768px) {
                .pagination-container {
                    display: flex !important;
                    flex-direction: row !important;
                    flex-wrap: wrap !important;
                    justify-content: center !important;
                    align-items: center !important;
                    padding: 1rem !important;
                    gap: 0.5rem !important;
                    height: auto !important;
                }

                .pagination-container table {
                    display: flex !important;
                    flex-direction: row !important;
                    flex-wrap: wrap !important;
                }

                .pagination-container tbody {
                    display: flex !important;
                    flex-direction: row !important;
                    flex-wrap: wrap !important;
                    justify-content: center !important;
                }

                .pagination-container tr {
                    display: flex !important;
                    flex-direction: row !important;
                    flex-wrap: wrap !important;
                    justify-content: center !important;
                    gap: 0.5rem !important;
                    background: transparent !important;
                    border: none !important;
                    padding: 0 !important;
                }

                .pagination-container td {
                    display: inline-block !important;
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
                    min-width: 44px !important;
                    height: 44px !important;
                    font-size: 1.25rem !important;
                }
            }
        </style>

        <div class="page-header">
            <h1 class="page-title">Manage Companies</h1>
        </div>

        <div class="form-card">
            <label class="form-label">Company Name</label>
            <div class="input-group">
                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control"
                    Placeholder="Enter company name"></asp:TextBox>
                <asp:HiddenField ID="hfCompanyId" runat="server" />
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary"
                    OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary"
                    OnClick="btnCancel_Click" />
            </div>
        </div>

        <asp:Label ID="lblMsg" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>

        <div class="table-card">
            <div class="table-header">
                <h2 class="table-title">All Companies</h2>
            </div>

            <div class="table-wrapper">
                <asp:GridView ID="gvCompanies" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-mobile-cards" DataKeyNames="Company_ID" OnRowCommand="gvCompanies_RowCommand"
                    GridLines="None" ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="10"
                    OnPageIndexChanging="gvCompanies_PageIndexChanging">
                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    <Columns>

                        <asp:BoundField DataField="Company_Name" HeaderText="Company Name">
                            <ItemStyle CssClass="col-name" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditRow"
                                        CommandArgument='<%# Eval("Company_ID") %>' CssClass="btn btn-sm btn-warning">
                                        <i class="fas fa-edit"></i> <span class="btn-text">Edit</span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteRow"
                                        CommandArgument='<%# Eval("Company_ID") %>' CssClass="btn btn-sm btn-danger"
                                        OnClientClick="return confirm('Are you sure you want to delete this company?');">
                                        <i class="fas fa-trash"></i> <span class="btn-text">Delete</span>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-state">
                            <i class="fas fa-building"></i>
                            <div class="empty-state-title">No Companies Found</div>
                            <p>Start by adding your first company above</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>

        <script>

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