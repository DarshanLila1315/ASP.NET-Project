using System;
using System.Data;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

namespace interview_questions.Admin
{
    public partial class AssignTests : System.Web.UI.Page
    {
        DBHelper db = new DBHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTests();
                LoadAllAssignments();
            }
        }

        // ========== LOAD DATA ==========
        private void LoadTests()
        {
            try
            {
                DataTable dt = db.ExeSP("sp_GetAll_Tests", null);
                ddlTest.DataSource = dt;
                ddlTest.DataTextField = "Test_Name";
                ddlTest.DataValueField = "Test_ID";
                ddlTest.DataBind();
                ddlTest.Items.Insert(0, new ListItem("-- Select Test --", ""));
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading tests: " + ex.Message, false);
            }
        }

        private void LoadUsersForTest(int testId)
        {
            try
            {
                // Get all non-admin users
                DataTable dtUsers = db.ExeSP("sp_GetAll_NonAdminUsers", null);

                // Get users who already have this test assigned
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                parameters.Add("@p_Test_ID", testId);
                DataTable dtAssigned = db.ExeSP("sp_Get_Users_With_Test", parameters);

                // Create a HashSet for quick lookup
                HashSet<int> assignedUserIds = new HashSet<int>();
                foreach (DataRow row in dtAssigned.Rows)
                {
                    assignedUserIds.Add(Convert.ToInt32(row["User_ID"]));
                }

                // Add AlreadyAssigned column
                dtUsers.Columns.Add("AlreadyAssigned", typeof(bool));
                foreach (DataRow row in dtUsers.Rows)
                {
                    int userId = Convert.ToInt32(row["User_ID"]);
                    row["AlreadyAssigned"] = assignedUserIds.Contains(userId);
                }

                gvUsers.DataSource = dtUsers;
                gvUsers.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading users: " + ex.Message, false);
            }
        }

        private void LoadAllAssignments()
        {
            try
            {
                DataTable dt = db.ExeSP("sp_Get_All_Test_Assignments", null);
                gvAllAssignments.DataSource = dt;
                gvAllAssignments.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading assignments: " + ex.Message, false);
            }
        }

        // ========== TEST SELECTION CHANGED ==========
        protected void ddlTest_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlTest.SelectedValue))
            {
                int testId = Convert.ToInt32(ddlTest.SelectedValue);
                gvUsers.PageIndex = 0;
                LoadUsersForTest(testId);
                userSelectionSection.Visible = true;
            }
            else
            {
                userSelectionSection.Visible = false;
            }
        }

        // ========== BULK ASSIGN TEST ==========
        protected void btnBulkAssign_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(ddlTest.SelectedValue))
                {
                    ShowMessage("Please select a test first!", false);
                    return;
                }

                List<int> selectedUserIds = GetSelectedUserIds();

                if (selectedUserIds.Count == 0)
                {
                    ShowMessage("Please select at least one user!", false);
                    return;
                }

                int testId = Convert.ToInt32(ddlTest.SelectedValue);
                int adminId = Convert.ToInt32(Session["AdminID"]);
                int successCount = 0;
                int failCount = 0;

                foreach (int userId in selectedUserIds)
                {
                    try
                    {
                        Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                        parameters.Add("@p_User_ID", userId);
                        parameters.Add("@p_Test_ID", testId);
                        parameters.Add("@p_Assigned_By", adminId);
                        parameters.Add("@p_Due_Date", DBNull.Value);

                        db.ExeSP("sp_Assign_Test_To_User", parameters);
                        successCount++;
                    }
                    catch
                    {
                        failCount++;
                    }
                }

                if (successCount > 0)
                {
                    ShowMessage($"Successfully assigned test to {successCount} user(s)!" + 
                        (failCount > 0 ? $" ({failCount} failed)" : ""), true);
                }
                else
                {
                    ShowMessage("Failed to assign test to any users!", false);
                }

                // Reload data
                LoadUsersForTest(testId);
                LoadAllAssignments();
            }
            catch (Exception ex)
            {
                ShowMessage("Error assigning test: " + ex.Message, false);
            }
        }

        // ========== UNASSIGN TEST ==========
        protected void gvAllAssignments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Unassign")
                {
                    int utId = Convert.ToInt32(e.CommandArgument);

                    Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                    parameters.Add("@p_UT_ID", utId);

                    db.ExeSP("sp_Unassign_Test_From_User", parameters);
                    ShowMessage("Test unassigned successfully!", true);

                    // Reload data
                    LoadAllAssignments();
                    if (!string.IsNullOrEmpty(ddlTest.SelectedValue))
                    {
                        int testId = Convert.ToInt32(ddlTest.SelectedValue);
                        LoadUsersForTest(testId);
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error unassigning test: " + ex.Message, false);
            }
        }

        // ========== PAGINATION ==========
        protected void gvAllAssignments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAllAssignments.PageIndex = e.NewPageIndex;
            LoadAllAssignments();
        }

        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsers.PageIndex = e.NewPageIndex;
            if (!string.IsNullOrEmpty(ddlTest.SelectedValue))
            {
                int testId = Convert.ToInt32(ddlTest.SelectedValue);
                LoadUsersForTest(testId);
            }
        }

        // ========== HELPER METHODS ==========
        private List<int> GetSelectedUserIds()
        {
            List<int> selectedIds = new List<int>();

            foreach (GridViewRow row in gvUsers.Rows)
            {
                CheckBox chkUser = (CheckBox)row.FindControl("chkUser");
                if (chkUser != null && chkUser.Checked)
                {
                    int userId = Convert.ToInt32(gvUsers.DataKeys[row.RowIndex].Value);
                    selectedIds.Add(userId);
                }
            }

            return selectedIds;
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            lblMsg.Text = message;
            lblMsg.CssClass = isSuccess ? "alert alert-success" : "alert alert-danger";
            lblMsg.Visible = true;
        }
    }
}
