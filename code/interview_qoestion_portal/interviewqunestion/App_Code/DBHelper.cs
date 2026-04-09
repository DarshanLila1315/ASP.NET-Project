using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DBHelper
    {
        SqlConnection con;
        static string conStr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        public void openConnection()
        {
            con = new SqlConnection(conStr);
            con.Open();
        }
        public void closeConnection()
        {
            if (con != null && con.State == ConnectionState.Open)
                con.Close();
        }

        public void disposeConnection()
        {
            if (con != null)
                con.Dispose();
        }

        public DataTable ExeSP(string sp_name, Dictionary<string, dynamic> parametres)
        {
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand(sp_name, con);
                cmd.CommandType = CommandType.StoredProcedure;
                if (parametres != null)
                {
                    foreach (var parametre in parametres)
                    {
                        cmd.Parameters.AddWithValue(parametre.Key, parametre.Value);
                    }
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con != null)
                {
                    if (con.State == ConnectionState.Open)
                        con.Close();
                    con.Dispose();
                    con = null;
                }
            }
        }

        public DataTable ExecuteQuery(string query)
        {
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                closeConnection();
            }
        }

        public int ExecuteNonQuery(string query)
        {
            try
            {
                openConnection();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = CommandType.Text;
                return cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                closeConnection();
            }
        }
    }
}
