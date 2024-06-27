using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EntranceExam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        



    }

    protected void btn_startexam_Click(object sender, EventArgs e)
    {
        try
        {
            string endtime = Session["startexam"].ToString();
            if(endtime=="1")
            {
                CountdownTimer.Enabled = true;
            }
        }
        catch
        {
            DateTime examEndTime = DateTime.Now.AddMinutes(30); // Set exam end time to 30 minutes from now
            Session["ExamEndTime"] = examEndTime;
            Session["startexam"] = "1";
            CountdownTimer.Enabled = true;
            pnl_instructions.Visible = false;

        }

    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {

        DateTime examEndTime = (DateTime)Session["ExamEndTime"];
        TimeSpan timeRemaining = examEndTime - DateTime.Now;

        if (timeRemaining <= TimeSpan.Zero)
        {
            TimerLabel.Text = "EXPIRED";
            CountdownTimer.Enabled = false; // Stop the timer
            Response.Redirect("ExamCompleted.aspx"); // Redirect to exam completed page
        }
        else
        {
            TimerLabel.Text = $"{timeRemaining.Minutes}m {timeRemaining.Seconds}s"; // Update the timer label
        }
    }




    protected void CountdownTimer_Tick(object sender, EventArgs e)
    {
        DateTime examEndTime = (DateTime)Session["ExamEndTime"];
        TimeSpan timeRemaining = examEndTime - DateTime.Now;

        if (timeRemaining <= TimeSpan.Zero)
        {
            TimerLabel.Text = "EXPIRED";
            CountdownTimer.Enabled = false; // Stop the timer
            Response.Redirect("ExamCompleted.aspx"); // Redirect to exam completed page
        }
        else
        {
            TimerLabel.Text = $"{timeRemaining.Minutes}m {timeRemaining.Seconds}s"; // Update the timer label
        }
    }

}