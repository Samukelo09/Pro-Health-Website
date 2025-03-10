using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using prohealth.Models;
using System.Configuration;
using System.Data.SqlClient;

namespace prohealth.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            // Enable this once you have account confirmation enabled for password reset functionality
            //ForgotPasswordHyperLink.NavigateUrl = "Forgot";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);

            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void LogIn(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signinManager = Context.GetOwinContext().Get<ApplicationSignInManager>();

            if (IsValid)
            {
                var result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);

                switch (result)
                {
                    case SignInStatus.Success:
                        // Clear any previous session
                        Session.Clear();

                        // Identify the user type and set the session variable
                        var userType = GetUserTypeByEmail(Email.Text);
                        string redirectUrl = string.Empty;

                        if (userType == "Patient")
                        {
                            Session["UserRole"] = "Patient";
                            int patientId = GetPatientIdByEmail(Email.Text);
                            Session["Patient_ID"] = patientId;
                            redirectUrl = "~/Private/manageappointments.aspx"; 
                        }
                        else if (userType == "Doctor")
                        {
                            Session["UserRole"] = "Doctor";
                            int doctorId = GetDoctorIdByEmail(Email.Text);
                            Session["Doctor_ID"] = doctorId;
                            redirectUrl = "/Private/Doctor/PatientInfo.aspx"; 
                        }
                        else if (userType == "Owner")
                        {
                            Session["UserRole"] = "Owner";
                            int ownerId = GetOwnerIdByEmail(Email.Text);
                            Session["Owner_ID"] = ownerId;
                            redirectUrl = "~/Private/Owner/Reports.aspx";
                        }
                        else
                        {
                            FailureText.Text = "Invalid user type.";
                            ErrorMessage.Visible = true;
                            return;
                        }

                        // Redirect to the specific dashboard for the role
                        Response.Redirect(redirectUrl);
                        break;

                    case SignInStatus.LockedOut:
                        Response.Redirect("/Account/Lockout");
                        break;

                    case SignInStatus.RequiresVerification:
                        Response.Redirect(string.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
                            Request.QueryString["ReturnUrl"],
                            RememberMe.Checked), true);
                        break;

                    case SignInStatus.Failure:
                    default:
                        FailureText.Text = "Invalid login attempt";
                        ErrorMessage.Visible = true;
                        break;
                }
            }
        }



        private int GetPatientIdByEmail(string email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Patient_Id FROM Patient WHERE Patient_Email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        return Convert.ToInt32(result);
                    }
                }
            }
            return -1;
        }

        private int GetDoctorIdByEmail(string email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Doctor_ID FROM Doctor WHERE Doctor_Email = @Email"; // Update your query based on your DB schema
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        return Convert.ToInt32(result);
                    }
                }
            }
            return -1; // Return -1 if no doctor found
        }

        private int GetOwnerIdByEmail(string email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Owner_ID FROM Owner WHERE Owner_Email = @Email"; // Update your query based on your DB schema
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        return Convert.ToInt32(result);
                    }
                }
            }
            return -1; // Return -1 if no owner found
        }
        private string GetUserTypeByEmail(string email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["G7Wst2024ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Combined query to check user roles in one go
                string query = @"
            SELECT TOP 1 
                CASE 
                    WHEN EXISTS (SELECT 1 FROM Patient WHERE Patient_Email = @Email) THEN 'Patient'
                    WHEN EXISTS (SELECT 1 FROM Doctor WHERE Doctor_Email = @Email) THEN 'Doctor'
                    WHEN EXISTS (SELECT 1 FROM Owner WHERE Owner_Email = @Email) THEN 'Owner'
                    ELSE 'Unknown'
                END AS UserType";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    return result != null ? result.ToString() : "Unknown";
                }
            }
        }

        /* private string GetDrDetails(int doctorId)
          {
              // Example of fetching doctor's data from the database (ADO.NET or EF)
              using (SqlConnection conn = new SqlConnection("G7Wst2024ConnectionString"))
              {
                  string query = "SELECT Doctor_Name, Doctor_Surname FROM Doctors WHERE Doctor_ID = @DoctorID";
                  SqlCommand cmd = new SqlCommand(query, conn);
                  cmd.Parameters.AddWithValue("@DoctorID", doctorId); // assuming doctorId is available
                  conn.Open();
                  SqlDataReader reader = cmd.ExecuteReader();
                  if (reader.Read())
                  {
                      // Assuming session is initialized after login
                      Session["Doctor_Name"] = reader["Doctor_Name"].ToString();
                      Session["Doctor_Surname"] = reader["Doctor_Surname"].ToString();

                  }
              }

          } */



    }
}