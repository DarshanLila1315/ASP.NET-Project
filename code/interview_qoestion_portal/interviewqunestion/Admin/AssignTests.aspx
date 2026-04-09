<%@ Page Title="Assign Tests" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true"
    CodeBehind="AssignTests.aspx.cs" Inherits="interview_questions.Admin.AssignTests" %>

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

            /* Selector Card */
            .selector-card {
                background: rgba(30, 41, 59, 0.8) !important;
                border: 1px solid rgba(255, 255, 255, 0.1) !important;
                border-radius: 12px !important;
                padding: 1rem !important;
                margin-bottom: 1rem !important;
                width: 100% !important;
                max-width: 100% !important;
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

            .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1rem;
                flex-wrap: wrap;
                gap: 0.75rem;
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

            /* Divider */
            .divider {
                height: 2px;
                background: rgba(255, 255, 255, 0.1);
                margin: 1rem 0;
                border-radius: 1px;
            }

            /* Form Controls - Dark Theme */
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
                display: flex !important;
                align-items: center;
                gap: 0.5rem;
            }

            /* Checkbox Styling */
            input[type="checkbox"] {
                width: 22px !important;
                height: 22px !important;
                min-width: 22px !important;
                min-height: 22px !important;
                max-width: 22px !important;
                max-height: 22px !important;
                accent-color: #3b82f6 !important;
                cursor: pointer !important;
                -webkit-appearance: checkbox !important;
                -moz-appearance: checkbox !important;
                appearance: checkbox !important;
            }

            /* Badges */
            .selected-count {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 6px 16px;
                border-radius: 20px;
                font-size: 0.9rem;
                font-weight: 600;
            }

            .badge-assigned {
                background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
                color: white;
                padding: 4px 12px;
                border-radius: 12px;
                font-size: 0.85rem;
                font-weight: 600;
            }

            .badge-available {
                background: linear-gradient(135deg, #10b981 0%, #059669 100%);
                color: white;
                padding: 4px 12px;
                border-radius: 12px;
                font-size: 0.85rem;
                font-weight: 600;
            }

            .badge-completed {
                background: linear-gradient(135deg, #10b981 0%, #059669 100%);
                color: white;
                padding: 4px 12px;
                border-radius: 12px;
                font-size: 0.85rem;
                font-weight: 600;
            }

            .badge-pending {
                background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
                color: white;
                padding: 4px 12px;
                border-radius: 12px;
                font-size: 0.85rem;
                font-weight: 600;
            }

            /* Action Footer */
            .action-footer {
                padding: 1rem;
                text-align: center;
                border-top: 1px solid rgba(255, 255, 255, 0.1);
                margin-top: 1rem;
            }

            /* Buttons */
            .btn-primary {
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%) !important;
                color: white !important;
                border: none !important;
                border-radius: 8px !important;
                font-weight: 600 !important;
                cursor: pointer !important;
                transition: all 0.2s ease !important;
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(59, 130, 246, 0.4) !important;
            }

            .btn-danger {
                background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%) !important;
                color: white !important;
                border: none !important;
                border-radius: 8px !important;
                font-weight: 600 !important;
                cursor: pointer !important;
            }

            .btn-large {
                padding: 12px 32px !important;
                font-size: 1.1rem !important;
            }

            .btn-sm {
                padding: 6px 12px !important;
                font-size: 0.85rem !important;
            }

            /* Completed Icon */
            .completed-icon {
                color: #10b981;
                font-size: 1.5rem;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                background: rgba(16, 185, 129, 0.15);
                border-radius: 50%;
                width: 45px;
                height: 45px;
            }

            .col-action {
                text-align: center;
                vertical-align: middle;
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

                .selector-card,
                .table-card {
                    padding: 0.75rem !important;
                    margin: 0 0 0.75rem 0 !important;
                    border-radius: 10px !important;
                }

                .section-header {
                    flex-direction: column;
                    align-items: flex-start;
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
                    border-top: 1px solid rgba(255, 255, 255, 0.1) !important;
                    margin-top: 0.75rem !important;
                    padding: 1rem 0 0.5rem 0 !important;
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
                    content: "NAME:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(4)::before {
                    content: "EMAIL:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:nth-child(5)::before {
                    content: "STATUS:";
                }

                .table-mobile-cards>tbody>tr.data-row>td:last-child::before {
                    display: block !important;
                    text-align: center !important;
                    margin-bottom: 0.5rem !important;
                }

                /* Mobile Labels for All Test Assignments Grid */
                #MainContent_gvAllAssignments tbody tr.data-row td:nth-child(1)::before {
                    content: "USER:";
                }

                #MainContent_gvAllAssignments tbody tr.data-row td:nth-child(2)::before {
                    content: "TEST NAME:";
                }

                #MainContent_gvAllAssignments tbody tr.data-row td:nth-child(3)::before {
                    content: "CATEGORY:";
                }

                #MainContent_gvAllAssignments tbody tr.data-row td:nth-child(4)::before {
                    content: "MARKS:";
                }

                #MainContent_gvAllAssignments tbody tr.data-row td:nth-child(5)::before {
                    content: "DURATION (MIN):";
                }

                #MainContent_gvAllAssignments tbody tr.data-row td:nth-child(6)::before {
                    content: "ASSIGNED DATE:";
                }

                #MainContent_gvAllAssignments tbody tr.data-row td:nth-child(7)::before {
                    content: "STATUS:";
                }

                #MainContent_gvAllAssignments tbody tr.data-row td:nth-child(8)::before {
                    content: "ACTION:";
                }

                /* Action Column - Center the icon/button */
                .col-action {
                    text-align: center !important;
                    display: flex !important;
                    justify-content: center !important;
                    align-items: center !important;
                    padding: 0.75rem 0 !important;
                }

                /* Completed Icon on Mobile */
                .completed-icon {
                    font-size: 2.5rem !important;
                    color: #10b981 !important;
                    background: rgba(16, 185, 129, 0.1) !important;
                    border-radius: 50% !important;
                    width: 60px !important;
                    height: 60px !important;
                    display: flex !important;
                    align-items: center !important;
                    justify-content: center !important;
                    margin: 0 auto !important;
                }

                /* Make sure buttons are full width on mobile */
                .col-action .btn {
                    width: 100% !important;
                    max-width: 100% !important;
                    padding: 0.875rem 1rem !important;
                    font-size: 1rem !important;
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

                .btn-large {
                    width: 100% !important;
                    padding: 1rem !important;
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
            <h1 class="page-title">Assign Tests to Multiple Users</h1>
            <p class="page-subtitle">Select a test and assign it to multiple users at once</p>
        </div>

        <asp:Label ID="lblMsg" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>

        <!-- Test Selection Section -->
        <div class="selector-card">
            <div class="form-group">
                <label class="form-label">
                    <i class="fas fa-clipboard-list"></i> Select Test to Assign
                </label>
                <asp:DropDownList ID="ddlTest" runat="server" CssClass="form-select" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlTest_SelectedIndexChanged"></asp:DropDownList>
            </div>
        </div>

        <!-- User Selection Section -->
        <div class="table-card" id="userSelectionSection" runat="server" visible="false">
            <div class="section-header">
                <h2 class="section-title">
                    <i class="fas fa-users"></i>
                    Select Users to Assign Test
                </h2>
                <asp:Label ID="lblSelectedCount" runat="server" CssClass="selected-count" Text="0 users selected">
                </asp:Label>
            </div>

            <div class="table-wrapper">
                <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-mobile-cards" DataKeyNames="User_ID" GridLines="None"
                    ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="10"
                    OnPageIndexChanging="gvUsers_PageIndexChanging">
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
                                <asp:CheckBox ID="chkUser" runat="server" CssClass="user-checkbox"
                                    Enabled='<%# !(bool)Eval("AlreadyAssigned") %>' />
                            </ItemTemplate>
                            <ItemStyle CssClass="col-checkbox" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="User_ID" HeaderText="ID">
                            <ItemStyle CssClass="col-id" />
                        </asp:BoundField>
                        <asp:BoundField DataField="User_FirstName" HeaderText="Name">
                            <ItemStyle CssClass="col-name" />
                        </asp:BoundField>
                        <asp:BoundField DataField="User_EmailID" HeaderText="Email">
                            <ItemStyle CssClass="col-email" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span
                                    class='<%# (bool)Eval("AlreadyAssigned") ? "badge-assigned" : "badge-available" %>'>
                                    <%# (bool)Eval("AlreadyAssigned") ? "Already Assigned" : "Available" %>
                                </span>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-status" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-state">
                            <i class="fas fa-users"></i>
                            <div class="empty-state-title">No Users Found</div>
                            <p>No users available in the system</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

            <div class="action-footer">
                <asp:Button ID="btnBulkAssign" runat="server" Text="Assign Test to Selected Users"
                    CssClass="btn btn-primary btn-large" OnClick="btnBulkAssign_Click" />
            </div>
        </div>

        <div class="divider"></div>

        <!-- All Assigned Tests Section -->
        <div class="table-card">
            <div class="section-header">
                <h2 class="section-title">
                    <i class="fas fa-user-check"></i>
                    All Test Assignments
                </h2>
            </div>

            <div class="table-wrapper">
                <asp:GridView ID="gvAllAssignments" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-mobile-cards" DataKeyNames="UT_ID" OnRowCommand="gvAllAssignments_RowCommand"
                    GridLines="None" ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="20"
                    OnPageIndexChanging="gvAllAssignments_PageIndexChanging">
                    <RowStyle CssClass="data-row" />
                    <AlternatingRowStyle CssClass="data-row" />
                    <PagerSettings Mode="NextPrevious" PreviousPageText="&lt;" NextPageText="&gt;" />
                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="User_FirstName" HeaderText="User">
                            <ItemStyle CssClass="col-name" />
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
                        <asp:BoundField DataField="Assigned_Date" HeaderText="Assigned Date"
                            DataFormatString="{0:dd-MMM-yyyy}">
                            <ItemStyle CssClass="col-date" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span
                                    class='<%# Eval("Status").ToString() == "Completed" ? "badge-completed" : "badge-pending" %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-status" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <%# Eval("Status").ToString() == "Completed" 
                                    ? "<i class='fas fa-check-circle completed-icon' title='Test Completed'></i>" 
                                    : "" %>
                                <asp:Button ID="btnUnassign" runat="server" Text="Unassign" 
                                    CommandName="Unassign" 
                                    CommandArgument='<%# Eval("UT_ID") %>' 
                                    CssClass="btn btn-danger btn-sm"
                                    Visible='<%# Eval("Status").ToString() != "Completed" %>'
                                    OnClientClick="return confirm('Are you sure you want to unassign this test?');" />
                            </ItemTemplate>
                            <ItemStyle CssClass="col-action" />
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="empty-state">
                            <i class="fas fa-clipboard"></i>
                            <div class="empty-state-title">No Tests Assigned</div>
                            <p>No tests have been assigned to any users yet</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>

        <script>
            // Select All checkbox functionality
            function toggleSelectAll(selectAllCheckbox) {
                var gridView = selectAllCheckbox.closest('table');
                var checkboxes = gridView.querySelectorAll('.user-checkbox input[type="checkbox"]:not(:disabled)');

                checkboxes.forEach(function (checkbox) {
                    checkbox.checked = selectAllCheckbox.checked;
                });
                updateSelectedCount();
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

                // Update count when individual checkboxes change
                var userCheckboxes = document.querySelectorAll('.user-checkbox input[type="checkbox"]');
                userCheckboxes.forEach(function (checkbox) {
                    checkbox.addEventListener('change', updateSelectedCount);
                });

                // Initial count update
                updateSelectedCount();
            };

            function updateSelectedCount() {
                var checkboxes = document.querySelectorAll('.user-checkbox input[type="checkbox"]:checked');
                var count = checkboxes.length;
                var lblCount = document.getElementById('<%= lblSelectedCount.ClientID %>');
                if (lblCount) {
                    lblCount.innerText = count + ' user' + (count !== 1 ? 's' : '') + ' selected';
                }
            }
        </script>
    </asp:Content>