using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddQuestion : System.Web.UI.Page
{
    string connectionstring = Database.dbstring;
    string msg;
    DataTable mdt = new DataTable();
    DataTable coursedata = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            course_data();
            mdt.Columns.Add("count");
            for (int i = 0; i < 3; i++)
            {
                mdt.Rows.Add(1);


            }
            gv_qns.DataSource = mdt;
            gv_qns.DataBind();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        for (int i = 0; i < gv_qns.Rows.Count; i++)
        {
            GridViewRow grow = gv_qns.Rows[i];

            if (((TextBox)grow.FindControl("txtqns")).Text != "")
            {
                SqlConnection connection = new SqlConnection(connectionstring);
                connection.Open();
                SqlCommand command = new SqlCommand("sp_ins_question", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@wuestionid", "");
                command.Parameters.AddWithValue("@courseid", Course.SelectedValue);
                command.Parameters.AddWithValue("@coursename",Course.SelectedItem.Text);
                command.Parameters.AddWithValue("@question", ((TextBox)grow.FindControl("txtqns")).Text);
                command.Parameters.AddWithValue("@option1", ((TextBox)grow.FindControl("opt_a")).Text);
                command.Parameters.AddWithValue("@option2", ((TextBox)grow.FindControl("opt_b")).Text);
                command.Parameters.AddWithValue("@option3", ((TextBox)grow.FindControl("opt_c")).Text);
                command.Parameters.AddWithValue("@option4", ((TextBox)grow.FindControl("opt_d")).Text);

                if (((CheckBox)grow.FindControl("a")).Checked)
                {
                    command.Parameters.AddWithValue("@answer", ((TextBox)grow.FindControl("opt_a")).Text);
                }
                else if (((CheckBox)grow.FindControl("b")).Checked)
                {
                    command.Parameters.AddWithValue("@answer", ((TextBox)grow.FindControl("opt_b")).Text);
                }
                else if (((CheckBox)grow.FindControl("c")).Checked)
                {
                    command.Parameters.AddWithValue("@answer", ((TextBox)grow.FindControl("opt_c")).Text);
                }
                else if (((CheckBox)grow.FindControl("d")).Checked)
                {
                    command.Parameters.AddWithValue("@answer", ((TextBox)grow.FindControl("opt_d")).Text);
                }

                command.Parameters.Add("@msg", SqlDbType.NVarChar, 1000).Direction = ParameterDirection.Output;

                command.ExecuteNonQuery();
                connection.Close();
                msg = command.Parameters["@msg"].Value.ToString();


            }



            messagebox(this, msg);

        }
    }

    public static void messagebox(Page webPageInstance, string message)
    {
        webPageInstance.ClientScript.RegisterStartupScript(webPageInstance.GetType(), "Pop", "<script language=JavaScript>  alert('" + message + "') </script> ");
    }
    public void course_data()
    {
        SqlConnection sqlConnection = new SqlConnection(connectionstring);
        sqlConnection.Open();
        string querry = "sp_view_course";
        SqlCommand sqlCommand = new SqlCommand(querry, sqlConnection);
        sqlCommand.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand);
        dataAdapter.Fill(coursedata);
        sqlConnection.Close();

        Course.DataSource = coursedata;
        Course.DataBind();
    }
}