using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class result_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGridView();

        }

    }

    private void BindGridView()
    {
        // Connection string to your SQL Server database
        string connectionString = ConfigurationManager.ConnectionStrings["NASC_ENTRANCE"].ConnectionString;

        // Query to retrieve data from the database table
        string query = "SELECT * FROM tbl_student";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();

            connection.Open();

            // Fill the DataTable with data from the database
            adapter.Fill(dataTable);
            dataTable.Columns.Add("DateOfBirth", typeof(string));

            foreach (DataRow row in dataTable.Rows)
            {
                string dobString = row["dateofbirth"].ToString();
                DateTime dob = DateTime.Parse(dobString);
                string dateOfBirth = dob.ToString("MM/dd/yyyy");
                row["DateOfBirth"] = dateOfBirth;
                if (string.IsNullOrEmpty(row["mark"].ToString()))
                {
                    // Set "Not Attended" in the footer if the column value is empty
                    string notatt = "Not Attended";
                    row["mark"] = notatt;

                }
            }


            dataTable.Columns.Remove("dateofbirth");

            // Bind the DataTable to the GridView
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }
    }
}
