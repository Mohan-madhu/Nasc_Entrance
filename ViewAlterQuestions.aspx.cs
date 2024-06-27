using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAlterQuestions : System.Web.UI.Page
{
    string connectionstring = Database.dbstring;
    String msg;
    DataTable question_data = new DataTable();
    DataTable coursedata = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            course_data();
        }
    }

    protected void Course_SelectedIndexChanged(object sender, EventArgs e)
    {
        gv_qns.Visible = true;
        qns_data();
        pnl_editqns.Visible = false;
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
        ddlcourseedit.DataSource = coursedata;
        ddlcourseedit.DataBind();

    }

    public void qns_data()
    {
        SqlConnection sqlConnection = new SqlConnection(connectionstring);
        sqlConnection.Open();
        string querry = "sp_view_questions_all";
        SqlCommand sqlCommand = new SqlCommand(querry, sqlConnection);
        sqlCommand.CommandType = CommandType.StoredProcedure;
        sqlCommand.Parameters.AddWithValue("@courseid", Course.SelectedValue);
        SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand);
        dataAdapter.Fill(question_data);
        sqlConnection.Close();

        gv_qns.DataSource = question_data;
        gv_qns.DataBind();
    }

    protected void gv_qns_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow grow = gv_qns.Rows[index];

        if (e.CommandName == "delqns")
        {
            string id = ((Label)grow.FindControl("lblqnsid")).Text;


            SqlConnection sqlConnection = new SqlConnection(connectionstring);
            sqlConnection.Open();
            string querry = "sp_del_question";
            SqlCommand sqlCommand = new SqlCommand(querry, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;

            sqlCommand.Parameters.AddWithValue("@questionid", id);


            SqlParameter msg = new SqlParameter("@msg", SqlDbType.VarChar, -1);
            msg.Direction = ParameterDirection.Output;
            sqlCommand.Parameters.Add(msg);

            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();

            qns_data();

            string message = msg.Value.ToString();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message.Replace("'", "\\'")}');", true);


        }
        else if (e.CommandName == "editqns")
        {
            pnl_editqns.Visible = true;
            lblqnsid.Text = ((Label)grow.FindControl("lblqnsid")).Text;
            txtqns.Text = ((Label)grow.FindControl("txtqns")).Text;
            opt_a.Text = ((Label)grow.FindControl("opt_a")).Text;
            opt_b.Text = ((Label)grow.FindControl("opt_b")).Text;
            opt_c.Text = ((Label)grow.FindControl("opt_c")).Text;
            opt_d.Text = ((Label)grow.FindControl("opt_d")).Text;
            ddlcourseedit.SelectedIndex = Course.SelectedIndex;



        }
    }

    protected void btn_updqns_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(connectionstring);
        connection.Open();
        SqlCommand command = new SqlCommand("sp_ins_question", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.AddWithValue("@questionid", lblqnsid.Text);
        command.Parameters.AddWithValue("@courseid", ddlcourseedit.SelectedValue);
        command.Parameters.AddWithValue("@coursename", ddlcourseedit.SelectedItem.Text);
        command.Parameters.AddWithValue("@question", txtqns.Text);
        command.Parameters.AddWithValue("@option1", opt_a.Text);
        command.Parameters.AddWithValue("@option2", opt_b.Text);
        command.Parameters.AddWithValue("@option3", opt_c.Text);
        command.Parameters.AddWithValue("@option4", opt_d.Text);

        if(a.Checked)
        {
            command.Parameters.AddWithValue("@answer", opt_a.Text);
        }
        else if (b.Checked)
        {
            command.Parameters.AddWithValue("@answer", opt_b.Text);
        }
        else if (c.Checked)
        {
            command.Parameters.AddWithValue("@answer", opt_c.Text);
        }
        else if (d.Checked)
        {
            command.Parameters.AddWithValue("@answer", opt_d.Text);
        }

        command.Parameters.Add("@msg", SqlDbType.NVarChar, 1000).Direction = ParameterDirection.Output;

        command.ExecuteNonQuery();
        connection.Close();
        msg = command.Parameters["@msg"].Value.ToString();

        qns_data();
        pnl_editqns.Visible = false;
    }
}