using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;

namespace interview_questions.Admin
{
    public partial class AssignQuestions : System.Web.UI.Page
    {
        DBHelper db = new DBHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTests();
                LoadCategories();
            }
        }

        // Load all categories into dropdown
        private void LoadCategories()
        {
            try
            {
                DataTable dt = db.ExeSP("sp_GetAll_Categories", null);
                ddlCategory.DataSource = dt;
                ddlCategory.DataTextField = "Category_Name";
                ddlCategory.DataValueField = "Category_ID";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("All Categories", "0"));
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading categories: " + ex.Message, false);
            }
        }

        // When category filter changes
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlTest.SelectedValue))
            {
                gvAllQuestions.PageIndex = 0;
                LoadAvailableQuestions();
            }
        }

        // Load all tests into dropdown
        private void LoadTests()
        {
            try
            {
                DataTable dt = db.ExeSP("sp_GetAll_Tests", null);
                ddlTest.DataSource = dt;
                ddlTest.DataTextField = "Test_Name";
                ddlTest.DataValueField = "Test_ID";
                ddlTest.DataBind();
                ddlTest.Items.Insert(0, new ListItem("-- Select a Test --", ""));
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading tests: " + ex.Message, false);
            }
        }

        // When test is selected, load questions
        protected void ddlTest_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlTest.SelectedValue))
            {
                gvAllQuestions.PageIndex = 0;
                gvAssigned.PageIndex = 0;
                LoadAvailableQuestions();
                LoadAssignedQuestions();
            }
            else
            {
                gvAllQuestions.DataSource = null;
                gvAllQuestions.DataBind();
                gvAssigned.DataSource = null;
                gvAssigned.DataBind();
            }
        }

        // Load questions NOT assigned to selected test (only Test questions)
        private void LoadAvailableQuestions()
        {
            try
            {
                int testId = Convert.ToInt32(ddlTest.SelectedValue);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                parameters.Add("@p_Test_ID", testId);

                DataTable dt = db.ExeSP("sp_GetAvailable_Questions", parameters);
                
                // Filter for Test questions only and by category if selected
                DataTable filteredQuestions = dt.Clone();
                int selectedCategoryId = Convert.ToInt32(ddlCategory.SelectedValue);
                
                foreach (DataRow row in dt.Rows)
                {
                    // Only show Test questions (Question_Type = 'Test')
                    bool isTestQuestion = false;
                    if (dt.Columns.Contains("Question_Type") && row["Question_Type"] != DBNull.Value)
                    {
                        isTestQuestion = row["Question_Type"].ToString().Equals("Test", StringComparison.OrdinalIgnoreCase);
                    }
                    
                    if (!isTestQuestion)
                        continue;
                    
                    // Apply category filter if selected
                    if (selectedCategoryId > 0)
                    {
                        if (dt.Columns.Contains("Category_ID") && row["Category_ID"] != DBNull.Value)
                        {
                            if (Convert.ToInt32(row["Category_ID"]) != selectedCategoryId)
                                continue;
                        }
                    }
                    
                    filteredQuestions.ImportRow(row);
                }
                
                gvAllQuestions.DataSource = filteredQuestions;
                gvAllQuestions.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading available questions: " + ex.Message, false);
            }
        }

        // Load questions assigned to selected test
        private void LoadAssignedQuestions()
        {
            try
            {
                int testId = Convert.ToInt32(ddlTest.SelectedValue);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                parameters.Add("@p_Test_ID", testId);

                DataTable dt = db.ExeSP("sp_GetAssigned_Questions", parameters);
                gvAssigned.DataSource = dt;
                gvAssigned.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading assigned questions: " + ex.Message, false);
            }
        }

        // Bulk assign selected questions to test
        protected void btnAssignSelected_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(ddlTest.SelectedValue))
                {
                    ShowMessage("Please select a test first.", false);
                    return;
                }

                int testId = Convert.ToInt32(ddlTest.SelectedValue);
                int assignedCount = 0;

                foreach (GridViewRow row in gvAllQuestions.Rows)
                {
                    CheckBox chkSelect = (CheckBox)row.FindControl("chkSelect");
                    if (chkSelect != null && chkSelect.Checked)
                    {
                        int questionId = Convert.ToInt32(gvAllQuestions.DataKeys[row.RowIndex].Value);

                        Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                        parameters.Add("@p_Test_ID", testId);
                        parameters.Add("@p_Question_ID", questionId);

                        db.ExeSP("sp_Assign_Question", parameters);
                        assignedCount++;
                    }
                }

                if (assignedCount > 0)
                {
                    ShowMessage($"{assignedCount} question(s) assigned successfully!", true);
                    LoadAvailableQuestions();
                    LoadAssignedQuestions();
                }
                else
                {
                    ShowMessage("Please select at least one question to assign.", false);
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error assigning questions: " + ex.Message, false);
            }
        }

        // Remove question from test
        protected void gvAssigned_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                try
                {
                    int tqId = Convert.ToInt32(e.CommandArgument);

                    Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                    parameters.Add("@p_TQ_ID", tqId);

                    db.ExeSP("sp_Remove_AssignedQuestion", parameters);
                    ShowMessage("Question removed from test successfully!", true);

                    // Refresh both grids
                    LoadAvailableQuestions();
                    LoadAssignedQuestions();
                }
                catch (Exception ex)
                {
                    ShowMessage("Error removing question: " + ex.Message, false);
                }
            }
        }

        protected void gvAllQuestions_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAllQuestions.PageIndex = e.NewPageIndex;
            LoadAvailableQuestions();
        }

        protected void gvAssigned_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAssigned.PageIndex = e.NewPageIndex;
            LoadAssignedQuestions();
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            lblMsg.Text = message;
            lblMsg.CssClass = isSuccess ? "alert alert-success" : "alert alert-danger";
            lblMsg.Visible = true;
        }
    }
}
