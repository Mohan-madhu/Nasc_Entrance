using System;
using System.Web.UI.WebControls;

public partial class test: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check if the timer start time is stored in session
            if (Session["TimerStartTime"] == null)
            {
                // If not, start the timer with the specified duration
                StartTimer(60); // Change 60 to the desired duration in seconds
            }
            else
            {
                // If timer start time is stored in session, calculate the remaining time
                TimeSpan elapsedTime = DateTime.Now - (DateTime)Session["TimerStartTime"];
                int remainingTime = (int)((int)ViewState["TimerDuration"] - elapsedTime.TotalSeconds);
                if (remainingTime <= 0)
                {
                    // Time's up, do something
                    TimerLabel.Text = "Time's up!";
                }
                else
                {
                    // Start the timer with the remaining time
                    StartTimer(remainingTime);
                }
            }

            
        }
    }

    private void StartTimer(int durationInSeconds)
    {
        // Set the duration of the timer in seconds
        ViewState["TimerDuration"] = durationInSeconds;
        // Store the timer start time in session
        Session["TimerStartTime"] = DateTime.Now;
        // Start the timer
        Timer1.Enabled = true;
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        int timeLeft = (int)ViewState["TimerDuration"];
        // If time left is greater than 0, update the timer
        if (timeLeft > 0)
        {
            timeLeft--;
            ViewState["TimerDuration"] = timeLeft;
            // Update the timer display
            TimeSpan timeSpan = TimeSpan.FromSeconds(timeLeft);
            TimerLabel.Text = timeSpan.ToString(@"mm\:ss");
        }
        else
        {
            // Time's up, do something
            Timer1.Enabled = false; // Stop the timer
            TimerLabel.Text = "Time's up!";
        }
    }

   
}
