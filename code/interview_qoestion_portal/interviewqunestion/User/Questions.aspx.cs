using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLayer;
using System.Data;

namespace interviewquestion.User
{
    public partial class Questions : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        DBHelper db = new DBHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadCompanies();
                LoadQuestions();
            }
        }

        // --- NEW FIX FOR MOBILE VIEW ---
        // This forces the GridView to generate a <thead> tag, which your CSS needs to hide headers on mobile.
        protected void gvQuestions_PreRender(object sender, EventArgs e)
        {
            if (gvQuestions.Rows.Count > 0)
            {
                gvQuestions.UseAccessibleHeader = true;
                gvQuestions.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        // --------------------------------

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

        private void LoadCompanies()
        {
            try
            {
                DataTable dt = db.ExeSP("sp_GetAll_Companies", null);
                ddlCompany.DataSource = dt;
                ddlCompany.DataTextField = "Company_Name";
                ddlCompany.DataValueField = "Company_ID";
                ddlCompany.DataBind();
                ddlCompany.Items.Insert(0, new ListItem("All Companies", "0"));
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading companies: " + ex.Message, false);
            }
        }

        private void LoadQuestions()
        {
            try
            {
                DataTable allQuestions = db.ExeSP("sp_GetAll_Questions", null);
                DataTable filteredQuestions = allQuestions.Clone();

                string selectedCategoryVal = ddlCategory.SelectedValue;
                string selectedCompanyVal = ddlCompany.SelectedValue;

                int selectedCategoryId = 0;
                int selectedCompanyId = 0;

                int.TryParse(selectedCategoryVal, out selectedCategoryId);
                int.TryParse(selectedCompanyVal, out selectedCompanyId);

                // Default: Show regular questions if no filter
                if (selectedCategoryId == 0 && selectedCompanyId == 0)
                {
                    DataTable regularQuestions = allQuestions.Clone();
                    foreach (DataRow row in allQuestions.Rows)
                    {
                        bool isRegular = true;
                        if (allQuestions.Columns.Contains("Question_Type") && row["Question_Type"] != DBNull.Value)
                        {
                            isRegular = row["Question_Type"].ToString().Equals("Regular", StringComparison.OrdinalIgnoreCase);
                        }
                        if (isRegular)
                        {
                            regularQuestions.ImportRow(row);
                        }
                    }
                    gvQuestions.DataSource = regularQuestions;
                    gvQuestions.DataBind();
                    return;
                }

                foreach (DataRow row in allQuestions.Rows)
                {
                    bool isRegularQuestion = true;
                    if (allQuestions.Columns.Contains("Question_Type") && row["Question_Type"] != DBNull.Value)
                    {
                        isRegularQuestion = row["Question_Type"].ToString().Equals("Regular", StringComparison.OrdinalIgnoreCase);
                    }

                    if (!isRegularQuestion) continue;

                    bool matchesCategory = (selectedCategoryId == 0);
                    if (!matchesCategory && allQuestions.Columns.Contains("Category_ID") && row["Category_ID"] != DBNull.Value)
                    {
                        matchesCategory = (Convert.ToInt32(row["Category_ID"]) == selectedCategoryId);
                    }

                    bool matchesCompany = (selectedCompanyId == 0);
                    if (!matchesCompany && allQuestions.Columns.Contains("Company_ID") && row["Company_ID"] != DBNull.Value)
                    {
                        matchesCompany = (Convert.ToInt32(row["Company_ID"]) == selectedCompanyId);
                    }

                    if (matchesCategory && matchesCompany)
                    {
                        filteredQuestions.ImportRow(row);
                    }
                }

                gvQuestions.DataSource = filteredQuestions;
                gvQuestions.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading questions: " + ex.Message, false);
            }
        }

        protected void FilterChanged(object sender, EventArgs e)
        {
            gvQuestions.PageIndex = 0;
            LoadQuestions();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ddlCategory.SelectedIndex = 0;
            ddlCompany.SelectedIndex = 0;
            gvQuestions.PageIndex = 0;
            LoadQuestions();
        }

        public string GetAnswerText(object correctOptionObj, object optionAObj, object optionBObj, object optionCObj, object optionDObj)
        {
            if (correctOptionObj == null) return "N/A";

            string correctOption = correctOptionObj.ToString().Trim().ToUpper();
            string optionA = optionAObj != null ? optionAObj.ToString() : "";
            string optionB = optionBObj != null ? optionBObj.ToString() : "";
            string optionC = optionCObj != null ? optionCObj.ToString() : "";
            string optionD = optionDObj != null ? optionDObj.ToString() : "";

            switch (correctOption)
            {
                case "A": return optionA;
                case "B": return optionB;
                case "C": return optionC;
                case "D": return optionD;
                default: return correctOption;
            }
        }

        protected void gvQuestions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Bookmark")
                {
                    if (Session["UserID"] == null)
                    {
                        Response.Redirect("~/User/Login.aspx");
                        return;
                    }

                    int questionId = Convert.ToInt32(e.CommandArgument);

                    Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                    parameters.Add("@p_User_ID", Session["UserID"]);
                    parameters.Add("@p_Question_ID", questionId);
                    db.ExeSP("sp_Insert_Bookmark", parameters);
                    ShowMessage("Question bookmarked successfully!", true);
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, false);
            }
        }

        protected void gvQuestions_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvQuestions.PageIndex = e.NewPageIndex;
            LoadQuestions();
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            lblMsg.Text = message;
            pnlMessage.CssClass = isSuccess ? "alert-message alert-success" : "alert-message alert-danger";
            pnlMessage.Visible = true;
        }
    }
}