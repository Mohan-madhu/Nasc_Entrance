using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    string connectionstring = ConfigurationManager.ConnectionStrings["NASC_ENTRANCE"].ConnectionString;
    DataTable coursedata = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) course_data();
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        string firstName = FirstName.Text;
        string lastName = LastName.Text;
        DateTime dateOfBirth = DateTime.Parse(DateOfBirth.Text);
        string schoolName = SchoolName.Text;
        string phoneNumber = PhoneNumber.Text;
        string altPhoneNumber = AltPhoneNumber.Text;
        string email = Email.Text;
        string state = State.Text;
        string district = District.Text;
        string coursename = Course.SelectedItem.Text;
        string courseid = Course.SelectedValue;

        SqlConnection sqlConnection = new SqlConnection(connectionstring);
        sqlConnection.Open();
        string querry = "sp_insert_student";
        SqlCommand sqlCommand = new SqlCommand(querry, sqlConnection);
        sqlCommand.CommandType = CommandType.StoredProcedure;

        sqlCommand.Parameters.AddWithValue("@FirstName", firstName);
        sqlCommand.Parameters.AddWithValue("@LastName", lastName);
        sqlCommand.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
        sqlCommand.Parameters.AddWithValue("@Courseid", courseid);
        sqlCommand.Parameters.AddWithValue("@Coursename", coursename);
        sqlCommand.Parameters.AddWithValue("@SchoolName", schoolName);
        sqlCommand.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
        sqlCommand.Parameters.AddWithValue("@AltPhoneNumber", altPhoneNumber);
        sqlCommand.Parameters.AddWithValue("@Email", email);
        sqlCommand.Parameters.AddWithValue("@State", state);
        sqlCommand.Parameters.AddWithValue("@District", district);


        SqlParameter msg = new SqlParameter("@msg", SqlDbType.VarChar, -1);
        msg.Direction = ParameterDirection.Output;
        sqlCommand.Parameters.Add(msg);

        sqlCommand.ExecuteNonQuery();
        sqlConnection.Close();


        string message = msg.Value.ToString();

        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message.Replace("'", "\\'")}');", true);
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
