﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Design : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string admid = Session["ADMIN"].ToString();
        }
        catch
        {
           // Response.Redirect("~/Admin/Login.aspx");
        }
    }
}
