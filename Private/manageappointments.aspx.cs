using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace prohealth.Private
{
    public partial class _2ndaddappointment : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            int patientId = (int)Session["Patient_ID"];

            if (!IsPostBack)
            {
                DateTime startDate = DateTime.Today.AddDays(-(int)DateTime.Today.DayOfWeek + 1); // Monday
                DateTime endDate = startDate.AddDays(6);
                SqlDataSource1.SelectParameters["StartDate"].DefaultValue = startDate.ToString("yyyy-MM-dd");
                SqlDataSource1.SelectParameters["EndDate"].DefaultValue = endDate.ToString("yyyy-MM-dd");
                

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
                    Appointments.DataBind();
                }
            }

        }
        private bool showDeleteButton = true;

        protected void Appointments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteAppointment")
            {
                // Retrieve the appointment ID from CommandArgument
                int appointmentId = Convert.ToInt32(e.CommandArgument);

                // Fetch the appointment date for validation
                GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                // Assuming "Date" is the first column (index 0); adjust index as needed
                DateTime appointmentDate = Convert.ToDateTime(row.Cells[0].Text);

                // Check if the appointment date is more than 24 hours from now
                if ((appointmentDate - DateTime.Now).TotalHours > 24)
                {
                    // Call delete method if it passes the date check
                    DeleteAppointment(appointmentId);
                }
                else
                {
                    StatusLabel.CssClass = "text-danger";
                    StatusLabel.Text = "You cannot delete an appointment within 24 hours of the scheduled time.";
                }
            }

            if(e.CommandName == "EditVitals")
            {
                // Get the index of the row that contains the button that was clicked
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                // Get the appointment ID from the DataKeys
                int appointmentId = Convert.ToInt32(Appointments.DataKeys[rowIndex].Value);

                // Load the vital signs for the selected appointment
                LoadVitalSignsForEdit(appointmentId);

                // Show the modal popup after data is loaded
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowPopup", "$('#vitalSignsModal').modal('show');", true);
            }
        }


        private void DeleteAppointment(int appointmentId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"DELETE FROM Appointment_Correct WHERE Appt_No = @Appointment_ID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Appointment_ID", appointmentId);

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        StatusLabel.CssClass = "text-success";
                        StatusLabel.Text = "Appointment deleted successfully.";
                    }
                    else
                    {
                        StatusLabel.CssClass = "text-danger";
                        StatusLabel.Text = "Failed to delete appointment. It may not exist.";
                    }
                }
            }
            Appointments.DataBind();
        }


        protected void Search_Click(object sender, EventArgs e)
        {
            DateTime startDate = DateTime.Parse(StartDate.Text);
            DateTime endDate = DateTime.Parse(EndDate.Text);

            SqlDataSource1.SelectParameters["StartDate"].DefaultValue = startDate.ToString("yyyy-MM-dd");
            SqlDataSource1.SelectParameters["EndDate"].DefaultValue = endDate.ToString("yyyy-MM-dd");

            Appointments.DataBind();
        }

        protected void btnUpcoming_Click(object sender, EventArgs e)
        {
            showDeleteButton = true; // Allow delete for upcoming appointments

            // Set the SelectCommand for upcoming appointments
            SqlDataSource1.SelectCommand = @"SELECT Appointment_Correct.Date, Appointment_Correct.Payment_Status, 
        Appointment_Correct.Amount_Paid, Appointment_Correct.VAT, Appointment_Correct.Change, 
        Appointment_Correct.Reason_For_Visit, Appointment_Correct.Doctor_Extra_Notes, 
        Timeslot.Start_Time, Doctor.Doctor_Name, Doctor.Doctor_Surname, 
        Appointment_Correct.Patient_ID, Appointment_Correct.Appt_No 
        FROM Appointment_Correct 
        INNER JOIN Doctor ON Appointment_Correct.Doctor_ID = Doctor.Doctor_ID 
        INNER JOIN Patient ON Appointment_Correct.Patient_ID = Patient.Patient_Id 
        INNER JOIN Timeslot ON Appointment_Correct.Appt_Timeslot_ID = Timeslot.Timeslot_ID 
        WHERE Appointment_Correct.Date BETWEEN @StartDate AND @EndDate
        AND Appointment_Correct.Date >= GETDATE() 
        AND Appointment_Correct.Patient_ID = @PatientId";

            Appointments.DataBind();

        }

        protected void btnPast_Click(object sender, EventArgs e)
        {
            showDeleteButton = false;
            SqlDataSource1.SelectCommand = @"SELECT Appointment_Correct.Date, Appointment_Correct.Payment_Status, 
        Appointment_Correct.Amount_Paid, Appointment_Correct.VAT, Appointment_Correct.Change, 
        Appointment_Correct.Reason_For_Visit, Appointment_Correct.Doctor_Extra_Notes, 
        Timeslot.Start_Time, Doctor.Doctor_Name, Doctor.Doctor_Surname, 
        Appointment_Correct.Patient_ID, Appointment_Correct.Appt_No 
        FROM Appointment_Correct 
        INNER JOIN Doctor ON Appointment_Correct.Doctor_ID = Doctor.Doctor_ID 
        INNER JOIN Patient ON Appointment_Correct.Patient_ID = Patient.Patient_Id 
        INNER JOIN Timeslot ON Appointment_Correct.Appt_Timeslot_ID = Timeslot.Timeslot_ID 
        WHERE Appointment_Correct.Date BETWEEN @StartDate AND @EndDate
        AND Appointment_Correct.Date < GETDATE() 
        AND Appointment_Correct.Patient_ID = @PatientId";

            Appointments.DataBind();
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