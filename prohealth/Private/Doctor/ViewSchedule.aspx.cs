using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace prohealth.Private.Doctor
{
    public partial class ViewSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set default SelectedDate as today's date in calendar
                Calendar1.SelectedDate = DateTime.Today;

                // Set default start and end date for the week (Monday to Sunday)
                DateTime startDate = DateTime.Today.AddDays(-(int)DateTime.Today.DayOfWeek + 1); // Monday
                DateTime endDate = startDate.AddDays(6); // Sunday

                // Set the start and end dates as the default value for the parameters
                SqlDataSource1.SelectParameters["StartDate"].DefaultValue = startDate.ToString("yyyy-MM-dd");
                SqlDataSource1.SelectParameters["EndDate"].DefaultValue = endDate.ToString("yyyy-MM-dd");

                // Check if the Doctor_ID session variable is set
                if (Session["Doctor_ID"] != null)
                {
                    int doctorId = (int)Session["Doctor_ID"];
                    SqlDataSource1.SelectParameters["DoctorID"].DefaultValue = doctorId.ToString();
                }
                else
                {
                    // Handle the case where Doctor_ID is not set (redirect to an error page)
                    Response.Redirect("ErrorPage.aspx");
                }

                
                GridView1.DataBind();
            }

            if (IsPostBack)
            {
                string startDateStr = Request.Form["startDate"];
                string endDateStr = Request.Form["endDate"];

                if (!string.IsNullOrEmpty(startDateStr) && !string.IsNullOrEmpty(endDateStr))
                {
                    DateTime startDate = DateTime.Parse(startDateStr);
                    DateTime endDate = DateTime.Parse(endDateStr);

                    // Update the SqlDataSource parameters dynamically
                    SqlDataSource1.SelectParameters["StartDate"].DefaultValue = startDate.ToString("yyyy-MM-dd");
                    SqlDataSource1.SelectParameters["EndDate"].DefaultValue = endDate.ToString("yyyy-MM-dd");

                    // Rebind the GridView to reflect the new date range
                    GridView1.DataBind();
                }
            }
        }


        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            // Get the selected date from the calendar
            DateTime selectedDate = Calendar1.SelectedDate;

            // Update the SqlDataSource parameters
            SqlDataSource1.SelectParameters["SelectedDate"].DefaultValue = selectedDate.ToString("yyyy-MM-dd");

            // Check if the Doctor_ID session variable is set
            if (Session["Doctor_ID"] != null)
            {
                int doctorId = (int)Session["Doctor_ID"];
                SqlDataSource1.SelectParameters["DoctorID"].DefaultValue = doctorId.ToString();
            }
            else
            {
                // Handle the case where Doctor_ID is not set
                Response.Redirect("ErrorPage.aspx"); // Example redirect
            }

            // Rebind the GridView to refresh its data
            GridView1.DataBind();
        }
        protected void FilterButton_Click(object sender, EventArgs e)
        {
            if (StartDate.Text != "" && EndDate.Text != "")
            {
                DateTime startDate = DateTime.Parse(StartDate.Text);
                DateTime endDate = DateTime.Parse(EndDate.Text);

                SqlDataSource1.SelectParameters["StartDate"].DefaultValue = startDate.ToString("yyyy-MM-dd");
                SqlDataSource1.SelectParameters["EndDate"].DefaultValue = endDate.ToString("yyyy-MM-dd");

                GridView1.DataBind(); // Rebind the grid with the new date range
            } else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showConfirmationModal",
          "$('#searchModal').modal('show');", true);
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditVitals")
            {
                // Get the index of the row that contains the button that was clicked
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the appointment ID from the DataKeys
                int appointmentId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

                // Load the vital signs for the selected appointment
                LoadVitalSignsForEdit(appointmentId);

                // Show the modal popup after data is loaded
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowPopup", "$('#vitalSignsModal').modal('show');", true);
            }
        }

        private void LoadVitalSignsForEdit(int appointmentId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT Systolic_BP, Diastolic_BP, Heart_Rate, Blood_Glucose, 
                   Respiratory_Rate, Temperature, Reason_For_Visit, 
                   Diagnosis, Doctor_Extra_Notes 
            FROM Appointment_Correct 
            WHERE Appt_No = @AppointmentId";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@AppointmentId", appointmentId);
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            SystolicBPTextBox.Text = reader["Systolic_BP"] != DBNull.Value ? reader["Systolic_BP"].ToString() : string.Empty;
                            DiastolicBPTextBox.Text = reader["Diastolic_BP"] != DBNull.Value ? reader["Diastolic_BP"].ToString() : string.Empty;
                            HeartRateTextBox.Text = reader["Heart_Rate"] != DBNull.Value ? reader["Heart_Rate"].ToString() : string.Empty;
                            BloodGlucoseTextBox.Text = reader["Blood_Glucose"] != DBNull.Value ? reader["Blood_Glucose"].ToString() : string.Empty;
                            RespiratoryRateTextBox.Text = reader["Respiratory_Rate"] != DBNull.Value ? reader["Respiratory_Rate"].ToString() : string.Empty;
                            TemperatureTextBox.Text = reader["Temperature"] != DBNull.Value ? reader["Temperature"].ToString() : string.Empty;
                            ReasonForVisitTextBox.Text = reader["Reason_For_Visit"] != DBNull.Value ? reader["Reason_For_Visit"].ToString() : string.Empty;
                            DiagnosisTextBox.Text = reader["Diagnosis"] != DBNull.Value ? reader["Diagnosis"].ToString() : string.Empty;
                            DoctorExtraNotesTextBox.Text = reader["Doctor_Extra_Notes"] != DBNull.Value ? reader["Doctor_Extra_Notes"].ToString() : string.Empty;
                        }
                    }
                }
            }
        }


    }
}