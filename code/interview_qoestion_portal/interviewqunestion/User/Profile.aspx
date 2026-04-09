<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/User/Site.Master" AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs" Inherits="interviewqunestion.User.Profile" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="profile-page">

            <!-- Header -->
            <div class="profile-header animate-fade-in-up">
                <div class="profile-avatar">
                    <i class="fas fa-user"></i>
                </div>
                <div class="profile-title-block">
                    <h2 class="text-gradient">My Profile</h2>
                    <p>View and manage your account information</p>
                </div>
            </div>

            <!-- Read-only details -->
            <div class="profile-card glass-card animate-fade-in-up" style="animation-delay: 0.1s;">
                <div class="card-header">
                    <div class="card-icon">
                        <i class="fas fa-id-card"></i>
                    </div>
                    <h3>Account Details</h3>
                    <button type="button" class="btn-trigger-modal" onclick="openPasswordModal()">
                        <i class="fas fa-key"></i> Change Password
                    </button>
                </div>

                <div class="profile-fields">
                    <div class="field-group">
                        <span class="field-label">
                            <i class="fas fa-user"></i>
                            Full Name
                        </span>
                        <div class="field-value">
                            <asp:Label ID="lblFullName" runat="server"></asp:Label>
                        </div>
                    </div>

                    <div class="field-group">
                        <span class="field-label">
                            <i class="fas fa-envelope"></i>
                            Email Address
                        </span>
                        <div class="field-value">
                            <asp:Label ID="lblEmail" runat="server"></asp:Label>
                        </div>
                    </div>



                    <div class="field-group full-width">
                        <span class="field-label">
                            <i class="fas fa-calendar-alt"></i>
                            Member Since
                        </span>
                        <div class="field-value">
                            <asp:Label ID="lblMemberSince" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <!-- Mobile-only Change Password button -->
                <button type="button" class="btn-trigger-modal-mobile" onclick="openPasswordModal()">
                    <i class="fas fa-key"></i> Change Password
                </button>
            </div>



        </div>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="ModalContent" runat="server">
        <!-- Password Modal -->
        <div id="passwordModal" class="modal-overlay">
            <div class="modal-container glass-card">
                <button type="button" class="modal-close" onclick="closePasswordModal()">
                    <i class="fas fa-times"></i>
                </button>

                <div class="card-header">
                    <div class="card-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <h3>Security</h3>
                </div>

                <asp:UpdatePanel ID="upChangePassword" runat="server">
                    <ContentTemplate>
                        <div class="profile-fields" style="display: flex; flex-direction: column; gap: 1rem;">
                            <div class="field-group">
                                <span class="field-label">
                                    <i class="fas fa-key"></i>
                                    Old Password
                                </span>
                                <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"
                                    CssClass="form-input" placeholder="Enter current password"></asp:TextBox>
                            </div>

                            <div class="field-group">
                                <span class="field-label">
                                    <i class="fas fa-lock-open"></i>
                                    New Password
                                </span>
                                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"
                                    CssClass="form-input" placeholder="New password (8+ chars, A-Z, 0-9, symbol)">
                                </asp:TextBox>
                            </div>

                            <div class="field-group">
                                <span class="field-label">
                                    <i class="fas fa-check-circle"></i>
                                    Confirm New Password
                                </span>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"
                                    CssClass="form-input" placeholder="Confirm new password"></asp:TextBox>
                            </div>

                            <div class="field-group">
                                <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>
                                <asp:Button ID="btnChangePassword" runat="server" Text="Change Password"
                                    OnClick="btnChangePassword_Click" CssClass="btn-change-pass" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <script>
            function openPasswordModal() {
                const modal = document.getElementById('passwordModal');
                modal.classList.add('active');
            }

            function closePasswordModal() {
                const modal = document.getElementById('passwordModal');
                modal.classList.remove('active');
            }
        </script>

        <style>
            div[style*="z-index: 2147483647"],
            div[style*="z-index: 2147483647"]+div {
                display: none !important;
                opacity: 0 !important;
                visibility: hidden !important;
                height: 0 !important;
                width: 0 !important;
                pointer-events: none !important;
            }

            /* Modal Styles moved to top level context */
            .modal-overlay {
                position: fixed;
                inset: 0;
                background: rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(5px);
                z-index: 99999;
                display: flex;
                align-items: center;
                justify-content: center;
                opacity: 0;
                pointer-events: none;
                transition: opacity 0.3s ease;
            }

            .modal-overlay.active {
                opacity: 1;
                pointer-events: all;
            }

            .modal-container {
                background: white;
                padding: 2rem;
                border-radius: 20px;
                width: 90%;
                max-width: 500px;
                position: relative;
                transform: translateY(20px);
                transition: transform 0.3s ease;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
            }

            .modal-overlay.active .modal-container {
                transform: translateY(0);
            }

            .modal-close {
                position: absolute;
                top: 1.5rem;
                right: 1.5rem;
                background: none;
                border: none;
                font-size: 1.25rem;
                color: #64748b;
                cursor: pointer;
                transition: color 0.2s;
            }

            .modal-close:hover {
                color: #ef4444;
            }

            /* Page Specific Styles */
            .profile-page {
                max-width: 900px;
                margin: 0 auto;
            }

            .profile-header {
                display: flex;
                align-items: center;
                gap: 1.5rem;
                margin-bottom: 2rem;
                padding-bottom: 2rem;
                border-bottom: 1px solid rgba(0, 0, 0, 0.06);
            }

            .profile-avatar {
                width: 90px;
                height: 90px;
                border-radius: 20px;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 2.25rem;
                color: #ffffff;
                box-shadow: 0 8px 28px rgba(59, 130, 246, 0.35);
            }

            .profile-title-block h2 {
                margin: 0 0 0.375rem;
                font-size: 1.75rem;
                font-weight: 800;
                color: #1f2937;
            }

            .profile-title-block p {
                margin: 0;
                color: #6b7280;
                font-size: 1rem;
            }

            .text-gradient {
                color: #1f2937;
                -webkit-text-fill-color: #1f2937;
            }

            .profile-card {
                padding: 1.75rem;
                background: #ffffff;
                border-radius: 16px;
                border: 1px solid rgba(0, 0, 0, 0.06);
            }

            .card-header {
                display: flex;
                align-items: center;
                gap: 1rem;
                margin-bottom: 1.5rem;
                padding-bottom: 1.25rem;
                border-bottom: 1px solid rgba(0, 0, 0, 0.06);
            }

            .card-icon {
                width: 44px;
                height: 44px;
                border-radius: 12px;
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-size: 1.125rem;
                box-shadow: 0 6px 16px rgba(59, 130, 246, 0.3);
            }

            .card-header h3 {
                margin: 0;
                font-size: 1.125rem;
                font-weight: 700;
                color: #1f2937;
            }

            .profile-fields {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 1.25rem;
            }

            .field-group {
                display: flex;
                flex-direction: column;
                gap: 0.5rem;
            }

            .field-group.full-width {
                grid-column: 1 / -1;
            }

            .field-label {
                font-size: 0.8125rem;
                font-weight: 600;
                color: #6b7280;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .field-label i {
                color: #3b82f6;
                font-size: 0.875rem;
                width: 16px;
            }

            .field-value {
                font-size: 0.9375rem;
                color: #1f2937;
                padding: 0.875rem 1rem;
                border-radius: 10px;
                background: #f8fafc;
                border: 1px solid rgba(0, 0, 0, 0.06);
                transition: all 0.2s ease;
            }

            .field-value:hover {
                background: #f1f5f9;
                border-color: rgba(59, 130, 246, 0.15);
            }

            .badge-role {
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                font-size: 0.8125rem;
                font-weight: 600;
                padding: 0.5rem 1rem;
                border-radius: 999px;
                background: #eff6ff;
                color: #3b82f6;
                width: fit-content;
            }

            .badge-role i {
                font-size: 0.875rem;
                color: #3b82f6;
            }

            @media (max-width: 768px) {
                .profile-header {
                    flex-direction: column;
                    align-items: center;
                    text-align: center;
                    gap: 1rem;
                }

                .profile-avatar {
                    width: 80px;
                    height: 80px;
                    font-size: 2rem;
                }

                .profile-title-block h2 {
                    font-size: 1.5rem;
                }

                .profile-card {
                    padding: 1.25rem;
                    display: flex;
                    flex-direction: column;
                }

                .profile-fields {
                    grid-template-columns: 1fr;
                    gap: 1rem;
                }

                .card-header {
                    flex-direction: column;
                    text-align: center;
                    gap: 0.75rem;
                }

                /* Move Change Password button to bottom on mobile */
                .card-header .btn-trigger-modal {
                    display: none;
                }

                .profile-card::after {
                    content: '';
                    display: block;
                    order: 999;
                }

                /* Show a mobile-specific button at bottom */
                .profile-fields {
                    order: 1;
                }

                .card-header {
                    order: 0;
                }

                .btn-trigger-modal-mobile {
                    display: flex !important;
                    order: 2;
                    width: 100%;
                    justify-content: center;
                    margin-top: 1.5rem;
                    padding: 0.875rem 1.5rem;
                    background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                    color: white;
                    border: none;
                    border-radius: 10px;
                    font-weight: 600;
                    font-size: 0.9375rem;
                    cursor: pointer;
                    gap: 0.5rem;
                    align-items: center;
                    box-shadow: 0 4px 12px rgba(59, 130, 246, 0.25);
                }

                .btn-trigger-modal-mobile:hover {
                    transform: translateY(-1px);
                    box-shadow: 0 6px 16px rgba(59, 130, 246, 0.35);
                }
            }

            /* Hide mobile button on desktop */
            .btn-trigger-modal-mobile {
                display: none;
            }

            @media (max-width: 480px) {
                .profile-card {
                    padding: 1rem;
                }

                .field-value {
                    padding: 0.75rem 0.875rem;
                }
            }

            .form-input {
                width: 100%;
                font-size: 0.9375rem;
                color: #1f2937;
                padding: 0.875rem 1rem;
                border-radius: 10px;
                background: #f8fafc;
                border: 1px solid rgba(0, 0, 0, 0.06);
                outline: none;
                transition: all 0.2s ease;
                box-sizing: border-box;
            }

            .form-input:focus {
                background: #ffffff;
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            }

            .btn-change-pass {
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: white;
                border: none;
                padding: 0.875rem 1.5rem;
                border-radius: 10px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.2s ease;
                width: 100%;
                margin-top: 1rem;
            }

            .btn-change-pass:hover {
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(59, 130, 246, 0.25);
            }

            .text-success {
                color: #10b981;
                font-weight: 600;
            }

            .text-error {
                color: #ef4444;
                font-weight: 600;
            }

            .btn-trigger-modal {
                margin-left: auto;
                background: rgba(59, 130, 246, 0.1);
                color: #2563eb;
                border: none;
                padding: 0.5rem 1rem;
                border-radius: 8px;
                font-weight: 600;
                font-size: 0.875rem;
                cursor: pointer;
                transition: all 0.2s;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .btn-trigger-modal:hover {
                background: rgba(59, 130, 246, 0.15);
                transform: translateY(-1px);
            }
        </style>
    </asp:Content>