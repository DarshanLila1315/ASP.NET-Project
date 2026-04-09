using DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.Services;
using System.Configuration;

namespace interviewqunestion.Account
{
    public partial class Login : System.Web.UI.Page
    {
        private DBHelper db = new DBHelper();

        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // hfEmail and hfPassword must match the IDs of your hidden fields in the ASPX
            string email = hfEmail.Value?.Trim();
            string password = hfPassword.Value;

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ShowTerminalError("Validation Error: Email and password are required.");
                return;
            }

            // 1. Fetch User by Email (Using sp_GetUserByEmail from your script)
            DataTable userData = GetUserByEmail(email);

            if (userData == null || userData.Rows.Count == 0)
            {
                ShowTerminalError("Access Denied: No account found with this email.");
                return;
            }

            DataRow user = userData.Rows[0];
            
            // 2. Validate Password and Role
            // Match column names from your script: User_Password, User_Role, User_ID
            string storedPassword = user["User_Password"]?.ToString();
            string userRole = user["User_Role"]?.ToString();
            string userId = user["User_ID"]?.ToString();

            if (!VerifyPassword(password, storedPassword, userRole))
            {
                ShowTerminalError("Access Denied: Incorrect password.");
                return;
            }

            // 3. Set Sessions and Redirect
            try
            {
                Session["UserID"] = userId;
                Session["Role"] = userRole;
                Session["UserEmail"] = email;

                if (userRole == "Admin")
                {
                    Session["AdminID"] = userId;
                    Response.Redirect("~/Admin/AdminHome.aspx", false);
                }
                else
                {
                    Response.Redirect("~/User/Dashboard.aspx", false);
                }
                Context.ApplicationInstance.CompleteRequest();
            }
            catch (Exception)
            {
                ShowTerminalError("System Error: Session initialization failed.");
            }
        }

        private DataTable GetUserByEmail(string email)
        {
            try
            {
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                parameters["@p_Email"] = email;
                
                // Calls 'CREATE PROCEDURE [dbo].[sp_GetUserByEmail]' from your script
                return db.ExeSP("sp_GetUserByEmail", parameters);
            }
            catch
            {
                return null;
            }
        }

        private static bool VerifyPassword(string input, string stored, string role)
        {
            if (string.IsNullOrEmpty(stored)) return false;

            // Use BCrypt for users (hashes starting with $2a$)
            if (stored.StartsWith("$2a$"))
            {
                try { return BCrypt.Net.BCrypt.Verify(input, stored); } catch { return false; }
            }

            // Plain text check for your Admin user (admin@123 in your script)
            return input == stored;
        }

        private void ShowTerminalError(string message)
        {
            string escaped = message.Replace("'", "\\'");
            string script = $"print('{escaped}', 'text-red'); step='choice';";
            ClientScript.RegisterStartupScript(this.GetType(), "TerminalError", script, true);
        }

        // ======================== WebMethods for AJAX Calls ========================

        [WebMethod]
        public static object CheckEmailExists(string email)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(email)) 
                    return new { success = false, message = "Email required." };

                DBHelper db = new DBHelper();
                Dictionary<string, dynamic> p = new Dictionary<string, dynamic>();
                p["@p_Email"] = email.Trim();
                DataTable dt = db.ExeSP("sp_GetUserByEmail", p);

                if (dt == null || dt.Rows.Count == 0)
                {
                    // Fallback to direct query
                    string sql = $"SELECT * FROM User_Master WHERE User_EmailID = '{email.Trim().Replace("'", "''")}'";
                    try { dt = db.ExecuteQuery(sql); } catch { }
                    
                    if (dt == null || dt.Rows.Count == 0)
                        return new { success = false, message = "No account found with this email." };
                }

                string role = dt.Rows[0]["User_Role"]?.ToString();
                return new { success = true, message = "Email verified.", role = role };
            }
            catch (Exception ex)
            {
                return new { success = false, message = "Error: " + ex.Message };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object VerifyCredentials(string email, string password)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
                    return new { success = false, message = "Email and password required." };

                DBHelper db = new DBHelper();
                Dictionary<string, dynamic> p = new Dictionary<string, dynamic>();
                p["@p_Email"] = email.Trim();
                DataTable dt = db.ExeSP("sp_GetUserByEmail", p);

                if (dt == null || dt.Rows.Count == 0)
                {
                     // Fallback query
                     string sql = $"SELECT * FROM User_Master WHERE User_EmailID = '{email.Trim().Replace("'", "''")}'";
                     try { dt = db.ExecuteQuery(sql); } catch { }

                     if (dt == null || dt.Rows.Count == 0)
                        return new { success = false, message = "No account found." };
                }

                DataRow user = dt.Rows[0];
                string stored = user["User_Password"]?.ToString();
                string role = user["User_Role"]?.ToString();
                string userId = user["User_ID"]?.ToString();

                bool isAuth = false;
                if (!string.IsNullOrEmpty(stored))
                {
                    if (stored.StartsWith("$2a$"))
                    {
                        try { isAuth = BCrypt.Net.BCrypt.Verify(password, stored); } catch { }
                    }
                    else
                    {
                        isAuth = (password == stored);
                    }
                }

                if (isAuth)
                {
                    HttpContext.Current.Session["UserID"] = userId;
                    HttpContext.Current.Session["Role"] = role;
                    HttpContext.Current.Session["UserEmail"] = email.Trim();

                    string redirectUrl = "~/User/Dashboard.aspx";
                    if (role == "Admin")
                    {
                        HttpContext.Current.Session["AdminID"] = userId;
                        redirectUrl = "~/Admin/AdminHome.aspx";
                    }
                    return new { success = true, redirectUrl = redirectUrl };
                }
                else
                {
                    return new { success = false, message = "Incorrect password." };
                }
            }
            catch (Exception ex)
            {
                return new { success = false, message = "Error: " + ex.Message };
            }
        }

        [WebMethod]
        public static object SendPasswordResetOTP(string email)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(email)) 
                    return new { success = false, message = "Email required." };

                DBHelper db = new DBHelper();
                Dictionary<string, dynamic> p = new Dictionary<string, dynamic>();
                p["@p_Email"] = email.Trim();
                DataTable dt = db.ExeSP("sp_GetUserByEmail", p);

                if (dt == null || dt.Rows.Count == 0)
                {
                     // Fallback query
                     string sql = $"SELECT * FROM User_Master WHERE User_EmailID = '{email.Trim().Replace("'", "''")}'";
                     try { dt = db.ExecuteQuery(sql); } catch { }

                     if (dt == null || dt.Rows.Count == 0)
                        return new { success = false, message = "No account found." };
                }

                string otp = EmailLayer.EmailHelper.GenerateSecureOTP(6);

                // Store OTP
                Dictionary<string, dynamic> otpParams = new Dictionary<string, dynamic>();
                otpParams["@p_Email"] = email.Trim();
                otpParams["@p_OTP"] = otp;
                otpParams["@p_ExpiryTime"] = DateTime.Now.AddMinutes(10);
                db.ExeSP("sp_StorePasswordResetOTP", otpParams);

                if (EmailLayer.EmailHelper.SendPasswordResetOTP(email.Trim(), otp))
                    return new { success = true, message = "OTP sent." };
                else
                    return new { success = false, message = "Failed to send email." };
            }
            catch (Exception ex)
            {
                return new { success = false, message = "Error: " + ex.Message };
            }
        }

        [WebMethod]
        public static object VerifyOTPAndResetPassword(string email, string otp, string newPassword)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(otp) || string.IsNullOrWhiteSpace(newPassword))
                    return new { success = false, message = "All fields required." };

                // Strong Password Regex
                if (!System.Text.RegularExpressions.Regex.IsMatch(newPassword, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"))
                    return new { success = false, message = "Password must be strong (8+ chars, upper, lower, number, special)." };

                DBHelper db = new DBHelper();
                Dictionary<string, dynamic> vp = new Dictionary<string, dynamic>();
                vp["@p_Email"] = email.Trim();
                vp["@p_OTP"] = otp.Trim();
                DataTable dt = db.ExeSP("sp_VerifyPasswordResetOTP", vp);

                if (dt == null || dt.Rows.Count == 0)
                    return new { success = false, message = "Invalid/Expired OTP." };

                string hashed = BCrypt.Net.BCrypt.HashPassword(newPassword);

                Dictionary<string, dynamic> up = new Dictionary<string, dynamic>();
                up["@p_Email"] = email.Trim();
                up["@p_NewPassword"] = hashed;
                try {
                     db.ExeSP("sp_UpdateUserPassword", up);
                } catch {   
                     // Fallback Update
                     string sql = $"UPDATE User_Master SET User_Password = '{hashed}' WHERE User_EmailID = '{email.Trim().Replace("'", "''")}'";
                     db.ExecuteNonQuery(sql);
                }

                return new { success = true, message = "Password reset successful." };
            }
            catch (Exception ex)
            {
                return new { success = false, message = "Error: " + ex.Message };
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Register.aspx");
        }
    }
}