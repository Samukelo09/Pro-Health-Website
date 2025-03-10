using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace prohealth.Private.Doctor
{
    public partial class PatientInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (!IsPostBack)
                {
                    if (Session["Doctor_ID"] != null)
                    {
                        int doctorId = (int)Session["Doctor_ID"];
                        LoadAppointmentCount(doctorId);
                        GetDRName(doctorId);
                        Display30DayEarnings();
                        LoadLast30DaysAppointments();
                        DisplayMostCommonReason();
                    }
                    else
                    {
                        lblPatientsNo.Text = "Doctor ID not found.";
                    }
                }
            

        }
        private void LoadAppointmentCount(int doctorId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) AS AppointmentCount FROM Appointment_Correct WHERE Doctor_ID = @DoctorID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@DoctorID", doctorId);
                    conn.Open();
                    object result = cmd.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        int appointmentCount = Convert.ToInt32(result);
                        lblPatientsNo.Text = appointmentCount.ToString();
                        lbllblPatientsNo.Text = "Number Of Patients Visited";
                    }
                    else
                    {
                        lblPatientsNo.Text = "0";
                    }
                }
            }
        }
        private void GetDRName(int doctorId)
        {
            
            if(doctorId == 2)
            {
                DrNameLabel.Text = "Welcome, Dr Zolile Mzobe";
                string imagePath = "../../Material/M1PROJECTMATERIAL/INAPPPIC/dr2.jpg"; // Virtual path
                drimage.ImageUrl = ResolveUrl(imagePath);
            } else if(doctorId == 1)
            {
                DrNameLabel.Text = "Welcome, Dr Siphilele Mkhize";
            }
            else if (doctorId == 3)
            {
                DrNameLabel.Text = "Welcome, Dr Olwethu Nxasana";
            }
            else if (doctorId == 4)
            {
                DrNameLabel.Text = "Welcome, Dr Nkanyezi Ngobese";
            }
            else if (doctorId == 5)
            {
                DrNameLabel.Text = "Welcome, Dr Samukelo Mkhize";
            }
        }
        private void Display30DayEarnings()
        {
            int doctorId = (int)Session["Doctor_ID"]; // Ensure doctor ID is in the session
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT SUM(Appointment_Correct.Amount_Paid) AS TotalEarnings
            FROM Appointment_Correct
            WHERE Doctor_ID = @DoctorId
            AND Date >= DATEADD(day, -30, GETDATE())";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@DoctorId", doctorId);
                    conn.Open();

                    object result = cmd.ExecuteScalar();
                    decimal totalEarnings = (result != DBNull.Value) ? Convert.ToDecimal(result) : 0;

                    lblEarnings.Text = $"Earnings in 30 days{totalEarnings:C}";
                }
            }
        }
        protected void LoadLast30DaysAppointments()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Appointment_Correct WHERE Doctor_ID = @DoctorID AND Date >= DATEADD(day, -30, GETDATE())";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@DoctorID", Session["Doctor_ID"]);  // Assuming you have the doctor ID in session

                    conn.Open();
                    int appointmentCount = (int)cmd.ExecuteScalar();
                    lbllblAppointments.Text = "Number of appointments in the last 30 days";
                    lblAppointment.Text = $"{appointmentCount}";
                }
            }
        }
        protected void DisplayMostCommonReason()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 1 Diagnosis, COUNT(*) AS VisitCount FROM Appointment_Correct " +
                               "WHERE Doctor_ID = @DoctorID AND Date >= DATEADD(DAY, -30, GETDATE()) " +
                               "GROUP BY Diagnosis ORDER BY VisitCount DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@DoctorID", Session["Doctor_ID"]);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string reason = reader["Diagnosis"].ToString();
                    int visitCount = (int)reader["VisitCount"];
                    lbllblDiagnosis.Text = $"Most Common Reason: {reason}";
                    lblDiagnosis.Text = $"(Count: {visitCount})";
                }
                else
                {
                    lblDiagnosis.Text = "No data available for the past 30 days.";
                }
            }
        }
       




    }
}