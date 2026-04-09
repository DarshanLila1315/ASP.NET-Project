using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using DataLayer;

namespace interviewqunestion.User
{
    public partial class Profile : System.Web.UI.Page
    {
        DBHelper db = new DBHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/Account/Login.aspx");
                    return;
                }

                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                parameters["@p_User_ID"] = userId;

                DataTable dt = db.ExeSP("sp_Get_User_ByID", parameters);

                if (dt == null || dt.Rows.Count == 0)
                {
                    // Fallback query
                    string sql = $"SELECT * FROM User_Master WHERE User_ID = {userId}";
                    try { dt = db.ExecuteQuery(sql); } catch { }
                }

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];

                    // Populate profile labels
                    lblFullName.Text = row["User_FirstName"].ToString() + " " + row["User_LastName"].ToString();
                    lblEmail.Text = row["User_EmailID"].ToString();
                    //lblUsername.Text = row["User_EmailID"].ToString(); // Using email as username
                    //lblRole.Text = row["User_Role"].ToString();

                    // Format member since date
                    if (row["User_RegisteredDate"] != DBNull.Value)
                    {
                        DateTime registeredDate = Convert.ToDateTime(row["User_RegisteredDate"]);
                        lblMemberSince.Text = registeredDate.ToString("MMMM dd, yyyy");
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading profile: " + ex.Message);
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            try
            {
                string oldPass = txtOldPassword.Text; // Use .Text directly
                string newPass = txtNewPassword.Text;
                string confirmPass = txtConfirmPassword.Text;

                if (string.IsNullOrEmpty(oldPass) || string.IsNullOrEmpty(newPass))
                {
                    lblMessage.Text = "Please fill all fields.";
                    lblMessage.CssClass = "text-error";
                    return;
                }

                if (newPass != confirmPass)
                {
                    lblMessage.Text = "New passwords do not match.";
                    lblMessage.CssClass = "text-error";
                    return;
                }

                // Strong Password Regex: Min 8 chars, 1 Upper, 1 Lower, 1 Number, 1 Special
                if (!System.Text.RegularExpressions.Regex.IsMatch(newPass, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"))
                {
                    lblMessage.Text = "Password must be at least 8 characters and include uppercase, lowercase, number, and special character.";
                    lblMessage.CssClass = "text-error";
                    return;
                }

                int userId = Convert.ToInt32(Session["UserID"]);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                parameters["@p_User_ID"] = userId;

                DataTable dt = db.ExeSP("sp_Get_User_ByID", parameters);

                if (dt == null || dt.Rows.Count == 0)
                {
                    string sql = $"SELECT * FROM User_Master WHERE User_ID = {userId}";
                    try { dt = db.ExecuteQuery(sql); } catch { }
                }

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    string storedPass = row["User_Password"].ToString();
                    string email = row["User_EmailID"].ToString();

                    bool isAuth = false;
                    if (storedPass.StartsWith("$2a$"))
                    {
                        try { isAuth = BCrypt.Net.BCrypt.Verify(oldPass, storedPass); } catch { }
                    }
                    else
                    {
                        isAuth = (oldPass == storedPass);
                    }

                    if (!isAuth)
                    {
                        lblMessage.Text = "Incorrect old password.";
                        lblMessage.CssClass = "text-error";
                        return;
                    }

                    string hashedNew = BCrypt.Net.BCrypt.HashPassword(newPass);

                    Dictionary<string, dynamic> up = new Dictionary<string, dynamic>();
                    up["@p_Email"] = email;
                    up["@p_NewPassword"] = hashedNew;

                    try
                    {
                        db.ExeSP("sp_UpdateUserPassword", up);
                    }
                    catch
                    {
                         // Fallback Update
                         string sqlUpdate = $"UPDATE User_Master SET User_Password = '{hashedNew}' WHERE User_ID = {userId}";
                         db.ExecuteNonQuery(sqlUpdate);
                    }

                    lblMessage.Text = "Password changed successfully.";
                    lblMessage.CssClass = "text-success";
                    txtOldPassword.Text = "";
                    txtNewPassword.Text = "";
                    txtConfirmPassword.Text = "";
                }
                else
                {
                    lblMessage.Text = "User not found.";
                    lblMessage.CssClass = "text-error";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.CssClass = "text-error";
            }
        }
    }
}