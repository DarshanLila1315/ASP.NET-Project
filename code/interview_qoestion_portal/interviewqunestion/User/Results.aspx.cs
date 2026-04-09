using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.Services;
using System.Web.Script.Services;
using System.Text;
using DataLayer;

namespace interviewquestion.User
{
    public partial class Results : System.Web.UI.Page
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

                LoadResults();
            }
        }

        private void LoadResults()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                parameters["@p_User_ID"] = userId;

                DataTable dt = db.ExeSP("sp_GetTestResults_ByUserID", parameters);
                
                if (dt != null && dt.Rows.Count > 0)
                {
                    rptResults.DataSource = dt;
                    rptResults.DataBind();
                    pnlResults.Visible = true;
                    pnlEmpty.Visible = false;
                }
                else
                {
                    pnlResults.Visible = false;
                    pnlEmpty.Visible = true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading results: " + ex.Message);
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GetTestReviewDetails(int resultId)
        {
            try
            {
                DBHelper db = new DBHelper();
                Dictionary<string, dynamic> parameters = new Dictionary<string, dynamic>();
                parameters["@p_Result_ID"] = resultId;

                DataTable dt = db.ExeSP("sp_Get_Test_Review_Details", parameters);

                if (dt != null && dt.Rows.Count > 0)
                {
                    StringBuilder json = new StringBuilder();
                    json.Append("[");

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        DataRow row = dt.Rows[i];
                        if (i > 0) json.Append(",");

                        json.Append("{");
                        json.AppendFormat("\"questionId\":{0},", row["Question_ID"]);
                        json.AppendFormat("\"questionText\":\"{0}\",", EscapeJson(row["Question_Text"].ToString()));
                        json.AppendFormat("\"optionA\":\"{0}\",", EscapeJson(row["OptionA"].ToString()));
                        json.AppendFormat("\"optionB\":\"{0}\",", EscapeJson(row["OptionB"].ToString()));
                        json.AppendFormat("\"optionC\":\"{0}\",", EscapeJson(row["OptionC"].ToString()));
                        json.AppendFormat("\"optionD\":\"{0}\",", EscapeJson(row["OptionD"].ToString()));
                        json.AppendFormat("\"correctOption\":\"{0}\",", EscapeJson(row["CorrectOption"].ToString().Trim()));
                        json.AppendFormat("\"userAnswer\":\"{0}\",", EscapeJson(row["User_Answer"].ToString().Trim()));
                        
                        // Handle Is_Correct safely
                        string isCorrectStr = "false";
                        if (row["Is_Correct"] != DBNull.Value)
                        {
                            string val = row["Is_Correct"].ToString().ToLower();
                            if (val == "true" || val == "1") isCorrectStr = "true";
                        }
                        json.AppendFormat("\"isCorrect\":{0}", isCorrectStr);
                        
                        json.Append("}");
                    }

                    json.Append("]");
                    return json.ToString();
                }

                return "[]";
            }
            catch (Exception ex)
            {
                return "{\"error\":\"" + EscapeJson(ex.Message) + "\"}";
            }
        }

        private static string EscapeJson(string text)
        {
            if (string.IsNullOrEmpty(text)) return "";
            return text.Replace("\\", "\\\\").Replace("\"", "\\\"").Replace("\n", "\\n").Replace("\r", "\\r").Replace("\t", "\\t");
        }
    }
}