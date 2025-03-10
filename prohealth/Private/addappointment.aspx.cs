using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace prohealth.Private
{
    public partial class addappointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Get today's date in the format YYYY-MM-DD
                string todayDate = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

                // Set the min attribute for the date picker
                dateSelect.Attributes["min"] = todayDate;

                // Optional: Set a hidden field to store today's date
                TodayDate.Value = todayDate; 
            }
        }



        protected void DateSelect_TextChanged(object sender, EventArgs e)
        {
            int doctorId = GetSelectedDoctorId(); // Retrieve the selected doctor ID
            int patientId = (int)Session["Patient_ID"]; // Retrieve the logged-in patient's ID

            if (doctorId != -1 && patientId != -1) // Ensure both doctor and patient IDs are valid
            {
                SqlDataSource1.SelectCommand = @"
        SELECT Timeslot_ID, Start_Time 
        FROM Timeslot 
        WHERE Timeslot_ID NOT IN 
        (
            SELECT Appt_Timeslot_ID 
            FROM Appointment_Correct 
            WHERE Date = @SelectedDate 
              AND (Doctor_ID = @DoctorID OR Patient_ID = @PatientID)
        )";

                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("SelectedDate", dateSelect.Text);
                SqlDataSource1.SelectParameters.Add("DoctorID", doctorId.ToString());
                SqlDataSource1.SelectParameters.Add("PatientID", patientId.ToString());

                TimePicker.DataBind(); // Rebind the dropdown with available timeslots
            }
            else
            {
                ErrorMessage.Text = "Please select a doctor and ensure you are logged in.";
            }
        }



        protected void Makeappt_Click(object sender, EventArgs e)
        {
            // Assuming you have controls for date and timeslot
            DateTime selectedDate = DateTime.Parse(dateSelect.Text); // Date from your date picker
            int timeslotId = int.Parse(TimePicker.SelectedValue); // Timeslot ID from your dropdown
            int doctorId = GetSelectedDoctorId(); // Get the selected doctor ID (implement this logic)
            string email = GetLoggedInUserEmail(); // Get the logged-in user's email

            int patientId = GetPatientIdByEmail(email); // Get Patient ID

            if (patientId != -1) // Check if patient ID was found
            {
                CreateAppointment(selectedDate, timeslotId, doctorId, patientId); // Create appointment
               
                ScriptManager.RegisterStartupScript(this, GetType(), "showConfirmationModal",
               "$('#confirmModal').modal('show');", true);
            }
            else
            {
                
                ErrorMessage.Text = "Patient not found. Please check your registration.";
            }
        }

        private string GetLoggedInUserEmail()
        {
            var userId = User.Identity.GetUserId(); // Get the logged-in user's ID
            var userManager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = userManager.FindById(userId); // Get the user object

            return user?.Email; // Return the user's email
        }

        private int GetPatientIdByEmail(string email)
        {
            int patientId = -1; // Default value if not found

            // Your database connection string
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Patient_ID FROM Patient WHERE Patient_Email = @Email";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    conn.Open();
                    var result = cmd.ExecuteScalar(); // Execute the query and get the first column

                    if (result != null)
                    {
                        patientId = Convert.ToInt32(result); // Convert to int if found
                    }
                }
            }

            return patientId;
        }

        private void CreateAppointment(DateTime appointmentDate, int timeslotId, int doctorId, int patientId)
        {
            
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Appointment_Correct (Date, Appt_Timeslot_ID, Doctor_ID, Patient_ID, Booking_Status_ID) VALUES (@Date, @Appt_Timeslot_ID, @Doctor_ID, @Patient_ID, @Booking_Status_ID)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Date", appointmentDate);
                    cmd.Parameters.AddWithValue("@Appt_Timeslot_ID", timeslotId);
                    cmd.Parameters.AddWithValue("@Doctor_ID", doctorId);
                    cmd.Parameters.AddWithValue("@Patient_ID", patientId);
                    cmd.Parameters.AddWithValue("@Booking_Status_ID", 1);

                    conn.Open();
                    cmd.ExecuteNonQuery(); // Execute the insert command
                }
            }
            
            
           
        }


        private int GetSelectedDoctorId()
        {
            // Get the value from the hidden field
            string doctorIdStr = SelectedDoctorId.Value; // Assuming you have this hidden field defined
            if (int.TryParse(doctorIdStr, out int doctorId))
            {
                return doctorId; // Return the selected Doctor_ID
            }
            return -1; // Indicating no doctor was selected
        }


    }
}